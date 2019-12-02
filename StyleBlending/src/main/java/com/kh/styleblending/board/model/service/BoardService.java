package com.kh.styleblending.board.model.service;

import java.util.ArrayList;

import com.kh.styleblending.board.model.vo.Board;
import com.kh.styleblending.board.model.vo.BoardReply;
import com.kh.styleblending.board.model.vo.Declare;
import com.kh.styleblending.board.model.vo.FashionBoard;
import com.kh.styleblending.board.model.vo.Image;
import com.kh.styleblending.board.model.vo.PageInfo;
import com.kh.styleblending.board.model.vo.Search;

public interface BoardService {
	
	// 자유게시판 작성하기
	int insertBoard(Board b);
	
	// 패션게시판 작성하기
	int insertfBoard(FashionBoard fb);
	
	// imgfile insert
	int insertbImgFile(Image i);
	
	int insertfImgFile(Image i);
	
	// 자유게시판 상세조회
	Board selectBoard(int bno);
	
	// 패션게시판 상세조회
	FashionBoard selectfBoard(int fbno);
	
	// 패션게시판 삭제
	int FbdeleteBoard(int fbno);
	
	// 패션게시판 수정
	int updatefBoard(FashionBoard fb);
	
	// 자유게시판 수정
	int updateBoard(Board b);
	
	// 자유게시판 삭제
	int deleteBoard(int bno);
	
	// 게시글 댓글 리스트 조회
	ArrayList<BoardReply> selectBoardReplyList(int bno);
	
	// 댓글 작성
	int insertBoardReply(BoardReply r);
	
	// 자유게시판 갯수조회
	int getListCount();
	
	// 패션게시판 갯수조회
	int getfbListCount();
	
	// 자유게시판 검색리스트개수조회
	int getSearchListCount(Search sc);
	
	// 댓글 수정
	int updateBoardReply(int brno, String content);
	
	// 댓글 삭제
	int deleteBoardReply(int brno);

	// 자유게시판 리스트
	ArrayList<Board> selectList(PageInfo pi);
	
	// 자유게시판 검색 리스트
	ArrayList<Board> SearchselectList(PageInfo pi,Search sc);

	ArrayList<FashionBoard> fashionSelectList(PageInfo pi);
	//*********************************************************

	// 삭제하고자 하는 자유게시판 조회용
	Board selectUpdateBoard(int bno);
	
	// 삭제하고자 하는 패션 게시판 조회용
	FashionBoard selectUpdatefBoard(int fbno);
	
	
	// 게시판 추천
		int insertBoardLike(int bno , int mno);
		
		int deleteBoardLike(int bno , int mno);
		
		int blikeCheckUp(int bno);
		int blikeCheckDown(int bno);
		
		
		int selectBoardLikeCnt(int bno);
		int selectBoardLikeCheck(int bno , int mno);
	
	// 게시판 신고
	int insertbDeclare(Declare d);

	// 패션게시판 검색조회개수
	int getfbSearchListCount(Search sc);

	// 패션게시판 검색리스트
	ArrayList<FashionBoard> SearchfselectList(PageInfo pi, Search sc);
	
}
