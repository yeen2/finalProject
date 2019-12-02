package com.kh.styleblending.member.model.service;

import java.util.ArrayList;

import com.kh.styleblending.admin.model.vo.Ad;
import com.kh.styleblending.member.model.vo.Alarm;
import com.kh.styleblending.member.model.vo.Fan;
import com.kh.styleblending.member.model.vo.Member;
import com.kh.styleblending.member.model.vo.PageInfo;
import com.kh.styleblending.posting.model.vo.Posting;
import com.kh.styleblending.posting.model.vo.Style;

public interface MyPageService {
	
	// 프로필 페이지 - 프로필 가져오기
	Member selectProfile(int mno);
	
	// 프로필 페이지 - 포스팅한 사진 리스트
	ArrayList<Posting> selectPostingList(int mno);
	
	// 프로필 페이지 - 포스팅 좋아요한 사진 리스트
	ArrayList<Posting> selectLikeList(int mno);
	
	// 프로필 페이지 - 팬 리스트
	ArrayList<Member> selectFanList(int mno, int loginMno);
	
	// 프로필 페이지 - 팔로잉 리스트
	ArrayList<Member> selectFwList(int mno, int loginMno);
	
	// 프로필 페이지 - 프로필 이미지 수정, 기본이미지로 변경
	Member updateProfileImg(Member m);
	
	// 프로필 관리 - 프로필 수정
	Member updateProfile(Member m);
	
	// 프로필 관리 - 내 광고 리스트 카운트
	int getAdListCount(int mno);
	
	// 프로필 관리 - 내 광고 리스트
	ArrayList<Ad> selectAdList(int mno, PageInfo pi);
	
	// 프로필 관리 - 비밀번호 변경
	Member updatePass(Member m);
	
	// 프로필 관리 - 회원 탈퇴
	int deleteMember(int mno);
	
	// 알람 카운트
	int selectAlarmCount(int mno);
	
	// 알람 리스트
	ArrayList<Alarm> selectAlarmList(int mno);
	
	// 프로필 페이지 - 팬 버튼 체크
	int selectFanCheck(Fan f);
	
	// 프로필 페이지 - insert 팬
	int insertFan(Fan f);
	
	// 프로필 페이지 - delete 팬
	int deleteFan(Fan f);
	
	// 팬 검색
	ArrayList<Member> selectSearchFan(String search);
	// 브랜드 검색
	ArrayList<Style> selectSearchBrand(String search);
	// 해시태그 검색
	ArrayList<Posting> selectSearchHashtag(String search);
	// 위치 검색
	ArrayList<Posting> selectSearchLoca(String search);

	// 알람 모두 읽음 표시
	int updateAlarm(int mno);
	
	// 알람 하나만 읽음 표시
	int updateAlarmOne(int alno);
	
	// 닉네임 중복체크
	int nickNameCheck(Member m);
	
	// 광고 등록 취소
	int deleteAd(Ad ad);

}
