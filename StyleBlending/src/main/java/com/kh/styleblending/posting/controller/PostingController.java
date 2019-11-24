package com.kh.styleblending.posting.controller;

import java.io.File;
import java.io.IOException;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.kh.styleblending.member.model.vo.Member;
import com.kh.styleblending.posting.model.service.PostingService;
import com.kh.styleblending.posting.model.vo.Declare;
import com.kh.styleblending.posting.model.vo.Posting;
import com.kh.styleblending.posting.model.vo.PostingReply;
import com.kh.styleblending.posting.model.vo.SelectPosting;
import com.kh.styleblending.posting.model.vo.Style;

@Controller
public class PostingController {

	@Autowired
	private PostingService pService;
	
	// 좋아요,신고 정보 보여주려면 loginUser정보 가져와야 함
	// 매개변수로 int id 추가해야함
	@RequestMapping("pInfo.do")
	public ModelAndView info(int id, ModelAndView mv, HttpSession session) {
		
		Member loginUser = (Member)session.getAttribute("loginUser");
		Posting p;
		//SelectPosting sp = new SelectPosting();
		//sp.setId(id);
		
		
		if(loginUser != null) {
			//sp.setMno(loginUser.getMno());
			p = pService.selectOnePosting(id, loginUser.getMno());
		}else {
			//sp.setMno(-10000);
			p = pService.selectOnePosting(id, -10000);
		}
		
		ArrayList<Style> s = pService.selectStyle(id);
		
		if(p != null) {
			System.out.println(p);
			mv.addObject("p", p).addObject("s", s).setViewName("posting/info");
		}else {
			mv.addObject("msg", "게시글 상세조회 실패").setViewName("common/errorPage");
		}
		
		return mv;
	}
	
	// 포스팅등록
	@RequestMapping("pInsertForm.do")
	public String insertForm() {
		return "posting/insert";
	}
	
	// 포스팅등록 처리
	@RequestMapping("pInsert.do")
	public String insert(Posting p, HttpServletRequest request, Model model,
								@RequestParam(value="fileImg", required=false) MultipartFile file,
								String[] cate, String[] brand, String[] color) {
		
		// 1. 첨부파일 처리
		if(!file.getOriginalFilename().equals("")) { // 첨부파일이 넘어오는 경우
			String renameFileName = saveFile(file, request);
			
			p.setOriginalImg(file.getOriginalFilename());
			p.setRenameImg(renameFileName);
		}
		
		System.out.println(p);
		
		// 2. 해시태그 추출
		String str = p.getContent();
		String [] strArr = str.split(" ");
		String hashtag = "";
		
		HashMap<String, String> map = new HashMap<>();
		
		for(int i=0; i<strArr.length; i++) {
			if(strArr[i].charAt(0) == '#') {
				hashtag += strArr[i];
				map.put(strArr[i], "<a>"+strArr[i]+"</a>");
			}
		}
		p.setHashtag(hashtag);
		
		//3. #태그는 <a></a>로 감싸기
		String content = p.getContent();
		System.out.println("처음 content : " + content );
		String con = "";
		// 첫 #를 <a> 
		for (String key : map.keySet() ) {
			System.out.println("key:"+key+",value:"+map.get(key));

			content = content.replace(key, map.get(key));
		}
		System.out.println("해시태그에 <a>붙임 : " + content);
		
		
		int result = pService.insertPosting(p, cate, brand, color);
		
		if(result > 0) {
			return "redirect:main.do";
		}else {
			model.addAttribute("msg", "포스팅 작성하기 실패");
			return "common/errorPage";
		}
	}

	// 파일 업로드 하고 업로드한 파일명(수정명) 반환하는 메소드 --> 재사용하기 위해 따로 빼둠
	public String saveFile(MultipartFile file, HttpServletRequest request) {
		
		String root = request.getSession().getServletContext().getRealPath("resources");
		String savePath = root + "/upload/posting";
		
		File folder = new File(savePath);
		
		if(!folder.exists()) {
			folder.mkdirs(); // savePath까지의 경로가 존재하지 않다면 폴더 생성
		}
		
		String originFileName = file.getOriginalFilename();
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		
		// 201911051717.PNG
		String renameFileName = sdf.format(new Date(System.currentTimeMillis())) + "." 
								+ originFileName.substring(originFileName.lastIndexOf(".")+1);
		
		// ~~~/resources/buploadFiles/201911051717.PNG
		String renamePath = savePath + "/" + renameFileName;
		
		
		try {
			file.transferTo(new File(renamePath)); // 수정명으로 파일 업로드

		} catch (IllegalStateException | IOException e) {
			e.printStackTrace();
		} 
		
		return renameFileName;
	}
		
	
	// 댓글 목록 가져오기
	@ResponseBody
	@RequestMapping(value="pReplyList.do", produces="application/json; charset=UTF-8")
	public String replyList(int pno) {
		
		ArrayList<PostingReply> list = pService.selectReplyList(pno);
		
		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
		return gson.toJson(list);
		
	}
	
	// 댓글 등록
	@ResponseBody
	@RequestMapping("pReplyInsert.do")
	public String insertReply(PostingReply r) {

		int result = pService.insertReply(r);
		
		if(result > 0) {
			return "success";
		}else {
			return "fail";
		}
	}
	
	// 대댓글 등록
	@ResponseBody
	@RequestMapping("pReReplyInsert.do")
	public String insertReReply(PostingReply r) {

		int result = pService.insertReReply(r);
		
		if(result > 0) {
			return "success";
		}else {
			return "fail";
		}
	}
	
	// 좋아요 추가
	@ResponseBody
	@RequestMapping("pLikeInsert.do")
	public String insertPostingLike(int pno, int mno) {

		int result1 = pService.insertPostingLike(pno, mno);
		int result2 = pService.increasePostingLike(pno);
	
		if(result1 > 0 && result2 > 0) {
			return "success";
		}else {
			return "fail";
		}
	}
	
	// 좋아요 제거
	@ResponseBody
	@RequestMapping("pLikeDelete.do")
	public String deletePostingLike(int pno, int mno) {

		int result1 = pService.deletePostingLike(pno, mno);
		int result2 = pService.decreasePostingLike(pno);
		
		if(result1 > 0 && result2 > 0 ) {
			return "success";
		}else {
			return "fail";
		}
	}
	
	// 실시간 포스팅좋아요숫자 가져오기
	@ResponseBody
	@RequestMapping("getPLikeCount.do")
	public String selectPLikeCount(int pno) {

		String result = Integer.toString(pService.selectPLikeCount(pno));
		return result;
	}
	
	// 로그인 회원의 포스팅좋아요 했는지 체크
	@ResponseBody
	@RequestMapping("getPLikeCheck.do")
	public String selectPLikeCheck(int pno, int mno) {

		String result = Integer.toString(pService.selectPLikeCheck(pno, mno));
		
		return result;
	}

	@RequestMapping("pDeclare.do")
	public ModelAndView insertPDeclare(Declare d, ModelAndView mv) {
		
		int id = d.getBno();
		int result = pService.insertPDeclare(d);
		
		if(result > 0) {
			mv.addObject("msg", "신고하기 성공!").setViewName("redirect:pInfo.do?id="+id);
		}else {
			mv.addObject("msg", "신고하기 실패!").setViewName("common/error");
		}
		
		return mv;
	}
		
		
		
	
	
}
