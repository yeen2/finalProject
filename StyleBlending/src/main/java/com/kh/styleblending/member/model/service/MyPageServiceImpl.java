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
	public ArrayList<Member> selectFanList(int mno) {
		return mpDao.selectFanList(mno);
	}

	@Override
	public ArrayList<Member> selectFwList(int mno) {
		return mpDao.selectFwList(mno);
	}

	@Override
	public int updateProfile(Member m) {
		return mpDao.updateProfile(m);
	}

	@Override
	public ArrayList<Ad> selectAdList(int mno) {
		return mpDao.selectAdList(mno);
	}

	@Override
	public int updatePass(Member m) {
		return mpDao.updatePass(m);
	}

	@Override
	public int deleteMember(int mno) {
		return mpDao.deleteMember(mno);
	}

}
