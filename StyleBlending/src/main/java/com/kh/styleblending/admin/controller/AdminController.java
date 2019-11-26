package com.kh.styleblending.admin.controller;

import java.io.File;
import java.io.IOException;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
import com.kh.styleblending.admin.model.service.AdminService;
import com.kh.styleblending.admin.model.vo.Ad;
import com.kh.styleblending.admin.model.vo.Declare;
import com.kh.styleblending.admin.model.vo.PageInfo;
import com.kh.styleblending.admin.model.vo.Pagination;
import com.kh.styleblending.admin.model.vo.Statistics;
import com.kh.styleblending.main.model.vo.Notice;
import com.kh.styleblending.member.model.vo.Member;

@Controller
public class AdminController {

	@Autowired
	private AdminService aService;
	
	@RequestMapping("aPage.do")
	public String adminPage(Model model) {
		
		int newBoard = aService.selectNewBcount();
		ArrayList<Member> newMember = aService.selectNewMember();
		int declareCount = aService.selectNoCheckDeclare(); 
		Ad startAd = aService.selectStartAd();
		
		model.addAttribute("newBoard",newBoard).addAttribute("newMember", newMember).addAttribute("declareCount",declareCount).addAttribute("startAd",startAd);
		//System.out.println(newMember);
		return "admin/adminPage";
	}
	
	@RequestMapping("aUser.do")
	public ModelAndView selectUserList(ModelAndView mv, @RequestParam(value="currentPage", defaultValue="1")int currentPage,
									@RequestParam(value="boardLimit", defaultValue="5")int boardLimit) {
		
		int listCount = aService.getMemberListCount();
		
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount, boardLimit);
		
		ArrayList<Member> list = aService.selectMemberList(pi);
		
		// System.out.println("회원리스트" + list +"\n 회원총명수" + listCount);
		
		mv.addObject("pi",pi).addObject("list", list).setViewName("admin/user");
		
