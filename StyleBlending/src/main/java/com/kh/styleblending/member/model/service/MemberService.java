package com.kh.styleblending.member.model.service;

import com.kh.styleblending.member.model.vo.Member;

public interface MemberService {

	// 1. 회원가입
	int insertMember(Member m);
	
	// 2. 로그인
	Member loginMember(Member m);
	
	
	
	
	
}
