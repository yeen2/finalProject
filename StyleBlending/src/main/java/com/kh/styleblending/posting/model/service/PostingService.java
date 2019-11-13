package com.kh.styleblending.posting.model.service;

import com.kh.styleblending.posting.model.vo.Posting;
import com.kh.styleblending.posting.model.vo.Style;

public interface PostingService {

	int insertPosting(Posting po, Style st);
	
	
	
}