		return mv;
	}
	
	@RequestMapping("aDeleteMember.do")
	public String deleteMember(@RequestParam ArrayList mno, Model model) {
		System.out.println(mno);
		int result = aService.deleteMember(mno);
		
		if(result > 0) {			
			return "redirect:aUser.do";
		}else {
			model.addAttribute("msg","회원 탈퇴 실패");
			return "common/errorPage";
		}
	}
	
	@RequestMapping("aDeclare.do")
	public ModelAndView selectDeclareList(ModelAndView mv, @RequestParam(value="currentPage", defaultValue="1")int currentPage,
											@RequestParam(value="select", defaultValue="0") String select, HashMap<String,String> cate,
											@RequestParam(value="boardLimit", defaultValue="5")int boardLimit) {
		
		if(select.equals("1")) {
			cate.put("posting","1" );
		}else if(select.equals("2")) {
			cate.put("free", "2");
		}
		
		int listCount = aService.getDeclareListCount(cate);
		
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount, boardLimit);
		
		
		ArrayList<Declare> list = aService.selectDeclareList(pi,cate);
		
		mv.addObject("pi",pi).addObject("list",list).addObject("cate",cate).setViewName("admin/declare");
		//System.out.println("신고리스트" + list +"\n 신고총횟수" + listCount);
		
		return mv;
	}
	
	@RequestMapping("aDeleteDeclareBoard.do")
	public String deleteDeclareBoard(@RequestParam ArrayList dno, @RequestParam int[] type,@RequestParam int[] bno, Model model) {
		int result1 = 0;
		
		for(int i=0; i<type.length; i++) {
			result1 += aService.deleteBoard(type[i], bno[i]);
		}
		
		int result2 = aService.deleteDeclareBoard(dno);
		
		//System.out.println("result1 : " + result1);
		
		if(result1 >=type.length && result2 > 0) {
			
			return "redirect:aDeclare.do";
		}else {
			model.addAttribute("msg","신고 게시물 삭제 실패");
			return "common/errorPage";
		}
		
	}
	
	@RequestMapping("aupdateIsCheck.do")
	public ModelAndView updateIsCheck(String dno, ModelAndView mv, String bno, int type) {
		
		int result = aService.updateIsCheck(dno);
		//System.out.println(dno);
		if(result > 0) {
			
			if(type== 1) { // 포스팅
				mv.addObject("id",bno).setViewName("redirect:pInfo.do");
			}else { // 자유게시판
				mv.addObject("bno",bno).setViewName("redirect:bdetail.do");
			}
		}else {
			mv.addObject("msg","신고게시물 조회 실패").setViewName("common/errorPage");
		}
		return mv;
	}
	
	
	@RequestMapping("aAdvertisment.do")
	public ModelAndView selectAdList(ModelAndView mv, @RequestParam(value="currentPage",defaultValue="1")int currentPage,
								String keyword,	@RequestParam(value="boardLimit", defaultValue="5")int boardLimit) {
		
		int listCount = aService.getAdListCount();
		
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount, boardLimit);
		
		ArrayList<Ad> list;
		if(keyword != null) {
			list = aService.selectAdSearchList(pi, keyword);
			//System.out.println("검색노노");
		}else {
			//System.out.println("검색함");
			list = aService.selectAdList(pi);						
		}
		
		ArrayList<Ad> newList = aService.selectAdNewList();
		Ad startAd = aService.selectStartAd();
		
		mv.addObject("pi",pi).addObject("list",list).addObject("startAd",startAd).addObject("newList", newList).addObject("keyword",keyword).setViewName("admin/advertisment");
		
		return mv;
	}

	/*
	@RequestMapping("aSearchAdname.do")
	public void searchAdname(String keyword, HttpServletResponse response) throws JsonIOException, IOException {
		
		ArrayList<Ad> ad = aService.selectAdSearchList(keyword);
		
		response.setContentType("application/json; charset=UTF-8");
	      
	      Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
	      
	      gson.toJson(ad, response.getWriter());
	}
	*/
	
	// 광고등록+결제
	@ResponseBody
	@RequestMapping("aInsertAd.do")
	public String insertAd(HttpServletResponse response, Ad ad, HttpServletRequest request,
							@RequestParam(value="uploadFile", required=false) MultipartFile file) {

		if(!file.getOriginalFilename().equals("")) {// 파일 존재시
			
			String renameFileName = saveFile(file,request);
			
			ad.setOriginalImg(file.getOriginalFilename());
			ad.setRenameImg(renameFileName);
		}
		
		int result = aService.insertAd(ad);
		
		if(result > 0) {
			return "success";
		}else {
			return "fail";
		}
	
	}

	// 광고 사진 업로드한 파일명 반환 메소드
	public String saveFile(MultipartFile file, HttpServletRequest request) {
		
		String root = request.getSession().getServletContext().getRealPath("resources");
		String savePath = root + "/upload/advertisment";
		
		File folder = new File(savePath);
		
		if(!folder.exists()) {
			folder.mkdirs();
		}
		
		String originFileName = file.getOriginalFilename();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		
		String renameFileName = sdf.format(new Date(System.currentTimeMillis())) + "." + originFileName;
		
		String renamePath = savePath + "/" + renameFileName;
		
		try {
			file.transferTo(new File(renamePath));
			
		} catch (IllegalStateException | IOException e) {
			e.printStackTrace();
		}
		
		return renameFileName;
		
	}
	
	@RequestMapping("aInsertAdView.do")
	public String insertAdView() {
		return "admin/adInsertForm";
	}
	
	
	@RequestMapping("aUpdateStartAd.do")
	public String updateStartAd(String adno, Model model) {
		
		int result = aService.updateStartAd(adno);
		//System.out.println(adno);
		if(result > 0) {
			model.addAttribute("msg", "광고 신청이 정상적으로 이루어졌습니다. 관리자 검토 후 승인시 진행됩니다.");
			return "redirect:aAdvertisment.do";
		}else {
			model.addAttribute("msg", "광고 등록 실패");
			return "common/errorPage";
		}
	}
	
	@RequestMapping("aUpdateEndAd.do")
	public ModelAndView updateEndAd(String adno, ModelAndView mv) {
		
		System.out.println(adno);
		
		int result = aService.updateEndAd(adno);
		
		if(result > 0) {
			mv.addObject("msg", "정상적으로 광고 종료처리 되었습니다.").setViewName("redirect:aAdvertisment.do");
		}else {
			mv.addObject("msg","광고 마감 실패").setViewName("common/errorPage");
		}
		
		return mv;
	}
	
	@RequestMapping("aStatistics.do")
	public String statistics(Model model) {
		
		return "admin/statistics";
	}
	
	@ResponseBody
	@RequestMapping(value="aChart.do", produces="application/json; charset=UTF-8")
	public String statistics() {
		
		ArrayList<Statistics>  statistics = aService.selectMemberCount();
		//System.out.println(statistics);
		
		System.out.println(statistics);
		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
		
		return gson.toJson(statistics);
	}
	
	@RequestMapping("aNotice.do")
	public ModelAndView notice(ModelAndView mv) {
		
		ArrayList<Notice> list = aService.selectNoticeList();
		
		mv.addObject("list", list).setViewName("admin/notice");
		
		return mv;
	}
	
	
	
	
	
	
	
	
}
