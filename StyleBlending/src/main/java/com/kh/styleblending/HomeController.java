package com.kh.styleblending;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.kh.styleblending.member.model.service.MemberService;
import com.kh.styleblending.member.model.vo.Member;

@Controller
public class HomeController {
	
	@Autowired
	private MemberService mService;
	
	@Autowired
	private BCryptPasswordEncoder bcryptPasswordEncoder;
	
	@RequestMapping(value = "main.do", method = RequestMethod.GET)
	public String main() {
		return "main";
	}
	
	@RequestMapping("loginForm.do")
	public String loginForm() {
		return "common/login";
	}
	
	@RequestMapping("joinForm.do")
	public String joinForm() {
		return "common/join";
	}
	
	@RequestMapping("join.do")
	public String insertMember(Member m, ModelAndView mv) {
		
		String encPass = bcryptPasswordEncoder.encode(m.getPass());
		
		m.setPass(encPass);
		
		int result = mService.insertMember(m);
		
		if(result > 0) {
			return "redirect:main.do";
		}else {
			mv.addObject("msg", "회원가입실패").setViewName("common/errorPage");
		}
	}
	
	
	
	
	
	
}
