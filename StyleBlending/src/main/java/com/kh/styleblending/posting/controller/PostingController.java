package com.kh.styleblending.posting.controller;

import java.io.File;
import java.io.IOException;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.styleblending.posting.model.service.PostingService;
import com.kh.styleblending.posting.model.vo.Posting;
import com.kh.styleblending.posting.model.vo.Style;

@Controller
public class PostingController {

	@Autowired
	private PostingService pService;
	
	// 좋아요,신고 정보 보여주려면 loginUser정보 가져와야 함
	@RequestMapping("pInfo.do")
	public String info() {
		return "posting/info";
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
		
		System.out.println(p);
		System.out.println(cate[0]);
		System.out.println(brand[0]);
		System.out.println(color[0]);
		
		// 1. 첨부파일 처리
		if(!file.getOriginalFilename().equals("")) { // 첨부파일이 넘어오는 경우
			String renameFileName = saveFile(file, request);
			
			p.setOriginalImg(file.getOriginalFilename());
			p.setRenameImg(renameFileName);
		}
		
		
		// 2. 해시태그 추출
		String str = p.getContent();
		String [] strArr = str.split(" ");
		String hashtag = "";
		
		for(int i=0; i<strArr.length; i++) {
			if(strArr[i].charAt(0) == '#') {
				hashtag += strArr[i];
			}
		}
		p.setHashtag(hashtag);
		
		
		int result = pService.insertPosting(p, cate, brand, color);
		
		if(result > 0) {
			return "redirect:home.do";
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
		
	
	
	
	
	
}
