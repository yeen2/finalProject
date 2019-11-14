package com.kh.styleblending.admin.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.styleblending.admin.model.vo.PageInfo;
import com.kh.styleblending.member.model.vo.Member;

@Repository("aDao")
public class AdminDao {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public int getMemberListCount() {
		return sqlSession.selectOne("adminMapper.getMemberListCount");
	}
	
	public ArrayList<Member> selectMemberList(PageInfo pi){
		return (ArrayList)sqlSession.selectList("adminMapper.selectMemberList", pi);
	}
	
	public int getDeclareListCount() {
		return sqlSession.selectOne("adminMapper.getDeclareListCount");
	}
	
	
}
