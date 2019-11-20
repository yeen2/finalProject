package com.kh.styleblending.admin.model.vo;

public class Pagination {

	public static PageInfo getPageInfo(int currentPage, int listCount, int boardLimit) {
		
		int pageLimit = 10; // 페이징바 최대갯수
	//	int boardLimit = 5; // 한페이지에 보여질 게시글 수
		
		int maxPage = (int)(Math.ceil((double)listCount/boardLimit));
		int startPage = (currentPage -1) / pageLimit * pageLimit + 1;
		int endPage = startPage + pageLimit -1;
		
		if(endPage > maxPage) {
			endPage = maxPage;
		}
		
		PageInfo pi = new PageInfo(currentPage, listCount, pageLimit, maxPage, startPage, endPage, boardLimit);
		
		return pi;
	}

}
