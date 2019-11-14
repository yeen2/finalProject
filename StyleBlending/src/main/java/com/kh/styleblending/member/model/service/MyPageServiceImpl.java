package com.kh.styleblending.member.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.styleblending.admin.model.vo.Ad;
import com.kh.styleblending.member.model.dao.MyPageDao;
import com.kh.styleblending.member.model.vo.Member;
import com.kh.styleblending.posting.model.vo.Posting;

@Service("mpService")
public class MyPageServiceImpl implements MyPageService {

	@Autowired
	private MyPageDao mpDao;
	
	@Override
	public Member selectProfile(Member m) {
		return mpDao.selectProfile(m);
	}

	@Override
	public ArrayList<Posting> selectPostingList(Member m) {
		return mpDao.selectPostingList(m);
	}

	@Override
	public ArrayList<Posting> selectLikeList(Member m) {
		return mpDao.selectLikeList(m);
	}

	@Override
	public ArrayList<Member> selectFanList(Member m) {
		return mpDao.selectFanList(m);
	}

	@Override
	public ArrayList<Member> selectFollowingList(Member m) {
		return mpDao.selectFollowingList(m);
	}

	@Override
	public int updateProfile(Member m) {
		return mpDao.updateProfile(m);
	}

	@Override
	public ArrayList<Ad> selectAdList(Member m) {
		return mpDao.selectAdList(m);
	}

	@Override
	public int updatePass(Member m) {
		return mpDao.updatePass(m);
	}

	@Override
	public int deleteMember(String email) {
		return mpDao.deleteMember(email);
	}

}
