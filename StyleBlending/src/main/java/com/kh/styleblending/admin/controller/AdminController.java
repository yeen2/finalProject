package com.kh.styleblending.admin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.styleblending.admin.model.service.AdminService;

@Controller
public class AdminController {

	@Autowired
	private AdminService aService;
	
	@RequestMapping("aPage.do")
	public String adminPage() {
		return "admin/adminPage";
	}
	
	@RequestMapping("aUser.do")
	public String user() {
		return "admin/user";
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
