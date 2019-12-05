package com.kh.styleblending.member.model.service;

import com.kh.styleblending.member.model.vo.Member;

public interface MemberService {

	// 1. 회원가입
	int insertMember(Member m);
	
	// 2. 로그인
	Member loginMember(Member m);
	
	// 3. 비밀번호 찾기
	Member searchPass(String email, String randomPass);
	
	// 4. 이메일ajax
	int joinCheckEmail(String email);
	
	// 5. 닉네임ajax
	int joinCheckNickName(String nickName);
	
	// 6. 자동로그인시, id로 정보 가져오기
	Member getMember(String email);
	
	// 7. 카카오로그인
	Member kakaoLogin(String email, String id, String nickName);

	
}
