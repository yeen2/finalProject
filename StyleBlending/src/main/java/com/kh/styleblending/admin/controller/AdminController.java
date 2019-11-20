package com.kh.styleblending.admin.controller;

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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.styleblending.admin.model.service.AdminService;
import com.kh.styleblending.admin.model.vo.Ad;
import com.kh.styleblending.admin.model.vo.Declare;
import com.kh.styleblending.admin.model.vo.PageInfo;
import com.kh.styleblending.admin.model.vo.Pagination;
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
	public String deleteDeclareBoard(@RequestParam ArrayList dno, Model model) {
		//System.out.println(dnoArr.length);
		//System.out.println(Arrays.toString(dnoArr));
		
		int result = aService.deleteDeclareBoard(dno);
		
		if(result > 0) {			
			return "redirect:aDeclare.do";
		}else {
			model.addAttribute("msg","신고 게시물 삭제 실패");
			return "common/errorPage";
		}
		
	}
	
	
	@RequestMapping("aAdvertisment.do")
	public ModelAndView selectAdList(ModelAndView mv, @RequestParam(value="currentPage",defaultValue="1")int currentPage,
									@RequestParam(value="boardLimit", defaultValue="5")int boardLimit) {
		
		int listCount = aService.getAdListCount();
		
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount,boardLimit);
		
		ArrayList<Ad> list = aService.selectAdList(pi);
		
		mv.addObject("pi",pi).addObject("list",list).setViewName("admin/advertisment");
		
		return mv;
	}
	
	@RequestMapping("aInsertAd.do")
	public String insertAd(HttpSession session, Model model, HttpServletRequest request, 
							@RequestParam(value="uploadFile", required=false) MultipartFile file, Ad ad) {
		
		if(!file.getOriginalFilename().equals("")) {// 파일 존재시
			
			String renameFileName = saveFile(file,request);
			
			ad.setOriginalImg(file.getOriginalFilename());
			ad.setRenameImg(renameFileName);
		}

		session.setAttribute("ad", ad);
	
		Ad add = (Ad)session.getAttribute("ad");
		int result = aService.insertAd(add);
		
		System.out.println("진짜"+ad);
	
		if(result > 0) {
			session.removeAttribute("ad"); // 광고 session 지워주기
			//System.out.println("지우고"+ad);
			return "member/myPage";
		}else {
			model.addAttribute("msg", "광고신청실패");
			return "common/errorPage";
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
	
	@RequestMapping("aInsertPayView.do")
	public String insertPayView(HttpSession session,@RequestParam(value="uploadFile", required=false) MultipartFile file, Ad ad, Model model, HttpServletRequest request) {
		
		
		if(!file.getOriginalFilename().equals("")) {// 파일 존재시
			
			String renameFileName = saveFile(file,request);
			
			ad.setOriginalImg(file.getOriginalFilename());
			ad.setRenameImg(renameFileName);
		}

		session.setAttribute("ad", ad);
		//System.out.println(ad);
		
		return "admin/pay";
	}
	
	@RequestMapping("aStatistics.do")
	public String statistics() {
		return "admin/statistics";
	}
	
	@RequestMapping("aNotice.do")
	public String notice() {
		return "admin/notice";
	}
	
	
	
	
	
	
	
	
}
