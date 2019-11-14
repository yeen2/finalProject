package com.kh.styleblending.posting.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.stereotype.Service;

import com.kh.styleblending.posting.model.dao.PostingDao;
import com.kh.styleblending.posting.model.vo.Posting;
import com.kh.styleblending.posting.model.vo.Style;

@Service("pService")
public class PostingServiceImpl implements PostingService{

	@Autowired
	private PostingDao pDao;
	
	@Autowired
	private DataSourceTransactionManager transactionManager;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public int insertPosting(Posting p, String[] cate, String[] brand, String[] color) {
		
		int result1 = 
		
	}
		
}
