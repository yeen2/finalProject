package com.kh.styleblending.board.model.service;

import java.sql.SQLException;
import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.stereotype.Service;
import org.springframework.transaction.TransactionDefinition;
import org.springframework.transaction.TransactionStatus;
import org.springframework.transaction.support.DefaultTransactionDefinition;

import com.kh.styleblending.board.model.dao.BoardDao;
import com.kh.styleblending.board.model.vo.Board;
import com.kh.styleblending.board.model.vo.BoardReply;
import com.kh.styleblending.board.model.vo.Declare;
import com.kh.styleblending.board.model.vo.FashionBoard;
import com.kh.styleblending.board.model.vo.Image;
import com.kh.styleblending.board.model.vo.PageInfo;
import com.kh.styleblending.board.model.vo.Search;

@Service("bService")
public class BoardServiceImpl implements BoardService{
	
	@Autowired
	private BoardDao bDao;

	@Autowired
	private DataSourceTransactionManager transactionManager;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	
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
			
		/*
		 * DefaultTransactionDefinition def = new DefaultTransactionDefinition();
		 * def.setPropagationBehavior(TransactionDefinition.PROPAGATION_REQUIRED);
		 * 
		 * TransactionStatus status = transactionManager.getTransaction(def);
		 * 
		 * try { sqlSession.getConnection().setAutoCommit(false); } catch (SQLException
		 * e) { e.printStackTrace(); }
		 * 
		 * 
		 * int result1 = bDao.insertBoard(b); int result2 = bDao.insertImgFile(i);
		 * 
		 * if(result1 > 0 && result2 > 0) { transactionManager.commit(status); return 1;
		 * }else { transactionManager.rollback(status); return 0; }
		 */
		
	
	}
	
	@Override
	public int insertfBoard(FashionBoard fb) {

		return bDao.insertfBoard(fb);
	}
	
	@Override
	public int insertbImgFile(Image i) {

		return bDao.insertbImgFile(i);
	}
	
	@Override
	public int insertfImgFile(Image i) {

		return bDao.insertfImgFile(i);
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
	public int updateBoardReply(int brno, String content) {

		return bDao.updateBoardReply(brno, content);
	}

	@Override
	public int deleteBoardReply(int brno) {

		return bDao.deleteBoardReply(brno);
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

		@Override
		public int getSearchListCount(Search sc) {

			return bDao.getSearchListCount(sc);
		}

		@Override
		public ArrayList<Board> SearchselectList(PageInfo pi, Search sc) {

			return bDao.SearchselectList(pi, sc);
		}

		@Override
		public FashionBoard selectfBoard(int fbno) {
	
			int result = bDao.FbupdateCount(fbno);
	
			if (result > 0) {
				return bDao.selectfBoard(fbno);
			} else {
				return null;
			}
		}

		@Override
		public int getfbListCount() {

			return bDao.getfbListCount();
		}

		@Override
		public int FbdeleteBoard(int fbno) {

			return bDao.FbdeleteBoard(fbno);
		}

		@Override
		public FashionBoard selectUpdatefBoard(int fbno) {

			return bDao.selectfBoard(fbno); 
		}

		@Override
		public int updatefBoard(FashionBoard fb) {

			return bDao.updatefBoard(fb);
		}

		@Override
		public int getfbSearchListCount(Search sc) {

			return bDao.getfbSearchListCount(sc);
		}

		@Override
		public ArrayList<FashionBoard> SearchfselectList(PageInfo pi, Search sc) {

			return bDao.SearchfselectList(pi, sc);
		}



}
