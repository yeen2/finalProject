package com.kh.styleblending.member.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.styleblending.member.model.dao.MemberDao;
import com.kh.styleblending.member.model.vo.Member;

@Repository("mService")
public class MemberServiceImpl implements MemberService{

	@Autowired
	private MemberDao mDao;
	
	@Override
	public int insertMember(Member m) {
		return mDao.insertMember(m);
	}
	
	@Override
	public Member loginMember(Member m) {
		return mDao.loginMember(m);
	}
	
	
	
	
	
}
