package com.kh.styleblending.main.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.styleblending.admin.model.vo.Ad;
import com.kh.styleblending.main.model.vo.Notice;
import com.kh.styleblending.posting.model.vo.Posting;

@Repository("mainDao")
public class MainDao {

	@Autowired
	private SqlSessionTemplate sqlSession;

	public ArrayList<Posting> selectFourWrap() {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSession.selectList("mainMapper.selectFourWrap");
	}
	public ArrayList<Posting> selectPostList(int mno){
		return (ArrayList)sqlSession.selectList("mainMapper.selectPostList",mno);
	}
	
	public ArrayList<Posting> selectInfinityScroll(int mno) {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSession.selectList("mainMapper.selectInfinityScroll",mno);
	}
	public Ad selectAd() {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("mainMapper.selectAd");
	}

	public ArrayList<Posting> selectFilter(Posting p, int mno) {
		// TODO Auto-generated method stub
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("p",p);
		map.put("mno", mno);
		return (ArrayList)sqlSession.selectList("mainMapper.selectFilter",map);
	}
	public int increaseLikeCount(int pno) {
		// TODO Auto-generated method stub
		return sqlSession.update("mainMapper.increaseLikeCount",pno);
	}
	public ArrayList<Notice> selectNoticeContent(int nno) {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSession.selectList("mainMapper.selectNoticeContent",nno);
	}
	public int insertNotice(Notice n) {
		// TODO Auto-generated method stub
		return sqlSession.insert("mainMapper.insertNotice",n);
	}
	public int noticeUpdateConfirm(Notice n) {
		return sqlSession.update("mainMapper.updateNotice",n);
	}
	
	
	
	
}
