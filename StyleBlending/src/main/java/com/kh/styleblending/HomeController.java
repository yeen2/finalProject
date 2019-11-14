package com.kh.styleblending;

import java.io.IOException;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.kh.styleblending.member.model.service.MemberService;
import com.kh.styleblending.member.model.vo.Member;

<<<<<<< HEAD
// jang hhf
=======
// jang hhdd hh
>>>>>>> refs/remotes/origin/hye

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
	public ModelAndView insertMember(Member m, ModelAndView mv) {
		
		String encPass = bcryptPasswordEncoder.encode(m.getPass());
		
		m.setPass(encPass);
		
		int result = mService.insertMember(m);
		
		if(result > 0) {
			mv.setViewName("redirect:main.do");
		}else {
			mv.addObject("msg", "회원가입실패").setViewName("common/errorPage");
		}
		return mv;
	}
	
	
	
	@RequestMapping("login.do")
	public ModelAndView loginMember(Member m, HttpSession session, ModelAndView mv) {
		
		Member loginUser = mService.loginMember(m);
		
		/* 암호화
		//if(loginUser != null) { // 로그인 성공
		if(loginUser != null && bcryptPasswordEncoder.matches(m.getPass(), loginUser.getPass())) {
			session.setAttribute("loginUser", loginUser);
			
			mv.setViewName("redirect:main.do");
			
		}else { // 로그인 실패
			
			mv.addObject("msg", "로그인 실패").setViewName("common/errorPage");
		}
		*/
		
		if(loginUser != null) { // 로그인 성공
			session.setAttribute("loginUser", loginUser);
			mv.setViewName("redirect:main.do");
		}else {
			mv.addObject("msg", "로그인 실패").setViewName("common/errorPage");
		}
		
		return mv;
	}
	
	@RequestMapping("logout.do")
	public String logout(HttpSession session) {
		
		session.invalidate(); // 세션 무효화
		
		return "redirect:main.do";
	}
	
	
	@ResponseBody
	@RequestMapping("joinCheckEmail.do")
	public String joinCheckEmail(String id) throws IOException {
		
		int result = mService.joinCheckEmail(id);
		
		if(result > 0) {
			return "2";
		}else {
			return "1";
		}
	}
	
	@ResponseBody
	@RequestMapping("joinCheckNickName.do")
	public String joinCheckNickName(String nickName) throws IOException {
		
		int result = mService.joinCheckNickName(nickName);
		
		if(result > 0) {
			return "2";
		}else {
			return "1";
		}
	}
	

















	
	
	
	
	
}
