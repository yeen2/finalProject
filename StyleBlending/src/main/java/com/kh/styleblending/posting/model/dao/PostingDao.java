package com.kh.styleblending.posting.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.styleblending.posting.model.vo.Posting;
import com.kh.styleblending.posting.model.vo.PostingReply;
import com.kh.styleblending.posting.model.vo.Style;

@Repository("pDao")
public class PostingDao {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public int insertPosting(Posting p) {
		return sqlSession.insert("postingMapper.insertPosting", p);
	}
	
	public int insertStyle(Style s) {
		return sqlSession.insert("postingMapper.insertStyle", s);
	}
	
	public Posting selectOnePosting(int id) {
		return sqlSession.selectOne("postingMapper.selectOnePosting", id);
	}
	
	public ArrayList<PostingReply> selectReplyList(int pno) {
		return (ArrayList)sqlSession.selectList("postingMapper.selectReplyList", pno);
	}
	
	public int insertReply(PostingReply r) {
		return sqlSession.insert("postingMapper.insertReply", r);
	}
	
}
