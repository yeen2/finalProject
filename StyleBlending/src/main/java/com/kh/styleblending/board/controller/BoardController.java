package com.kh.styleblending.board.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.styleblending.board.model.service.BoardService;
import com.kh.styleblending.board.model.vo.Board;
import com.kh.styleblending.board.model.vo.FashionBoard;
import com.kh.styleblending.board.model.vo.PageInfo;
import com.kh.styleblending.board.model.vo.Pagination;

@Controller
public class BoardController {
	
	@Autowired
	private BoardService bService;
	
	@RequestMapping("blist.do")
	public ModelAndView boardList(ModelAndView mv, @RequestParam(value="currentPage", defaultValue="1") int currentPage) {
		
		int listCount = bService.getListCount();
		
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		
		ArrayList<Board> list = bService.selectList(pi);
		
		//System.out.println(list);
		mv.addObject("pi", pi).addObject("list", list).setViewName("board/list");
		
		return mv;
		
	}
	
	@RequestMapping("fblist.do")
	public ModelAndView fashionBoardList(ModelAndView mv, @RequestParam(value="currentPage", defaultValue="1") int currentPage) {
		
		int listCount = bService.getListCount();
		
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		
		ArrayList<FashionBoard> list = bService.fashionSelectList(pi);
		
		mv.addObject("pi", pi).addObject("list", list).setViewName("board/fashionList");
		
		return mv;
		
	}
	
	@RequestMapping("binsertForm.do")
	public String insertBoard() {
		
		return "board/listDetailWrite";
	}
 
 
}
