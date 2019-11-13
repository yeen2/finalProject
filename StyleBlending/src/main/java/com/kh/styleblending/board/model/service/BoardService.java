package com.kh.styleblending.board.model.service;

import java.util.ArrayList;

import com.kh.styleblending.board.model.vo.Board;
import com.kh.styleblending.board.model.vo.BoardReply;

public interface BoardService {
	
	// 게시판 작성하기
	int insertBoard(Board b);
	
	// 게시판 상세조회
	Board selectBoard(int bNo);
	
	// 게시판 수정
	int updateBoard(Board b);
	
	// 게시판 삭제
	int deleteBoard(int bNo);
	
	// 게시글 댓글 리스트 조회
	ArrayList<BoardReply> selectBoardReplyList(int brNo);
	
	// 댓글 작성
	int insertBoardReply(BoardReply r);
}
