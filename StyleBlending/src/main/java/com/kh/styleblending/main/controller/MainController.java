package com.kh.styleblending.main.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.google.gson.Gson;
import com.google.gson.JsonIOException;
import com.kh.styleblending.main.model.service.MainService;
import com.kh.styleblending.main.model.vo.Live;

@Controller
public class MainController {

	@Autowired
	public MainService mainService;

	@RequestMapping("mainNotice.do")
	public String mainNotice() {
		return "main/notice";
	}

	@RequestMapping("topSearch.do")
	public void replyList(HttpServletResponse response) throws JsonIOException, IOException {

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

}
