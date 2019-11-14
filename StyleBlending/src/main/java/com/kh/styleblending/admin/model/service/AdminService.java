package com.kh.styleblending.admin.model.service;

import java.util.ArrayList;

import com.kh.styleblending.admin.model.vo.PageInfo;
import com.kh.styleblending.member.model.vo.Member;

public interface AdminService {
	
	// 총 회원수 조회용
	int getMemberListCount();
	
	// 회원 목록 조회용
	ArrayList<Member> selectMemberList(PageInfo pi);

}
