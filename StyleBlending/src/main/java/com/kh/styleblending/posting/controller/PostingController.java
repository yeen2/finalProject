package com.kh.styleblending.posting.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.kh.styleblending.posting.model.service.PostingService;
import com.kh.styleblending.posting.model.vo.Posting;
import com.kh.styleblending.posting.model.vo.Style;

@Controller
public class PostingController {

	@Autowired
	private PostingService pService;
	
	// 좋아요,신고 정보 보여주려면 loginUser정보 가져와야 함
	@RequestMapping("pInfo.do")
	public String info() {
		return "posting/info";
	}
	
	// 포스팅등록
	@RequestMapping("pInsertForm.do")
	public String insertForm() {
		return "posting/insert";
	}
	
	// 포스팅등록 처리
	@RequestMapping("pInsert.do")
	public ModelAndView insert(Posting po, Style st, ModelAndView mv) {
		
		int result = pService.insertPosting(po, st);
		
		if(result > 0) {
			mv.setViewName("redirect:home.do");
		}else {
			mv.addObject("msg", "포스팅 등록 실패").setViewName("common/errorPage");
		}
		
		return mv;
	}
	
	
	
	
	
	
	
}
