package com.kh.styleblending.board.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.styleblending.board.model.vo.Board;
import com.kh.styleblending.board.model.vo.BoardReply;
import com.kh.styleblending.board.model.vo.FashionBoard;
import com.kh.styleblending.board.model.vo.Image;
import com.kh.styleblending.board.model.vo.PageInfo;

@Repository("bDao")
public class BoardDao {

	@Autowired
	private SqlSessionTemplate sqlSession;

	public int insertBoard(Board b) {

		return sqlSession.insert("boardMapper.insertBoard");
	}

	public Board selectBoard(int bno) {
		return sqlSession.selectOne("boardMapper.selectBoard");
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

	public int getListCount() {

		return sqlSession.selectOne("boardMapper.getListCount");
	}

	public ArrayList<Board> selectList(PageInfo pi) {

		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());		
		
		ArrayList<Board> list = (ArrayList)sqlSession.selectList("boardMapper.selectList", null , rowBounds);
		
		return list;
	}

	
	public ArrayList<FashionBoard> fashionSelectList(PageInfo pi) {
		
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());		
		
		ArrayList<FashionBoard> list = (ArrayList)sqlSession.selectList("boardMapper.fashionSelectList", null , rowBounds);
		
		return list;
	}


	
	
	
	
	
}
