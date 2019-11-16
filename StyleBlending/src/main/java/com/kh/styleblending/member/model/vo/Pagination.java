package com.kh.styleblending.member.model.vo;

public class Pagination {
	
	public static PageInfo getPageInfo(int currentPage, int listCount) {
		
		int pageLimit = 10;
		int boardLimit = 5;
		
		int maxPage = (int)(Math.ceil((double)listCount / boardLimit));
		int startPage = (currentPage - 1) / pageLimit * pageLimit + 1;
		int endPage = startPage + pageLimit - 1;
		if(maxPage < endPage) {
			endPage = maxPage;
		}
		
		PageInfo pi = new PageInfo(currentPage, listCount, pageLimit, maxPage, startPage, endPage, boardLimit);
		
		return pi;
		
	}

}
