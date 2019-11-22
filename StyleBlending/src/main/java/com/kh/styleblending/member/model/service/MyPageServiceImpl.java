package com.kh.styleblending.member.model.service;

import java.sql.SQLException;
import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.stereotype.Service;
import org.springframework.transaction.TransactionDefinition;
import org.springframework.transaction.TransactionStatus;
import org.springframework.transaction.support.DefaultTransactionDefinition;

import com.kh.styleblending.admin.model.vo.Ad;
import com.kh.styleblending.member.model.dao.MyPageDao;
import com.kh.styleblending.member.model.vo.Alarm;
import com.kh.styleblending.member.model.vo.Fan;
import com.kh.styleblending.member.model.vo.Member;
import com.kh.styleblending.member.model.vo.PageInfo;
import com.kh.styleblending.posting.model.vo.Posting;
import com.kh.styleblending.posting.model.vo.Style;

@Service("mpService")
public class MyPageServiceImpl implements MyPageService {

	@Autowired
	private MyPageDao mpDao;
	
	@Autowired
	private DataSourceTransactionManager transactionManager;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public Member selectProfile(int mno) {
		return mpDao.selectProfile(mno);
	}

	@Override
	public ArrayList<Posting> selectPostingList(int mno) {
		return mpDao.selectPostingList(mno);
	}

	@Override
	public ArrayList<Posting> selectLikeList(int mno) {
		return mpDao.selectLikeList(mno);
	}

	@Override
	public ArrayList<Member> selectFanList(int mno, int loginMno) {
		return mpDao.selectFanList(mno, loginMno);
	}

	@Override
	public ArrayList<Member> selectFwList(int mno, int loginMno) {
		return mpDao.selectFwList(mno, loginMno);
	}

	@Override
	public int updateProfile(Member m) {
		return mpDao.updateProfile(m);
	}

	@Override
	public int getAdListCount(int mno) {
		return mpDao.getAdListCount(mno);
	}
	
	@Override
	public ArrayList<Ad> selectAdList(int mno, PageInfo pi) {
		return mpDao.selectAdList(mno, pi);
	}

	@Override
	public int updatePass(Member m) {
		return mpDao.updatePass(m);
	}

	@Override
	public int deleteMember(int mno) {
		return mpDao.deleteMember(mno);
	}

	@Override
	public int selectAlarmCount(int mno) {
		return mpDao.selectAlarmCount(mno);
	}

	@Override
	public ArrayList<Alarm> selectAlarmList(int mno) {
		return mpDao.selectAlarmList(mno);
	}

	@Override
	public Member updateProfileImg(Member m) {
		int mno = m.getMno();
		
		DefaultTransactionDefinition def = new DefaultTransactionDefinition();
		def.setPropagationBehavior(TransactionDefinition.PROPAGATION_REQUIRED);
		
		TransactionStatus status = transactionManager.getTransaction(def);
		
		try {
			sqlSession.getConnection().setAutoCommit(false);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		int result = mpDao.updateProfileImg(m);
		Member mem = mpDao.selectProfile(mno);
		
		if(result > 0 && mem != null) {
			transactionManager.commit(status);
			return mem;
		}else {
			transactionManager.rollback(status);
			return null;
		}
	}

	@Override
	public int selectFanCheck(Fan f) {
		return mpDao.selectFanCheck(f);
	}

	@Override
	public int[] selectFanCheckTab(Fan f) {
		return mpDao.selectFanCheckTab(f);
	}
	
	@Override
	public int insertFan(Fan f) {
		return mpDao.insertFan(f);
	}

	@Override
	public int deleteFan(Fan f) {
		return mpDao.deleteFan(f);
	}

	@Override
	public ArrayList<Member> selectSearchFan(String search) {
		return mpDao.selectSearchFan(search);
	}

	@Override
	public ArrayList<Style> selectSearchBrand(String search) {
		return mpDao.selectSearchBrand(search);
	}

	@Override
	public ArrayList<Posting> selectSearchHashtag(String search) {
		return mpDao.selectSearchHashtag(search);
	}

	@Override
	public ArrayList<Posting> selectSearchLoca(String search) {
		return mpDao.selectSearchLoca(search);
	}



}
