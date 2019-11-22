package com.kh.styleblending.admin.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.styleblending.admin.model.dao.AdminDao;
import com.kh.styleblending.admin.model.vo.Ad;
import com.kh.styleblending.admin.model.vo.Declare;
import com.kh.styleblending.admin.model.vo.PageInfo;
import com.kh.styleblending.member.model.vo.Member;

@Service("aService")
public class AdminServiceImpl implements AdminService{

	@Autowired
	private AdminDao aDao;
	
	@Override
	public int selectNewBcount() {
		// 오늘자 새 게시물수
		return aDao.selectNewBcount();
	}
	
	@Override
	public ArrayList<Member> selectNewMember() {
		// 오늘자 가입자수
		return aDao.selectNewMember();
	}
	
	@Override
	public int selectNoCheckDeclare() {
		// 미확인 신고수
		return aDao.selectNoCheckDeclare();
	}
	
	@Override
	public Ad selectStartAd() {
		// 진행중인 광고
		return aDao.selectStartAd();
	}

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

	@Override
	public int getAdListCount() {
		// 총 광고수 조회
		return aDao.getAdListCount();
	}

	@Override
	public ArrayList<Ad> selectAdList(PageInfo pi) {
		// 광고 목록조회
		return aDao.selectAdList(pi);
	}
	
	@Override
	public ArrayList<Ad> selectAdNewList() {
		// 승인대기 광고 목록 리스트
		return aDao.selectAdNewList();
	}

	@Override
	public int insertAd(Ad ad) {
		// 광고 등록
		
		int result = aDao.insertPay(ad);
		
		if(result > 0) {
			//System.out.println("impl : 결제 성공 ");
			return aDao.insertAd(ad);
		}else {
			return 0;
		}
		
	}

	

	


	

	

	
	
	
}
