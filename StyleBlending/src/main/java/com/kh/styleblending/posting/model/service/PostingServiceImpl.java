package com.kh.styleblending.posting.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.styleblending.posting.model.dao.PostingDao;
import com.kh.styleblending.posting.model.vo.Posting;
import com.kh.styleblending.posting.model.vo.Style;

@Service("pService")
public class PostingServiceImpl implements PostingService{

	@Autowired
	private PostingDao pDao;
	
	@Override
	public int insertPosting(Posting p, Style s) {
		return pDao.insertPosting(p,s);
	}
	
	
	
	
	
	
	
}
