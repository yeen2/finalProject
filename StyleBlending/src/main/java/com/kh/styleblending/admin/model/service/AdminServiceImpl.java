package com.kh.styleblending.admin.model.service;

import java.util.ArrayList;
import java.util.HashMap;

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
	public int deleteMember(ArrayList mno) {
		// 회원 탈퇴
		return aDao.deleteMember(mno);
	}

	@Override
	public int getDeclareListCount(HashMap cate) {
		// 총 신고수 조회용
		return aDao.getDeclareListCount(cate);
	}

	@Override
	public ArrayList<Declare> selectDeclareList(PageInfo pi, HashMap cate) {
		// 포스팅 신고목록 조회
		return aDao.selectDeclareList(pi,cate);
	}

	@Override
	public int deleteDeclareBoard(ArrayList dno) {
		// 신고 게시물삭제
		int result = aDao.deleteDeclareBoard(dno);
		return result;
		/*
		 * if(result > 0) { // 게시물 삭제 return aDao.deleteBoard(dnoArr);
		 * 
		 * }else { return null; }
		 */
		
	}

	
	
	
}
