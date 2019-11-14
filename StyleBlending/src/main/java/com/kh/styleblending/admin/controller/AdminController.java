package com.kh.styleblending.admin.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.styleblending.admin.model.service.AdminService;
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
	public String deleteMember(String mno) {
		System.out.println(mno);
		return "redirect:aUser.do";
	}
	
	@RequestMapping("aDeclare.do")
	public String selectDeclareList(ModelAndView mv, @RequestParam(value="currentPage", defaultValue="1")int currentPage) {
		
		int listCount = aService.getDeclareListCount();
		
		
		return "admin/declare";
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
