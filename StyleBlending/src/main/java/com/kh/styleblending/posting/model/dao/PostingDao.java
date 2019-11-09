package com.kh.styleblending.posting.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("pDao")
public class PostingDao {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	
	
	
	
}
