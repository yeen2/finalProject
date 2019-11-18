package com.kh.styleblending.main.model.service;

import java.util.ArrayList;

import com.kh.styleblending.posting.model.vo.Posting;

public interface MainService {
	
	//메인 상단 좋아요 순 4개 사진
	ArrayList<Posting> selectFourWrap();

}
