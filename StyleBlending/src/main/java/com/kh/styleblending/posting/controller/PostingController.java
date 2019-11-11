package com.kh.styleblending.posting.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.styleblending.posting.model.service.PostingService;

@Controller
public class PostingController {

	@Autowired
	private PostingService pService;
	
	// 좋아요,신고 정보 보여주려면 loginUser정보 가져와야 함
	@RequestMapping("pInfo.do")
	public String info() {
		return "posting/info";
	}
	
	@RequestMapping("pInsert")
	public String insert() {
		return "posting/insert";
	}
	
	
	
}
