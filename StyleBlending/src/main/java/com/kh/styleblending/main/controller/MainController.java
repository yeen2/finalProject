package com.kh.styleblending.main.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonIOException;
import com.kh.styleblending.admin.model.service.AdminService;
import com.kh.styleblending.admin.model.vo.Ad;
import com.kh.styleblending.main.model.service.MainService;
import com.kh.styleblending.main.model.vo.Live;
import com.kh.styleblending.main.model.vo.Notice;
import com.kh.styleblending.member.model.vo.Member;
import com.kh.styleblending.posting.model.vo.Posting;

@Controller
public class MainController {
	
	@Autowired
	public MainService mainService;
	@Autowired
	private AdminService aService;
	

	@RequestMapping("mainNotice.do")
	public String mainNotice() {
		return "main/notice";
	}

	@RequestMapping("topSearch.do")
	public void topSearch(HttpServletResponse response) throws JsonIOException, IOException {

		ArrayList<Live> list = mainService.topSearch();
		
		
		response.setContentType("application/json; charset=UTF-8");
		
		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
	      
		gson.toJson(list, response.getWriter());
	}
	/*
	 * @RequestMapping("mainNoticeList.do") public void
	 * replyList(HttpServletResponse response) throws JsonIOException, IOException {
	 * 
	 * ArrayList<Notice> list = mainService.selectNoticeList();
	 * 
	 * response.setContentType("application/json; charset=UTF-8");
	 * 
	 * Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
	 * 
	 * gson.toJson(list, response.getWriter()); }
	 */

	@RequestMapping("mainFourWrap.do")
	public void FourWrap(HttpServletResponse response) throws JsonIOException, IOException {

	      ArrayList<Posting> list = mainService.selectFourWrap();
	      
	      System.out.println(list);
	      
	      System.out.println(list);
	      response.setContentType("application/json; charset=UTF-8");
	      
	      Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
	      
	      gson.toJson(list, response.getWriter());
	}
	
	@RequestMapping("mainPostList.do")
	public void PostList(HttpServletResponse response, HttpSession session) throws JsonIOException, IOException {
		
		ArrayList<Posting> list = null;
		
		Member loginUser = (Member)session.getAttribute("loginUser");
		
		if(loginUser != null) {
			
			list = mainService.selectPostList(loginUser.getMno());
			
		}else {
			
			list = mainService.selectPostList(-10000);
			
		}
		
		response.setContentType("application/json; charset=UTF-8");
		
		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
		
		gson.toJson(list, response.getWriter());
	}
	
	@RequestMapping("mainInfinityScroll.do")
	public void InfinityScroll(HttpServletResponse response, HttpSession session) throws JsonIOException, IOException {
		
		Member loginUser = (Member)session.getAttribute("loginUser");
		ArrayList<Posting> list = null;
		if(loginUser != null) {
		
			list = mainService.selectInfinityScroll(loginUser.getMno());
		}else {
			list = mainService.selectInfinityScroll(-10000);
				
		}
		
		response.setContentType("application/json; charset=UTF-8");
		
		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
		
		gson.toJson(list, response.getWriter());
	}
	@RequestMapping("youtubeUrl.do")
	public void youtubeUrl(HttpServletResponse response) throws JsonIOException, IOException {
		
		Ad ad = mainService.selectAd();
		
		JSONObject jsonUser = new JSONObject(); // {}
		
		jsonUser.put("url", ad.getUrl());
		jsonUser.put("originalImg", ad.getOriginalImg());
		jsonUser.put("renameImg", ad.getRenameImg());
		jsonUser.put("imgPath", ad.getImgPath());
		
		response.setContentType("application/json; charset=UTF-8");
		
		PrintWriter out = response.getWriter();
		
		out.print(jsonUser);
		
		
	}
	
	@RequestMapping("selectFilter.do")
	public void selectFilter(HttpServletResponse response, HttpServletRequest request, HttpSession session) throws JsonIOException, IOException {
		
		String color = request.getParameter("color");
		String gender = request.getParameter("gender");
		String category = request.getParameter("category");
		
		
		Posting p = new Posting();
		
		p.setColor(color);
		p.setGender(gender);
		p.setCategory(category);
		
		Member loginUser = (Member)session.getAttribute("loginUser");
		
		ArrayList<Posting> list = null;
	
		
		if(loginUser != null) {
			list = mainService.selectFilter(p, loginUser.getMno());
		}else {
			list = mainService.selectFilter(p, -10000);
				
		}
		
		
		response.setContentType("application/json; charset=UTF-8");
		
		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
		
		gson.toJson(list, response.getWriter());
	}
	
	@RequestMapping("likeCount.do")
	public void likeCount(HttpServletResponse response, HttpServletRequest request) throws JsonIOException, IOException {
		
		int pno = Integer.parseInt(request.getParameter("likePno"));
		
		System.out.println(pno+"좋아요성공");
		
		int result = mainService.increaseLikeCount(pno);
		
		if(result > 0) {
			response.setContentType("text/html; charset=UTF-8");
			
			PrintWriter out = response.getWriter();
			
			out.print(result);
		}
		
	}
	@RequestMapping("aMainNotice.do")
	public void notice2(HttpServletResponse response) throws JsonIOException, IOException {
		
		ArrayList<Notice> list = aService.selectNoticeList();
		
		System.out.println(list);
		
		response.setContentType("application/json; charset=UTF-8");
		
		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
		
		gson.toJson(list, response.getWriter());

	}
	@RequestMapping("MainNoticeContent.do")
	public void notice3(HttpServletResponse response, int nno) throws JsonIOException, IOException {
		
		
		
		ArrayList<Notice> list = mainService.selectNoticeContent(nno);
		
		System.out.println(list);
		
		response.setContentType("application/json; charset=UTF-8");
		
		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
		
		gson.toJson(list, response.getWriter());
		
	}
	@RequestMapping("mainInsertNotice.do")
	public String insertNotice(HttpServletRequest request, String title, String writer, String content, Model model, HttpSession session) {
		Notice n = new Notice();
		n.setTitle(title);
		n.setContent(content);
		
		int result = mainService.insertNotice(n);
		
		if(result > 0) {
			session.setAttribute("msg", "등록 성공함");
			return "redirect:mainNotice.do";
		}else {
			model.addAttribute("msg","공지사항 작성실패");
			return "common/errorPage";
		}
		
		
		
	}
	@RequestMapping("noticeUpdateConfirm.do")
	public void notice3(HttpServletResponse response, int nno,String content) throws JsonIOException, IOException {
		
		System.out.println(content + " " + nno);
		
		Notice n = new Notice();
		
		n.setContent(content);
		
		n.setNno(nno);
		
		
		int result = mainService.noticeUpdateConfirm(n);
		
		System.out.println(result);
		
		if(result > 0) {
			response.setContentType("text/html; charset=UTF-8");
			
			PrintWriter out = response.getWriter();
			
			out.print(result);
		}
		 
	}
	@RequestMapping("noticeDelete.do")
	public void notice5(HttpServletResponse response, int nno,String content) throws JsonIOException, IOException {
		
		//System.out.println(content + " " + nno);
		
		int result = mainService.noticeDelete(nno);
		
		//System.out.println(result);
		
		if(result > 0) {
			
			response.setContentType("text/html; charset=UTF-8");
			
			PrintWriter out = response.getWriter();
			
			out.print(result);
		}
		
	}
	
}
