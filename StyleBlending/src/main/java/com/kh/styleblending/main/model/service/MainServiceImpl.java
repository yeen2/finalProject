package com.kh.styleblending.main.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.styleblending.main.model.dao.MainDao;
import com.kh.styleblending.posting.model.vo.Posting;

@Service("mainService")
public class MainServiceImpl implements MainService{

	@Autowired
	private MainDao mainDao;

	@Override
	public ArrayList<Posting> selectFourWrap() {
		
		return mainDao.selectFourWrap();
	}
	
	
	
	
	
	
	
	
	
}
