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

	public Member selectProfile(int mno) {
		return sqlSession.selectOne("mypageMapper.selectProfile", mno);
	}

	public ArrayList<Posting> selectPostingList(int mno) {
		return (ArrayList)sqlSession.selectList("mypageMapper.selectPostingList", mno);
	}

	public ArrayList<Posting> selectLikeList(int mno) {
		return (ArrayList)sqlSession.selectList("mypageMapper.selectLikeList", mno);
	}

	public ArrayList<Member> selectFanList(int mno) {
		return (ArrayList)sqlSession.selectList("mypageMapper.selectFanList", mno);
	}

	public ArrayList<Member> selectFwList(int mno) {
		return (ArrayList)sqlSession.selectList("mypageMapper.selectFwList", mno);
	}

	public int updateProfile(Member m) {
		return sqlSession.update("mypageMapper.updateProfile", m);
	}

	public ArrayList<Ad> selectAdList(int mno) {
		return (ArrayList)sqlSession.selectList("mypageMapper.selectAdList", mno);
	}

	public int updatePass(Member m) {
		return sqlSession.update("mypageMapper.updatePass", m);
	}

	public int deleteMember(int mno) {
		return sqlSession.update("mypageMapper.deleteMember", mno);
	}
	
	

}
