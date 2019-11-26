package com.kh.styleblending.posting.model.service;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.stereotype.Service;
import org.springframework.transaction.TransactionDefinition;
import org.springframework.transaction.TransactionStatus;
import org.springframework.transaction.support.DefaultTransactionDefinition;

import com.kh.styleblending.posting.model.dao.PostingDao;
import com.kh.styleblending.posting.model.vo.Declare;
import com.kh.styleblending.posting.model.vo.Posting;
import com.kh.styleblending.posting.model.vo.PostingReply;
import com.kh.styleblending.posting.model.vo.Style;

@Service("pService")
public class PostingServiceImpl implements PostingService {

	@Autowired
	private PostingDao pDao;
	
	@Autowired
	private DataSourceTransactionManager transactionManager;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public int insertPosting(Posting p, String[] cate, String[] brand, String[] color) {
		
		DefaultTransactionDefinition def = new DefaultTransactionDefinition();
		def.setPropagationBehavior(TransactionDefinition.PROPAGATION_REQUIRED);
		// PROPAGATION_REQUIRED : 기존에 트랜잭션이 없으면 새로 만들고 있으면 기존꺼라 같이 묶여라
		
		// 트랜잭션 상태를 관리하는 객체
		TransactionStatus status = transactionManager.getTransaction(def);
		
		try {
			sqlSession.getConnection().setAutoCommit(false);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		
		int result1 = pDao.insertPosting(p);
		int result2 = 0;
		Style s = new Style();
		for(int i=0; i<cate.length; i++) {
			
			s.setCate(cate[i]);
			s.setBrand(brand[i]);
			s.setColor(color[i]);
			
			result2 += pDao.insertStyle(s);
		}
		
		if(result1 > 0 && result2 >= cate.length) {
			transactionManager.commit(status);
			return 1;
		}else {
			transactionManager.rollback(status);
			return 0;
		}
	}
		
	
	@Override
	public Posting selectOnePosting(int id, int mno) {
		return pDao.selectOnePosting(id,mno);
	}
	
	@Override
	public ArrayList<PostingReply> selectReplyList(int pno) {
		return pDao.selectReplyList(pno);
	}
	
	@Override
	public int insertReply(PostingReply r) {
		return pDao.insertReply(r);
	}
	
	@Override
	public ArrayList<Style> selectStyle(int id) {
		return pDao.selectStyle(id);
	}
	
	@Override
	public int insertReReply(PostingReply r) {
		return pDao.insertReReply(r);
	}
	
	@Override
	public int insertPostingLike(int pno, int mno) {
		return pDao.insertPostingLike(pno, mno);
	}
	
	@Override
	public int deletePostingLike(int pno, int mno) {
		return pDao.deletePostingLike(pno, mno);
	}
	
	@Override
	public int increasePostingLike(int pno) {
		return pDao.increasePostingLike(pno);
	}
	
	@Override
	public int decreasePostingLike(int pno) {
		return pDao.decreasePostingLike(pno);
	}
	
	@Override
	public int selectPLikeCount(int pno) {
		return pDao.selectPLikeCount(pno);
	}
	
	@Override
	public int selectPLikeCheck(int pno, int mno) {
		return pDao.selectPLikeCheck(pno, mno);
	}
	
	@Override
	public int insertPDeclare(Declare d) {
		return pDao.insertPDeclare(d);
	}
	
	@Override
	public int deleteReply(int prno) {
		return pDao.deleteReply(prno);
	}
	
	@Override
	public int updateReply(int prno, String content) {
		return pDao.updateReply(prno, content);
	}
	
	@Override
	public int deleteReReply(int prno) {
		return pDao.deleteReReply(prno);
	}
	
	@Override
	public int updateReReply(int prno, String content) {
		return pDao.updateReReply(prno, content);
	}
	
	@Override
	public List<Posting> selectSearchPosting_brand(String keyword, int mno) {
		return pDao.selectSearchPosting_brand(keyword, mno);
	}
	
	@Override
	public List<Posting> selectSearchPosting_hash(String keyword, int mno) {
		return pDao.selectSearchPosting_hash(keyword, mno);
	}
	
	@Override
	public List<Posting> selectSearchPosting_loca(String keyword, int mno) {
		return pDao.selectSearchPosting_loca(keyword, mno);
	}
	
	
	
	
	
}
