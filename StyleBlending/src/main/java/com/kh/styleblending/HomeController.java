package com.kh.styleblending;

import java.io.IOException;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
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


// jang hhf

// jang hhdd hh


@Controller
public class HomeController {
	
	@Autowired
	private MemberService mService;
	
	@Autowired
	private BCryptPasswordEncoder bcryptPasswordEncoder;
	
	@RequestMapping(value = "main.do", method = RequestMethod.GET)
	public String main(HttpServletRequest req, HttpSession session) {
		
		Cookie[] cookies = req.getCookies();
		if(cookies != null) {
			for(Cookie c:cookies) {
				if(c.getName().equals("remember")) {
					session.setAttribute("loginUser", mService.getMember(c.getValue()));
				}
			}
		}
		return "main";
	}
	
	@RequestMapping("loginForm.do")
	public String loginForm(HttpSession session, HttpServletRequest request) {
		String referer = request.getHeader("Referer");
		session.setAttribute("prevPage", referer);
		
		return "common/login";
	}
	
	@RequestMapping("joinForm.do")
	public String joinForm() {
		return "common/join";
	}
	
	@RequestMapping("join.do")
	public ModelAndView insertMember(Member m, ModelAndView mv) {
		
		/*
		 * String encPass = bcryptPasswordEncoder.encode(m.getPass());
		 * 
		 * m.setPass(encPass);
		 */
		
		int result = mService.insertMember(m);
		
		if(result > 0) {
			mv.setViewName("redirect:main.do");
		}else {
			mv.addObject("msg", "회원가입실패").setViewName("common/errorPage");
		}
		return mv;
	}
	
	
	
	@RequestMapping("login.do")
	public ModelAndView loginMember(Member m, HttpSession session, ModelAndView mv, 
								String remember, String idid , HttpServletResponse res, HttpServletRequest req) {
		
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
			
			//자동 로그인
			if(remember != null) {
				Cookie cookie = new Cookie("remember", loginUser.getEmail());
				cookie.setMaxAge(60*60*24*7); //7일
				cookie.setPath("/");
				res.addCookie(cookie);
			}
			
			// id/pass 기억
			if(idid != null) {
				Cookie cookie1 = new Cookie("email", loginUser.getEmail());
				Cookie cookie2 = new Cookie("pass", loginUser.getPass());
				cookie1.setMaxAge(60*60*24*7); //7일
				cookie1.setPath("/");
				res.addCookie(cookie1);
				cookie2.setMaxAge(60*60*24*7);
				cookie2.setPath("/");
				res.addCookie(cookie2);
			}else {
				
				Cookie[] cookies = req.getCookies();
				if(cookies != null) {
					for(Cookie c:cookies) {
						if(c.getName().equals("email")) {
							c.setMaxAge(0);
							c.setPath("/");
							res.addCookie(c);
							break;
						}
						if(c.getName().equals("pass")) {
							c.setMaxAge(0);
							c.setPath("/");
							res.addCookie(c);
							break;
						}
					}
				}
				
				
			}
			mv.setViewName("redirect:" + session.getAttribute("prevPage"));
		}else {
			mv.addObject("msg", "로그인 실패").setViewName("common/login");
		}
		
		return mv;
	}
	
	@RequestMapping("logout.do")
	public String logout(HttpSession session, HttpServletRequest req, HttpServletResponse res, String idid) {
		
		session.invalidate(); // 세션 무효화
		Cookie[] cookies=req.getCookies();
		if(cookies!=null) {
			for(Cookie c:cookies) {
				if(c.getName().equals("remember")) {
					c.setMaxAge(0);
					c.setPath("/");
					res.addCookie(c);
					break;
				}
			}
		}
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
