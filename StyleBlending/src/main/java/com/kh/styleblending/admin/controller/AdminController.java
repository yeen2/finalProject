package com.kh.styleblending.admin.controller;

import java.io.File;
import java.io.IOException;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
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
import com.kh.styleblending.admin.model.service.AdminService;
import com.kh.styleblending.admin.model.vo.Ad;
import com.kh.styleblending.admin.model.vo.Declare;
import com.kh.styleblending.admin.model.vo.PageInfo;
import com.kh.styleblending.admin.model.vo.Pagination;
import com.kh.styleblending.admin.model.vo.Statistics;
import com.kh.styleblending.main.model.vo.Notice;
import com.kh.styleblending.member.model.vo.Member;
import com.kh.styleblending.posting.model.vo.Hash;
import com.kh.styleblending.posting.model.vo.Style;

@Controller
public class AdminController {

	@Autowired
	private AdminService aService;
	
	@RequestMapping("aPage.do")
	public String adminPage(Model model, HttpSession session) {
		
		String admin = ((Member)session.getAttribute("loginUser")).getEmail();
		
		int newBoard = aService.selectNewBcount();
		ArrayList<Member> newMember = aService.selectNewMember();
		int declareCount = aService.selectNoCheckDeclare(); 
		Ad startAd = aService.selectStartAd();
		ArrayList<Hash> hashRank = aService.selectHashRank();
		
		if(admin.equals("admin")) { // 관리자일때 
			model.addAttribute("newBoard",newBoard).addAttribute("newMember", newMember).addAttribute("declareCount",declareCount).addAttribute("startAd",startAd).addAttribute("hashRank",hashRank);
			//System.out.println(newMember);
			return "admin/adminPage";
			
		}else { // 관리자가 아닐시
			model.addAttribute("msg", "접근권한이 없습니다.");
			return "common/errorPage";
		}
		
	}
	
	@RequestMapping("aUser.do")
	public ModelAndView selectUserList(ModelAndView mv, @RequestParam(value="currentPage", defaultValue="1")int currentPage,
									@RequestParam(value="boardLimit", defaultValue="10")int boardLimit,
									@RequestParam(value="keyword", defaultValue="")String keyword) {
		
		int listCount = aService.getMemberListCount(keyword);
		
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount, boardLimit);
		
		ArrayList<Member> list = aService.selectMemberList(pi, keyword);
		
		// System.out.println("회원리스트" + list +"\n 회원총명수" + listCount);
		
		mv.addObject("pi",pi).addObject("list", list).addObject("keyword", keyword).setViewName("admin/user");
		
