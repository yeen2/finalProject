package com.kh.styleblending.member.model.dao;

import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.styleblending.member.model.vo.Member;

@Repository("mDao")
public class MemberDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public int insertMember(Member m) {
		return sqlSession.insert("memberMapper.insertMember", m);
	}
	
	public Member loginMember(Member m) {
		return sqlSession.selectOne("memberMapper.loginMember", m);
	}
	
	public int joinCheckEmail(String email) {
		return sqlSession.selectOne("memberMapper.joinCheckEmail", email);
	}
	
	public int joinCheckNickName(String nickName) {
		return sqlSession.selectOne("memberMapper.joinCheckNickName", nickName);
	}
	
	public Member getMember(String email) {
		return sqlSession.selectOne("memberMapper.getMember", email);
	}
	
	public int updateSearchPass(String email, String randomPass) {
		HashMap<String, String> map = new HashMap<>();
		map.put("email", email);
		map.put("pass", randomPass);
		return sqlSession.update("memberMapper.updateSearchPass", map);
	}
	
	public Member selectSearchPass(String email) {
		return sqlSession.selectOne("memberMapper.selectSearchPass", email);
	}
	
	
	
}
