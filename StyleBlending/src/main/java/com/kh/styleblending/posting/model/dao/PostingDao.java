package com.kh.styleblending.posting.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.styleblending.posting.model.vo.Posting;
import com.kh.styleblending.posting.model.vo.Style;

@Repository("pDao")
public class PostingDao {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public int insertPosting(Posting p, ArrayList<Style> s) {
		return sqlSession.insert("postingMapper.insertPosting");
	}
	
	
	
	
}
