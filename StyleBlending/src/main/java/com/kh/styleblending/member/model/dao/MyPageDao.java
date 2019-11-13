package com.kh.styleblending.member.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.styleblending.admin.model.vo.Ad;
import com.kh.styleblending.member.model.vo.Member;
import com.kh.styleblending.posting.model.vo.Posting;

@Repository("mpDao")
public class MyPageDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	public Member selectProfile(Member m) {
		return sqlSession.selectOne("mypageMapper.selectProfile", m);
	}

	public ArrayList<Posting> selectPostingList(Member m) {
		return (ArrayList)sqlSession.selectList("mypageMapper.selectPostingList", m);
	}

	public ArrayList<Posting> selectLikeList(Member m) {
		return (ArrayList)sqlSession.selectList("mypageMapper.selectLikeList", m);
	}

	public ArrayList<Member> selectFanList(Member m) {
		return (ArrayList)sqlSession.selectList("mypageMapper.selectFanList", m);
	}

	public ArrayList<Member> selectFollowingList(Member m) {
		return (ArrayList)sqlSession.selectList("mypageMapper.selectFollowingList", m);
	}

	public int updateProfile(Member m) {
		return sqlSession.update("mypageMapper.updateProfile", m);
	}

	public ArrayList<Ad> selectAdList(Member m) {
		return (ArrayList)sqlSession.selectList("mypageMapper.selectAdList", m);
	}

	public int updatePass(Member m) {
		return sqlSession.update("mypageMapper.updatePass", m);
	}

	public int deleteMember(String email) {
		return sqlSession.update("mypageMapper.deleteMember", email);
	}
	
	

}
