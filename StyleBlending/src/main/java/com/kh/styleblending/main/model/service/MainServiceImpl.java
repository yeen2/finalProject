package com.kh.styleblending.main.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.styleblending.admin.model.vo.Ad;
import com.kh.styleblending.main.model.dao.MainDao;
import com.kh.styleblending.main.model.vo.Notice;
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
	public ArrayList<Posting> selectPostList(int mno) {
		// TODO Auto-generated method stub
		return mainDao.selectPostList(mno);
	}

	@Override
	public ArrayList<Posting> selectInfinityScroll(int mno) {
		// TODO Auto-generated method stub
		return mainDao.selectInfinityScroll(mno);
	}

	@Override
	public Ad selectAd() {
		// TODO Auto-generated method stub
		return mainDao.selectAd();
	}

	@Override
	public ArrayList<Posting> selectFilter(Posting p, int mno) {
		// TODO Auto-generated method stub
		return mainDao.selectFilter(p, mno);
	}

	@Override
	public int increaseLikeCount(int pno) {
		// TODO Auto-generated method stub
		return mainDao.increaseLikeCount(pno);
	}

	
	public ArrayList<Notice> selectNoticeContent(int nno){
		return mainDao.selectNoticeContent(nno);
	}
	
	
	
	
	
	
	
}
