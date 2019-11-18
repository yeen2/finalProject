package com.kh.styleblending.main.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonIOException;
import com.kh.styleblending.main.model.service.MainService;
import com.kh.styleblending.main.model.vo.Live;
import com.kh.styleblending.main.model.vo.Notice;
import com.kh.styleblending.posting.model.vo.Posting;

@Controller
public class MainController {

	@Autowired
	public MainService mainService;

	@RequestMapping("mainNotice.do")
	public String mainNotice() {
		return "main/notice";
	}

	@RequestMapping("topSearch.do")
	public void topSearch(HttpServletResponse response) throws JsonIOException, IOException {

		ArrayList<Live> list = new ArrayList<>();
		list.add(new Live(1,"몽블랑"));
		list.add(new Live(2,"프라다"));
		list.add(new Live(3,"구찌"));
		list.add(new Live(4,"나이키"));
		list.add(new Live(5,"아디다스"));
		response.setContentType("application/json; charset=UTF-8");
		Gson gson = new Gson();

		gson.toJson(list, response.getWriter());
	}
	@RequestMapping("mainNoticeList.do")
	public void replyList(HttpServletResponse response) throws JsonIOException, IOException {

		ArrayList<Notice> list = new ArrayList<>();
		list.add(new Notice(1,"[공지] 이달의 업데이트 안내 ","안녕하세요 스타일블랜딩입니다1. ","2019-10-03"));
		list.add(new Notice(2,"[공지] 개인정보처리방침 일부 변경 안내 ","안녕하세요  스타일블랜딩입니다2. ","2019-10-23"));
		list.add(new Notice(3,"[공지] 리뷰 사진 선택 기능 업데이트 안내 ","안녕하세요 스타일블랜딩입니다3. ","2019-10-13"));
		list.add(new Notice(4,"[공지] 개인정보처리방침 일부 변경 안내 ","안녕하세요 스타일블랜딩입니다4. ","2019-11-03"));
		list.add(new Notice(5,"[공지] 평점 업데이트 ","안녕하세요 스타일블랜딩입니다5. ","2019-11-13"));
		response.setContentType("application/json; charset=UTF-8");
		Gson gson = new Gson();

		gson.toJson(list, response.getWriter());
	}

	@RequestMapping("mainFourWrap.do")
	public void FourWrap(HttpServletResponse response) throws JsonIOException, IOException {

	      ArrayList<Posting> list = mainService.selectFourWrap();
	      
	      System.out.println(list);
	      
	      response.setContentType("application/json; charset=UTF-8");
	      
	      Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
	      
	      gson.toJson(list, response.getWriter());
	}
}
