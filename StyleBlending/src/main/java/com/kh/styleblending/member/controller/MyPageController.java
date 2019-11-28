package com.kh.styleblending.member.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpSession;

import org.apache.catalina.servlet4preview.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.kh.styleblending.admin.model.vo.Ad;
import com.kh.styleblending.member.model.service.MyPageService;
import com.kh.styleblending.member.model.vo.Alarm;
import com.kh.styleblending.member.model.vo.Fan;
import com.kh.styleblending.member.model.vo.Member;
import com.kh.styleblending.member.model.vo.PageInfo;
import com.kh.styleblending.member.model.vo.Pagination;
import com.kh.styleblending.posting.model.vo.Posting;
import com.kh.styleblending.posting.model.vo.Style;

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
	public String selectFanList(int mno, int loginMno){
		
		ArrayList<Member> list = mpService.selectFanList(mno, loginMno);
		
		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
		
		return gson.toJson(list);
	}
	
	// 내 팔로잉 리스트 호출 메소드
	@ResponseBody
	@RequestMapping(value="mpSFwList.do", produces="application/json; charset=UTF-8")
	public String selectFwList(int mno, int loginMno){
		
		ArrayList<Member> list = mpService.selectFwList(mno, loginMno);
		
		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
		
		return gson.toJson(list);
	}
	
	// 내 프로필 이미지 수정 메소드
	@ResponseBody
	@RequestMapping("mpUpdateImg.do")
	public String updateProfileImg(Member m, HttpSession session, ModelAndView mv, HttpServletRequest request, MultipartHttpServletRequest req) {
		int mno = ((Member)session.getAttribute("loginUser")).getMno();
		String renameFileNameD = ((Member)session.getAttribute("loginUser")).getRenameImg();
		
		m.setMno(mno);
		
		MultipartFile file = req.getFile("uploadImg");
		
		if(!file.getOriginalFilename().equals("")) { // 첨부파일이 넘어오는 경우
			
			String renameFileName = saveProfileImg(file, request);
			
			m.setOriginalImg(file.getOriginalFilename());
			m.setRenameImg(renameFileName);
			
		}
		
		Member mem = mpService.updateProfileImg(m);
		
		if(mem != null) {
			session.setAttribute("loginUser", mem);
			if(!renameFileNameD.equals("profile.png")) {
				deleteProfileImg(renameFileNameD, request);
			}
			return m.getRenameImg();
		}else {
			return "fail";
		}
		
	}
	// 내 프로필 이미지 기본 이미지로 변경
	@ResponseBody
	@RequestMapping("mpUpdateBasic")
	public String updateBasicImg(Member m, ModelAndView mv, HttpSession session, HttpServletRequest request) {
		String renameFileName = ((Member)session.getAttribute("loginUser")).getRenameImg();
		int mno = ((Member)session.getAttribute("loginUser")).getMno();
		
		deleteProfileImg(renameFileName, request);
		
		m.setRenameImg("profile.png");
		m.setOriginalImg("profile.png");
		m.setMno(mno);
		
		Member mem = mpService.updateProfileImg(m);
		
		if(mem != null) {
			session.setAttribute("loginUser", mem);
			return m.getRenameImg();
		}else {
			return "fail";
		}
	
	}
	
	// 프로필 이미지 수정명 저장 메소드
	public String saveProfileImg(MultipartFile file, HttpServletRequest request) {
		String root = request.getSession().getServletContext().getRealPath("resources");
		String savePath = root + "/upload/member";
		
		File folder = new File(savePath);
		
		if(!folder.exists()) {
			folder.mkdirs();
		}
		
		String originFileName = file.getOriginalFilename();
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		
		String renameFileName = sdf.format(new Date(System.currentTimeMillis())) + "." + originFileName.substring(originFileName.lastIndexOf(".") + 1);
		
		String renamePath = savePath + "/" + renameFileName;
		
		try {
			file.transferTo(new File(renamePath));
		} catch (IllegalStateException | IOException e) {
			e.printStackTrace();
		}
		
		return renameFileName;
	}
	
	// 프로필 이미지 삭제 메소드
	public void deleteProfileImg(String renameFileName, HttpServletRequest request) {
		String root = request.getSession().getServletContext().getRealPath("resources");
		String savePath = root + "/upload/member";
		
		File f = new File(savePath + "/" + renameFileName);
		
		if(f.exists()) {
			f.delete();
		}
	}
	// 내 프로필 수정 메소드
	@RequestMapping("mpUpdatePf.do")
	public ModelAndView updateProfile(Member m, ModelAndView mv, HttpSession session) {
		Member mem = mpService.updateProfile(m);
		
		if(mem != null) {
			session.setAttribute("loginUser", mem);
			mv.addObject("msg", "회원 정보 수정에 성공하였습니다.").setViewName("member/myPage");
		}else {
			mv.addObject("msg", "회원 정보 수정에 실패하였습니다.").setViewName("common/errorPage");
		}
		
		return mv;
	}
	
	@RequestMapping("mpProfileUpdate.do")
	public String selectProfileUpdate() {
		return "member/myPage";
	}
	
	// 내 광고 리스트 호출 메소드
	@RequestMapping(value="mpSAdList.do", produces="application/json; charset=UTF-8")
	public ModelAndView selectAdList(HttpSession session, ModelAndView mv, @RequestParam(value="currentPage", defaultValue="1") int currentPage){
		int mno = ((Member)session.getAttribute("loginUser")).getMno();
		
		int listCount = mpService.getAdListCount(mno);
		
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		
		ArrayList<Ad> list = mpService.selectAdList(mno, pi);
		
		mv.addObject("pi", pi).addObject("list", list).setViewName("member/adPage");
		
		return mv;
	}
	
	// 비밀번호 변경 메소드
	@RequestMapping("mpUpdatePass.do")
	public ModelAndView updatePass(Member m, ModelAndView mv, HttpSession session) {
		m.setMno(((Member)session.getAttribute("loginUser")).getMno());
		Member mem = mpService.updatePass(m);
		
		if(mem != null) {
			session.setAttribute("loginUser", mem);
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
	
	// 알람 카운트 메소드
	/*
	@ResponseBody
	@RequestMapping("mpSAlarmCount.do")
	public int selectAlarmCount(HttpSession session) {
		int mno = ((Member)session.getAttribute("loginUser")).getMno();
		
		int result = mpService.selectAlarmCount(mno);
		
		if(result > 0) {
			return result;
		}else {
			return 0;
		}
	}
	
	@ResponseBody
	@RequestMapping("mpSAlarmList.do")
	public String selectAlarmList(HttpSession session) {
		int mno = ((Member)session.getAttribute("loginUser")).getMno();
		
		ArrayList<Alarm> list = mpService.selectAlarmList(mno);
		
		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
		
		return gson.toJson(list);
	}
	*/
	
	// 팬 체크
	@ResponseBody
	@RequestMapping("mpSFanCheck.do")
	public int selectFanCheck(Fan f) {
		int result = mpService.selectFanCheck(f);
		
		if(result > 0) {
			return 1;
		}else {
			return -1;
		}
	}
	
	
	// insert 팬
	@ResponseBody
	@RequestMapping("mpInsertFan.do")
	public int insertFan(Fan f) {
		int result = mpService.insertFan(f);
		
		if(result > 0) {
			return 1;
		}else {
			return -1;
		}
	}
	
	// delete 팬
	@ResponseBody
	@RequestMapping("mpDeleteFan.do")
	public int deleteFan(Fan f) {
		int result = mpService.deleteFan(f);
		
		if(result > 0) {
			return 1;
		}else {
			return -1;
		}
	}
	
	// --------------- 검색 리스트 ----------------------------------------------------------------
	@ResponseBody
	@RequestMapping(value="mpSSearchFan.do", produces="application/json; charset=UTF-8")
	public String selectSearchFan(String search) {
		ArrayList<Member> list = mpService.selectSearchFan(search);
		
		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
		
		return gson.toJson(list);
	}
	
	@ResponseBody
	@RequestMapping(value="mpSSearchBrand.do", produces="application/json; charset=UTF-8")
	public String selectSearchBrand(String search) {
		ArrayList<Style> list = mpService.selectSearchBrand(search);

		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
		
		return gson.toJson(list);
	}
	
	@ResponseBody
	@RequestMapping(value="mpSSearchHashtag.do", produces="application/json; charset=UTF-8")
	public String selectSearchHashtag(String search) {
		ArrayList<Posting> list = mpService.selectSearchHashtag(search);
		
		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
		
		return gson.toJson(list);
	}
	
	@ResponseBody
	@RequestMapping(value="mpSSearchLoca.do", produces="application/json; charset=UTF-8")
	public String selectSearchLoca(String search) {
		ArrayList<Posting> list = mpService.selectSearchLoca(search);
		
		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
		
		return gson.toJson(list);
	}
	//-------------------------------------------------------------------------------------------
	
	// 알람 모두 읽음으로 표시 메소드
	@ResponseBody
	@RequestMapping("mpUpdateAlarm.do")
	public int updateAlarm(int mno) {
		int result = mpService.updateAlarm(mno);
		
		if(result > 0) {
			return 1;
		}else {
			return -1;
		}
	}
	
	// 알람 클릭한 알람 한 개만 읽음 표시 메소드
	@ResponseBody
	@RequestMapping("mpUpdateAlarmOne.do")
	public int updateAlarmOne(int alno) {
		int result = mpService.updateAlarmOne(alno);
		
		if(result > 0) {
			return 1;
		}else {
			return -1;
		}
	}
	
	// 프로필 수정 - 닉네임 ajax 체크 메소드
	@ResponseBody
	@RequestMapping("mpNickNameCheck.do")
	public int nickNameCheck(Member m) {
		int result = mpService.nickNameCheck(m);
		
		if(result > 0) {
			return 1;
		}else {
			return -1;
		}
	}
	
	/*
	@ResponseBody
	@RequestMapping("mpUpdateAlarmOne")
	public int updateAlarmOne(int alno) {
		int result = mpService.updateAlarmOne(alno);
		
		if(result > 0) {
			return 1;
		}else {
			return -1;
		}
	}
	*/
}
