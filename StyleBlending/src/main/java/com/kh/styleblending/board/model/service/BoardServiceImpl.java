package com.kh.styleblending.board.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.styleblending.board.model.dao.BoardDao;
import com.kh.styleblending.board.model.vo.Board;
import com.kh.styleblending.board.model.vo.BoardReply;
import com.kh.styleblending.board.model.vo.Declare;
import com.kh.styleblending.board.model.vo.FashionBoard;
import com.kh.styleblending.board.model.vo.Image;
import com.kh.styleblending.board.model.vo.PageInfo;

@Service("bService")
public class BoardServiceImpl implements BoardService{
	
	@Autowired
	private BoardDao bDao;

	@Override
	public int getListCount() {
		
		return bDao.getListCount();
	}
	
	@Override
	public ArrayList<Board> selectList(PageInfo pi) {
		
		return bDao.selectList(pi);
	}
	
	@Override
	public int insertBoard(Board b) {
		
		return bDao.insertBoard(b);
	}
	
	@Override
	public Board selectBoard(int bno) {
		 
		 int result = bDao.updateCount(bno);
		
		
		 if(result > 0) {
			 
			 return bDao.selectBoard(bno);
		 }else {
			 
			return null; 
		 }
	}

	
	@Override 
	public Board selectUpdateBoard(int bno) {
	  
		return bDao.selectBoard(bno); 
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
	public ArrayList<BoardReply> selectBoardReplyList(int bno) {

		return bDao.selectBoardReplyList(bno);
	}

	@Override
	public int insertBoardReply(BoardReply r) {

		return bDao.insertBoardReply(r);
	}



	@Override
	public ArrayList<FashionBoard> fashionSelectList(PageInfo pi) {

		return bDao.fashionSelectList(pi);
	}

	
	// 자유게시판 추천
		@Override
		public int insertBoardLike(int bno, int mno) {
			return bDao.insertBoardLike(bno, mno);
		}

		@Override
		public int deleteBoardLike(int bno, int mno) {

			return bDao.deleteBoardLike(bno, mno);
		}

		@Override
		public int blikeCheckUp(int bno) {

			return bDao.blikeCheckUp(bno);
		}

		@Override
		public int blikeCheckDown(int bno) {

			return bDao.blikeCheckDown(bno);
		}

		@Override
		public int selectBoardLikeCnt(int bno) {

			return bDao.selectBoardLikeCnt(bno);
		}

		@Override
		public int selectBoardLikeCheck(int bno, int mno) {

			return bDao.selectBoardLikeCheck(bno, mno);
		}

		@Override
		public int insertbDeclare(Declare d) {

			return bDao.insertbDeclare(d);
		}



}
