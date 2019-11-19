package com.kh.styleblending.board.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.styleblending.board.model.dao.BoardDao;
import com.kh.styleblending.board.model.vo.Board;
import com.kh.styleblending.board.model.vo.BoardReply;
import com.kh.styleblending.board.model.vo.FashionBoard;
import com.kh.styleblending.board.model.vo.Image;
import com.kh.styleblending.board.model.vo.PageInfo;

@Service("bService")
public class BoardServiceImpl implements BoardService{
	
	@Autowired
	private BoardDao bDao;

	@Override
	public int insertBoard(Board b) {
		
		return bDao.insertBoard(b);
	}
	
	@Override
	public Board selectBoard(int bno) {
			
		
			
		Board b =  bDao.selectBoard(bno);
		
		System.out.println(b);
		return b;
	}

	@Override
	public int updateBoard(Board b) {
		
		return bDao.updateBoard(b);
	}

	@Override
	public int deleteBoard(int bno) {

		return bDao.deleteBoard(bno);
	}

	@Override
	public ArrayList<BoardReply> selectBoardReplyList(int brno) {

		return bDao.selectBoardReplyList(brno);
	}

	@Override
	public int insertBoardReply(BoardReply r) {

		return bDao.insertBoardReply(r);
	}

	@Override
	public int getListCount() {

		return bDao.getListCount();
	}

	@Override
	public ArrayList<Board> selectList(PageInfo pi) {

		return bDao.selectList(pi);
	}

	@Override
	public ArrayList<FashionBoard> fashionSelectList(PageInfo pi) {

		return bDao.fashionSelectList(pi);
	}




	
	

}
