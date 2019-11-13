package com.kh.styleblending.posting.model.service;

import java.util.ArrayList;

import com.kh.styleblending.posting.model.vo.Posting;
import com.kh.styleblending.posting.model.vo.Style;

public interface PostingService {

	int insertPosting(Posting p);
	
	int insertStyle(Style s);
	
}
