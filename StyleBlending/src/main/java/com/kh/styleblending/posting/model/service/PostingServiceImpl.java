package com.kh.styleblending.posting.model.service;

import java.sql.SQLException;
import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.stereotype.Service;
import org.springframework.transaction.TransactionDefinition;
import org.springframework.transaction.TransactionStatus;
import org.springframework.transaction.support.DefaultTransactionDefinition;

import com.kh.styleblending.posting.model.dao.PostingDao;
import com.kh.styleblending.posting.model.vo.Posting;
import com.kh.styleblending.posting.model.vo.Style;

import oracle.net.aso.b;

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
		
	
	
	
	
	
	
	
	
	
	
}
