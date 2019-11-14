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
		
		//System.out.println(listCount);
		
		mv.setViewName("admin/user");
		return mv;
		
	}
	
	@RequestMapping("aDeclare.do")
	public String declare() {
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
