package com.kh.styleblending.member.model.service;

import java.sql.SQLException;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.TransactionDefinition;
import org.springframework.transaction.TransactionStatus;
import org.springframework.transaction.support.DefaultTransactionDefinition;

import com.kh.styleblending.member.model.dao.MemberDao;
import com.kh.styleblending.member.model.vo.Member;

@Repository("mService")
public class MemberServiceImpl implements MemberService{

	@Autowired
	private MemberDao mDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private DataSourceTransactionManager transactionManager;
	
	@Override
	public int insertMember(Member m) {
		return mDao.insertMember(m);
	}
	
	@Override
	public Member loginMember(Member m) {
		return mDao.loginMember(m);
	}
	
	@Override
	public int joinCheckEmail(String email) {
		return mDao.joinCheckEmail(email);
	}
	
	@Override
	public int joinCheckNickName(String nickName) {
		return mDao.joinCheckNickName(nickName);
	}
	
	@Override
	public Member getMember(String email) {
		return mDao.getMember(email);
	}
	
	// 비번찾기 - 1. 난수로 비번 업데이트 후, 2. 해당 멤버 select
	@Override
	public Member searchPass(String email, String randomPass) {
		
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
		
		int result = mDao.updateSearchPass(email, randomPass);
		Member m = new Member();

		if(result > 0) {
			transactionManager.commit(status);
			m = mDao.selectSearchPass(email);
		}else {
			transactionManager.rollback(status);
		}
		
		return m;
	}

	
	@Override
	public Member kakaoLogin(String email, String id, String nickName) {
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
		
		int result1 = mDao.selectKakao(id);
		Member mem = new Member();
		
		if(result1 > 0) {
			mem = mDao.getMember(email);
		}else {
			int result2 = mDao.insertKakao(email, id, nickName);
			if(result2 > 0) {
				transactionManager.commit(status);
				mem = mDao.getMember(email);
			}else {
				transactionManager.rollback(status);
			}
		}
		
		return mem;
		
	}
	
	
}
