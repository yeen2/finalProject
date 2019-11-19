package com.kh.styleblending.admin.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.kh.styleblending.admin.model.vo.Ad;
import com.kh.styleblending.admin.model.vo.Declare;
import com.kh.styleblending.admin.model.vo.PageInfo;
import com.kh.styleblending.member.model.vo.Member;

public interface AdminService {
	
	// 오늘자 새게시물수
	int selectNewBcount();
	// 오늘자 가입자수
	ArrayList<Member> selectNewMember();
	
	// 총 회원수 조회용
	int getMemberListCount();
	
	// 회원 목록 조회용
	ArrayList<Member> selectMemberList(PageInfo pi);
	
	// 회원 탈퇴
	int deleteMember(ArrayList mno);
	
	// 총 신고수 조회용
	int getDeclareListCount(HashMap cate);
	
	// 신고목록 조회
	ArrayList<Declare> selectDeclareList(PageInfo pi, HashMap cate);
	
	// 신고게시물 삭제
	int deleteDeclareBoard(ArrayList dno);

	// 총 광고수 조회
	int getAdListCount();
	
	// 광고 목록 조회용
	ArrayList<Ad> selectAdList(PageInfo pi);
	
	// 광고 등록
	int insertAd(Ad ad);
	
	
	
}
