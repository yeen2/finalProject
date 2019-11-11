package com.kh.styleblending.main.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.styleblending.main.model.service.MainService;

@Controller
public class MainController {

	@Autowired
	public MainService mainService;
	
	@RequestMapping("mainNotice.do")
	public String mainNotice() {
		return "main/notice";
	}
	
	
}
