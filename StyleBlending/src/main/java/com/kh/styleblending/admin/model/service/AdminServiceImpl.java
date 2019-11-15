package com.kh.styleblending.admin.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.styleblending.admin.model.dao.AdminDao;
import com.kh.styleblending.admin.model.vo.Declare;
import com.kh.styleblending.admin.model.vo.PageInfo;
import com.kh.styleblending.member.model.vo.Member;

@Service("aService")
public class AdminServiceImpl implements AdminService{

	@Autowired
	private AdminDao aDao;

	@Override
	public int getMemberListCount() {
		// 총 회원수 조회용
		return aDao.getMemberListCount();
	}

	@Override
	public ArrayList<Member> selectMemberList(PageInfo pi) {
		// 회원목록 조회용
		return aDao.selectMemberList(pi);
	}

	@Override
	public int getDeclareListCount() {
		// 총 신고수 조회용
		return aDao.getDeclareListCount();
	}

	@Override
	public ArrayList<Declare> selectPostingDeclareList(PageInfo pi) {
		// 포스팅 신고목록 조회
		return aDao.selectPostingDeclareList(pi);
	}
	
	
}
