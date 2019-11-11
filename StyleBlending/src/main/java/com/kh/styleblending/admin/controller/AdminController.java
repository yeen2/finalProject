package com.kh.styleblending.admin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.styleblending.admin.model.service.AdminService;

@Controller
public class AdminController {

	@Autowired
	private AdminService aService;
	
	@RequestMapping("aPage")
	public String adminPage() {
		return "admin/";
	}
	
	
	
}
