package com.kh.styleblending.board.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.styleblending.board.model.dao.BoardDao;
import com.kh.styleblending.board.model.vo.Board;
import com.kh.styleblending.board.model.vo.BoardReply;

@Service("bService")
public class BoardServiceImpl implements BoardService{
	
	@Autowired
	private BoardDao bDao;

	@Override
	public int insertBoard(Board b) {
		
		return bDao.insertBoard(b);
	}

	@Override
	public Board selectBoard(int bNo) {

		return bDao.selectBoard(bNo);
	}

	@Override
	public int updateBoard(Board b) {

		return bDao.updateBoard(b);
	}

	@Override
	public int deleteBoard(int bNo) {

		return bDao.deleteBoard(bNo);
	}

	@Override
	public ArrayList<BoardReply> selectBoardReplyList(int brNo) {

		return bDao.selectBoardReplyList(brNo);
	}

	@Override
	public int insertBoardReply(BoardReply r) {

		return bDao.insertBoardReply(r);
	}
	
	

}
