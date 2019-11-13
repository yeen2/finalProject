package com.kh.styleblending.board.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.styleblending.board.model.vo.Board;
import com.kh.styleblending.board.model.vo.BoardReply;

@Repository("bDao")
public class BoardDao {

	@Autowired
	private SqlSessionTemplate sqlSession;

	public int insertBoard(Board b) {
		// TODO Auto-generated method stub
		return 0;
	}

	public Board selectBoard(int bNo) {
		// TODO Auto-generated method stub
		return null;
	}

	public int updateBoard(Board b) {
		// TODO Auto-generated method stub
		return 0;
	}

	public int deleteBoard(int bNo) {
		// TODO Auto-generated method stub
		return 0;
	}

	public ArrayList<BoardReply> selectBoardReplyList(int brNo) {
		// TODO Auto-generated method stub
		return null;
	}

	public int insertBoardReply(BoardReply r) {
		// TODO Auto-generated method stub
		return 0;
	}
	
	
	
	
	
	
}
