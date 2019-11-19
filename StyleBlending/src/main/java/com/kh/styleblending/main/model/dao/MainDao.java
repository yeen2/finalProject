package com.kh.styleblending.main.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.styleblending.posting.model.vo.Posting;

@Repository("mainDao")
public class MainDao {

	@Autowired
	private SqlSessionTemplate sqlSession;

	public ArrayList<Posting> selectFourWrap() {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSession.selectList("mainMapper.selectFourWrap");
	}
	public ArrayList<Posting> selectPostList(){
		return (ArrayList)sqlSession.selectList("mainMapper.selectPostList");
	}
	
	public ArrayList<Posting> selectInfinityScroll() {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSession.selectList("mainMapper.selectInfinityScroll");
	}
	
	
	
	
}