		return mv;
	}
	
	@RequestMapping("aDeleteMember.do")
	public String deleteMember(@RequestParam ArrayList mno, Model model, HttpSession session) {
		System.out.println(mno);
		int result = aService.deleteMember(mno);
		
		if(result > 0) {	
			session.setAttribute("msg","정상적으로 회원 탈퇴에 성공하셨습니다.");
			return "redirect:aUser.do";
		}else {
			model.addAttribute("msg","회원 탈퇴 실패");
			return "common/errorPage";
		}
	}
	
	@RequestMapping("aDeclare.do")
	public ModelAndView selectDeclareList(ModelAndView mv, @RequestParam(value="currentPage", defaultValue="1")int currentPage,
											@RequestParam(value="select", defaultValue="0") String select, HashMap<String,String> cate,
											@RequestParam(value="boardLimit", defaultValue="10")int boardLimit) {
		
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
	public String deleteDeclareBoard(@RequestParam ArrayList dno, @RequestParam int[] type,@RequestParam int[] bno, Model model,HttpSession session) {
		int result1 = 0;
		
		for(int i=0; i<type.length; i++) {
			result1 += aService.deleteBoard(type[i], bno[i]);
		}
		
		int result2 = aService.deleteDeclareBoard(dno);
		
		//System.out.println("result1 : " + result1);
		
		if(result1 >=type.length && result2 > 0) {
			session.setAttribute("msg", "신고 게시물 삭제 처리가 완료되었습니다.");
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
	public ModelAndView getSearchAdList(ModelAndView mv, @RequestParam(value="currentPage",defaultValue="1")int currentPage,
			@RequestParam(value="keyword",defaultValue="")String keyword, @RequestParam(value="boardLimit", defaultValue="5")int boardLimit) {

		HashMap<String, String> map = new HashMap<String, String>();
		map.put("keyword", keyword);
		
		System.out.println("keyword : " + map);
		int listCount = aService.getAdListCount(map);
		
		System.out.println("listCount : "+listCount);
		
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount, boardLimit);
		System.out.println("pi : " + pi);
		ArrayList<Ad> list = aService.selectAdList(pi, map);	
		
		System.out.println("list : " + list);
		ArrayList<Ad> newList = aService.selectAdNewList();
		Ad startAd = aService.selectStartAd();
		
		mv.addObject("pi",pi).addObject("list",list).addObject("startAd",startAd).addObject("newList", newList).addObject("keyword",keyword).setViewName("admin/advertisment");
		
		return mv;
	}
	
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
	
	// 업로드 되어있는 광고이미지파일 삭제용 메소드
	public void deleteFile(String renameFileName, HttpServletRequest request) {
		String root = request.getSession().getServletContext().getRealPath("resources");
		String savePath = root + "/upload/advertisment";
		
		File f = new File(savePath + "/" + renameFileName);
		
		if(f.exists()) {
			f.delete();
		}
	}
	
	@RequestMapping("aInsertAdView.do")
	public String insertAdView() {
		return "admin/adInsertForm";
	}
	
	
	@RequestMapping("aUpdateStartAd.do")
	public String updateStartAd(String adno, Model model,HttpServletRequest request, HttpSession session) {
		
		Ad startAd = aService.selectStartAd();
		// 진행중인광고 첨부파일 존재할 경우
		if(startAd != null && startAd.getOriginalImg() != null) {
			// 업로드되어잇는 파일 삭제
			deleteFile(startAd.getRenameImg(),request); // 삭제하고자하는 파일명과  request 전달
		}
		
		int result = aService.updateStartAd(adno);
		//System.out.println(adno);
		if(result > 0) {
			session.setAttribute("msg", "광고가 진행중으로 변경되었습니다.");
			return "redirect:aAdvertisment.do";
		}else {
			model.addAttribute("msg", "광고 등록 실패");
			return "common/errorPage";
		}
	}
	
	@RequestMapping("aUpdateEndAd.do")
	public ModelAndView updateEndAd(String adno, ModelAndView mv, HttpServletRequest request, HttpSession session) {
		
		//System.out.println(adno);
		Ad startAd = aService.selectStartAd();
		// 진행중인광고 첨부파일 존재할 경우
		if(startAd.getOriginalImg() != null) {
			// 업로드되어잇는 파일 삭제
			deleteFile(startAd.getRenameImg(),request); // 삭제하고자하는 파일명과  request 전달
		}
		
		int result = aService.updateEndAd(adno);
		
		if(result > 0) {
			session.setAttribute("msg", "정상적으로 광고 종료처리 되었습니다.");
			mv.addObject("msg", "정상적으로 광고 종료처리 되었습니다.").setViewName("redirect:aAdvertisment.do");
		}else {
			mv.addObject("msg","광고 마감 실패").setViewName("common/errorPage");
		}
		
		return mv;
	}
	
	@RequestMapping("aStatistics.do")
	public ModelAndView statistics(ModelAndView mv) {
		
		ArrayList<Statistics> totalCount = aService.totalCount();
		//System.out.println(totalCount);
		mv.addObject("totalCount", totalCount).setViewName("admin/statistics");
		
		return mv;
		
	}
	
	// chart ajax(6개월)
	@ResponseBody
	@RequestMapping(value="aChart.do", produces="application/json; charset=UTF-8")
	public String statistics() {
		
		ArrayList<Statistics>  statistics = aService.selectMemberCount();
		//System.out.println(statistics);
		
		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
		
		return gson.toJson(statistics);
	}
	
	// chart ajax(일별)
	@ResponseBody
	@RequestMapping(value="aDayChart.do", produces="application/json; charset=UTF-8")
	public String dayStatistics() {
		ArrayList<Statistics> statistics = aService.selectDayCount();
		
		Gson gson = new GsonBuilder().setDateFormat("MM-dd").create();
		
		return gson.toJson(statistics);
	}
	
	// chart 카테고리별
	@ResponseBody
	@RequestMapping(value="aCateChart.do", produces="application/json; charset=UTF-8")
	public String selectCateRank() {
		ArrayList<Style> cateRank = aService.selectCateRank();
		
		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
		//System.out.println(cateRank);
		return gson.toJson(cateRank);
		
	}
	
	// chart 브랜드별
	@ResponseBody
	@RequestMapping(value="aBrandChart.do", produces="application/json; charset=UTF-8")
	public String selectBrandRank() {
		ArrayList<Style> BrandRank = aService.selectBrandRank();
		
		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
		//System.out.println(BrandRank);
		return gson.toJson(BrandRank);
		
	}
	
	@ResponseBody
	@RequestMapping(value="aColorChart.do", produces="application/json; charset=UTF-8")
	public String selectColorRank() {
		ArrayList<Style> colorRank = aService.selectColorRank();
		
		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
		
		return gson.toJson(colorRank);
	}
	
	// 관리자 공지사항
	@RequestMapping("aNotice.do")
	public ModelAndView notice(ModelAndView mv, @RequestParam(value="currentPage",defaultValue="1")int currentPage, @RequestParam(value="boardLimit", defaultValue="5")int boardLimit) {
		
		int listCount = aService.getNoticeListCount();
		
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount, boardLimit);
		
		ArrayList<Notice> list = aService.selectNoticeAdminList(pi);
		//System.out.println(list);
		mv.addObject("list", list).addObject("pi",pi).setViewName("admin/notice");
		
		return mv;
	}
	

	
	
	
	
	
	
}
