package com.kh.styleblending.main.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.styleblending.admin.model.vo.Ad;
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

	@Override
	public ArrayList<Posting> selectPostList() {
		// TODO Auto-generated method stub
		return mainDao.selectPostList();
	}

	@Override
	public ArrayList<Posting> selectInfinityScroll() {
		// TODO Auto-generated method stub
		return mainDao.selectInfinityScroll();
	}

	@Override
	public Ad selectAd() {
		// TODO Auto-generated method stub
		return mainDao.selectAd();
	}
	
	
	
	
	
	
	
	
	
}
