package com.kh.styleblending.admin.controller;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.styleblending.admin.model.service.AdminService;
import com.kh.styleblending.admin.model.vo.Declare;
import com.kh.styleblending.admin.model.vo.PageInfo;
import com.kh.styleblending.admin.model.vo.Pagination;
import com.kh.styleblending.member.model.vo.Member;

@Controller
public class AdminController {

	@Autowired
	private AdminService aService;
	
	@RequestMapping("aPage.do")
	public String adminPage() {
		return "admin/adminPage";
	}
	
	@RequestMapping("aUser.do")
	public ModelAndView selectUserList(ModelAndView mv, @RequestParam(value="currentPage", defaultValue="1")int currentPage) {
		
		int listCount = aService.getMemberListCount();
		
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		
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
											@RequestParam(value="select", defaultValue="0") String select, HashMap<String,String> cate) {
		
		if(select.equals("1")) {
			cate.put("posting","1" );
		}else if(select.equals("2")) {
			cate.put("free", "2");
		}
		
		int listCount = aService.getDeclareListCount(cate);
		
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		
		
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
	public String advertisment() {
		return "admin/advertisment";
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
