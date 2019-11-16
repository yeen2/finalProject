package com.kh.styleblending.member.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.kh.styleblending.admin.model.vo.Ad;
import com.kh.styleblending.member.model.service.MyPageService;
import com.kh.styleblending.member.model.vo.Member;
import com.kh.styleblending.member.model.vo.PageInfo;
import com.kh.styleblending.member.model.vo.Pagination;
import com.kh.styleblending.posting.model.vo.Posting;

@Controller
public class MyPageController {
	
	@Autowired
	private MyPageService mpService;
	
	// 다른 사람 프로필 호출 메소드 (일반 프로필 페이지)
	@RequestMapping("mpViewProfile.do")
	public ModelAndView profileViewPage(ModelAndView mv, int mno) {
		
		Member m = mpService.selectProfile(mno);
		
		if(m != null) {
			mv.addObject("m", m).setViewName("member/profile");
		}else {
			mv.addObject("msg", "프로필 페이지 불러오기에 실패하였습니다.").setViewName("common/errorPage");
		}
		
		return mv;
	}
	
	// 마이페이지 프로필 호출 메소드 (내 프로필페이지)
	@RequestMapping("mProfile.do")
	public ModelAndView profileViewPage(HttpSession session, ModelAndView mv) {
		int mno = ((Member)session.getAttribute("loginUser")).getMno();
		
		Member m = mpService.selectProfile(mno);
		
		if(m != null) {
			mv.addObject("m", m).setViewName("member/profile");
		}else {
			mv.addObject("msg", "프로필 페이지 불러오기에 실패하였습니다.").setViewName("common/errorPage");
		}
		
		return mv;
	}
	
	// 내 프로필관리 페이지 이동 메소드
	@RequestMapping("mpUpdatePage.do")
	public String memberUpdatePage() {
		return "member/myPage";
	}
	
	// 내 포스팅 리스트 호출 메소드
	@ResponseBody
	@RequestMapping(value="mpSPostingList.do", produces="application/json; charset=UTF-8")
	public String selectPostingList(int mno){
		
		ArrayList<Posting> list = mpService.selectPostingList(mno);
		
		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
		
		return gson.toJson(list);
	}
	
	// 내 좋아요 포스팅 리스트 호출 메소드
	@ResponseBody
	@RequestMapping(value="mpSLikeList.do", produces="application/json; charset=UTF-8")
	public String selectLikeList(int mno){
		
		ArrayList<Posting> list = mpService.selectLikeList(mno);
		
		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
		
		return gson.toJson(list);
	}
	
	// 내 팬 리스트 호출 메소드
	@ResponseBody
	@RequestMapping(value="mpSFanList.do", produces="application/json; charset=UTF-8")
	public String selectFanList(int mno){
		
		ArrayList<Member> list = mpService.selectFanList(mno);
		
		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
		
		return gson.toJson(list);
	}
	
	// 내 팔로잉 리스트 호출 메소드
	@ResponseBody
	@RequestMapping(value="mpSFwList.do", produces="application/json; charset=UTF-8")
	public String selectFwList(int mno){
		
		ArrayList<Member> list = mpService.selectFwList(mno);
		
		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
		
		return gson.toJson(list);
	}
	
	// 내 프로필 수정 메소드
	@RequestMapping("mpUpdatePf.do")
	public ModelAndView updateProfile(Member m, ModelAndView mv, HttpSession session) {
		int result = mpService.updateProfile(m);
		
		if(result > 0) {
			session.setAttribute("loginUser", m);
			mv.addObject("msg", "회원 정보 수정에 성공하였습니다.").setViewName("member/myPage");
		}else {
			mv.addObject("msg", "회원 정보 수정에 실패하였습니다.").setViewName("common/errorPage");
		}
		
		return mv;
	}
	
	// 내 광고 리스트 호출 메소드
	@RequestMapping(value="mpSAdList.do", produces="application/json; charset=UTF-8")
	public ModelAndView selectAdList(HttpSession session, ModelAndView mv, @RequestParam(value="currentPage", defaultValue="1") int currentPage){
		int mno = ((Member)session.getAttribute("loginUser")).getMno();
		
		int listCount = mpService.getAdListCount(mno);
		
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		
		ArrayList<Ad> list = mpService.selectAdList(mno, pi);
		
		mv.addObject("pi", pi).addObject("list", list);
		
		return mv;
	}
	
	// 비밀번호 변경 메소드
	@RequestMapping("mpUpdatePass.do")
	public ModelAndView updatePass(Member m, ModelAndView mv, HttpSession session) {
		m.setMno(((Member)session.getAttribute("loginUser")).getMno());
		int result = mpService.updatePass(m);
		
		if(result > 0) {
			mv.addObject("msg", "비밀번호 변경에 성공하였습니다.").setViewName("member/myPage");
		}else {
			mv.addObject("msg", "비밀번호 변경에 실패하였습니다.").setViewName("common/errorPage");
		}
		
		return mv;
	}
	
	// 회원 탈퇴 메소드
	@RequestMapping("mpDeleteMem.do")
	public ModelAndView deleteMember(HttpSession session, ModelAndView mv) {
		int mno = ((Member)session.getAttribute("loginUser")).getMno();
		
		int result = mpService.deleteMember(mno);
		
		if(result > 0) {
			session.invalidate();
			mv.addObject("msg", "회원탈퇴에 성공하였습니다.").setViewName("main");
		}else {
			mv.addObject("msg", "회원탈퇴에 실패하였습니다.").setViewName("common/errorPage");
		}
		
		return mv;
	}
	/*
	@RequestMapping("mpInsertFan")
	public ModelAndView insertFan(int mno, ModelAndView mv) {
		int result = mpService.insertFan(mno);
		
		if(result > 0) {
			
		}else {
			mv.addObject()
		}
	}
	*/
	/*
	@RequestMapping("검색어 ajax 호출")
	
	@RequestMapping("알림 ajax 호출")
	*/

}
