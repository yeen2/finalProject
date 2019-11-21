package com.kh.styleblending.posting.model.service;

import java.util.ArrayList;

import com.kh.styleblending.posting.model.vo.Posting;
import com.kh.styleblending.posting.model.vo.PostingReply;
import com.kh.styleblending.posting.model.vo.SelectPosting;
import com.kh.styleblending.posting.model.vo.Style;

public interface PostingService {

	int insertPosting(Posting p, String[] cate, String[] brand, String[] color);
	
	Posting selectOnePosting(int id, int mno);
	
	ArrayList<PostingReply> selectReplyList(int pno);
	
	int insertReply(PostingReply r);
	
	ArrayList<Style> selectStyle(int id);
	
	int insertReReply(PostingReply r);
	
	// 포스팅 좋아요
	int insertPostingLike(int pno, int mno);
	
	int deletePostingLike(int pno, int mno);
	
	//해당 포스팅에 likeCount 수정
	int increasePostingLike(int pno);
	
	int decreasePostingLike(int pno);
	
	int selectPLikeCount(int pno);
	
	int selectPLikeCheck(int pno, int mno);
	
}
