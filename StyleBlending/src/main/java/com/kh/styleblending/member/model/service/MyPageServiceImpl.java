package com.kh.styleblending.member.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.styleblending.admin.model.vo.Ad;
import com.kh.styleblending.member.model.dao.MyPageDao;
import com.kh.styleblending.member.model.vo.Alarm;
import com.kh.styleblending.member.model.vo.Fan;
import com.kh.styleblending.member.model.vo.Member;
import com.kh.styleblending.member.model.vo.PageInfo;
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
	public int updateProfileImg(Member m) {
		return mpDao.updateProfileImg(m);
	}

	@Override
	public int selectFanCheck(Fan f) {
		return mpDao.selectFanCheck(f);
	}


}
