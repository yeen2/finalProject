package com.kh.styleblending.main.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("mainDao")
public class MainDao {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	
	
	
}
