package com.kh.styleblending.member.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.styleblending.member.model.service.MemberService;

@Controller
public class MemberController {

	@Autowired
	private MemberService mService;
	
	@RequestMapping("mProfile.do")
	public String profile() {
		return "member/profile";
	}
	
	@RequestMapping("mMyPage.do")
	public String MyPage() {
		return "member/myPage";
	}
	
	
}
