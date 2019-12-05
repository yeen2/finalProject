package com.kh.styleblending;

import java.io.IOException;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.kh.styleblending.member.model.service.MemberService;
import com.kh.styleblending.member.model.vo.Member;

@Controller
public class HomeController {
	
	@Autowired
	private MemberService mService;
	
	@Autowired
	private BCryptPasswordEncoder bcryptPasswordEncoder;
	
	@Autowired
	private JavaMailSender mailSender;
	
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
	public ModelAndView insertMember(Member m, ModelAndView mv, HttpSession session) {
		
		//비밀번호 암호화
		//String encPass = bcryptPasswordEncoder.encode(m.getPass());
		//m.setPass(encPass);
		
		int result = mService.insertMember(m);
		
		if(result > 0) {
			session.setAttribute("msg", "회원가입 성공");
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
		

		//if(loginUser != null && bcryptPasswordEncoder.matches(m.getPass(), loginUser.getPass())) {  //암호화
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
			session.setAttribute("msg", loginUser.getNickName() +"님 환영합니다~");
			mv.setViewName("redirect:" + session.getAttribute("prevPage"));
			//mv.setViewName("redirect:main.do");
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
	public String joinCheckEmail(String email) throws IOException {
		
		int result = mService.joinCheckEmail(email);

		if(result > 0) {
			return "2"; //해당 아이디 있음
		}else {
			return "1"; // 해당 아이디 없음
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
	
	@ResponseBody
	@RequestMapping("joinCheckPass.do")
	public String joinCheckNickName(String pass, String pass2) throws IOException {
		
		if(pass.equals(pass2)) { 
			return "1";
		}else {
			return "2"; //비번틀림
		}
		
	}
	
	// 비밀번호 찾고, 메일로 전송
	@RequestMapping("searchPass.do")
	public ModelAndView searchPass(HttpServletRequest request, String email, ModelAndView mv, HttpSession session) {
		
		// 해당 이메일의 pass를 난수발생한 값으로 변경하고
		String randomPass = getRamdomPassword(10);
		
		System.out.println("난수 비번 : " + randomPass);
		
		// 이 비밀번호로 db비밀번호 변경하기 - 이때 Member객체로 받아와서 닉네임도 받아오기
		Member m = mService.searchPass(email, randomPass);
		
		System.out.println("받는이메일 : " + email);
		
		if(m != null) {
			
			//String setfrom = "jang_test@naver.com";
			String setfrom = "jang32880634@gmail.com";
			//String tomail = request.getParameter(email); // 받는 사람 이메일
			String title = "[StyleBlending] " + m.getNickName() + "님 요청하신 비밀번호 보내드립니다~"; // 제목
			String content = "새로운 비밀번호는 " + randomPass + "입니다. 로그인 하신 후, 비밀번호는 새로 변경해 주세요~"; // 내용
	
			try {
				MimeMessage message = mailSender.createMimeMessage();
				MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");
	
				messageHelper.setFrom(setfrom); // 보내는사람 생략하면 정상작동을 안함
				messageHelper.setTo(email); // 받는사람 이메일
				messageHelper.setSubject(title); // 메일제목은 생략이 가능하다
				messageHelper.setText(content); // 메일 내용
	
				mailSender.send(message);
			} catch (Exception e) {
				System.out.println(e);
			}
			
			session.setAttribute("msg", "가입하신 이메일로 전송해드렸습니다~");
			mv.setViewName("redirect:main.do");
			
		}else {
			mv.addObject("msg", "비밀번호 찾기 실패").setViewName("common/errorPage");
		}
		
		
		return mv;
	}

	// 비밀번호 난수발생 메소드
	public static String getRamdomPassword(int len) {
		
		char[] charSet = new char[] { '0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'A', 'B', 'C', 'D', 'E', 'F',
				'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z' };
		
		int idx = 0;
		StringBuffer sb = new StringBuffer();
		
		//System.out.println("charSet.length :::: " + charSet.length);
		for (int i = 0; i < len; i++) {
			idx = (int) (charSet.length * Math.random()); // 36 * 생성된 난수를 Int로 추출 (소숫점제거) System.out.println("idx ::::
															// "+idx);
			sb.append(charSet[idx]);
		}
		return sb.toString();
	}
		


	// footer 공지사항 이동
	@RequestMapping("noticePage.do")
	public String noticePage() {
		return "main/notice";
	}
	
	// footer 광고문의 이동
	@RequestMapping("adPage.do")
	public String adPage() {
		return "member/adPage";
		
	}
	
	// 카카오로그인
	@RequestMapping("kakaoLogin.do")
	public ModelAndView kakaoLogin(HttpSession session, ModelAndView mv, String email, String id, String nickName) {
		
		Member mem = mService.kakaoLogin(email, id, nickName);
		
		if(mem != null) {
			session.setAttribute("loginUser", mem);
			mv.setViewName("redirect:main.do");
		}else {
			mv.addObject("msg", "카카오 로그인 실패").setViewName("common/login");
		}
		
		return mv;
	}
	
	
	
}
