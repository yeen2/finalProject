package com.kh.styleblending.member.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.styleblending.admin.model.vo.Ad;
import com.kh.styleblending.member.model.vo.Alarm;
import com.kh.styleblending.member.model.vo.Fan;
import com.kh.styleblending.member.model.vo.Member;
import com.kh.styleblending.member.model.vo.PageInfo;
import com.kh.styleblending.posting.model.vo.Posting;
import com.kh.styleblending.posting.model.vo.Style;

@Repository("mpDao")
public class MyPageDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	public Member selectProfile(int mno) {
		return sqlSession.selectOne("mypageMapper.selectProfile", mno);
	}

	public ArrayList<Posting> selectPostingList(int mno) {
		return (ArrayList)sqlSession.selectList("mypageMapper.selectPostingList", mno);
	}

	public ArrayList<Posting> selectLikeList(int mno) {
		return (ArrayList)sqlSession.selectList("mypageMapper.selectLikeList", mno);
	}

	public ArrayList<Member> selectFanList(int mno, int loginMno) {
		HashMap map = new HashMap<>();
		map.put("mno", mno);
		map.put("loginMno", loginMno);
		
		return (ArrayList)sqlSession.selectList("mypageMapper.selectFanList", map);
	}

	public ArrayList<Member> selectFwList(int mno, int loginMno) {
		HashMap map = new HashMap<>();
		map.put("mno", mno);
		map.put("loginMno", loginMno);
		
		return (ArrayList)sqlSession.selectList("mypageMapper.selectFwList", map);
	}

	public int updateProfile(Member m) {
		return sqlSession.update("mypageMapper.updateProfile", m);
	}

	public int getAdListCount(int mno) {
		return sqlSession.selectOne("mypageMapper.getAdListCount", mno);
	}
	
	public ArrayList<Ad> selectAdList(int mno, PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("mypageMapper.selectAdList", mno, rowBounds);
	}

	public int updatePass(Member m) {
		return sqlSession.update("mypageMapper.updatePass", m);
	}

	public int deleteMember(int mno) {
		return sqlSession.update("mypageMapper.deleteMember", mno);
	}
	
	public int selectAlarmCount(int mno) {
		return sqlSession.selectOne("mypageMapper.selectAlarmCount", mno);
	}
	
	public ArrayList<Alarm> selectAlarmList(int mno){
		return (ArrayList)sqlSession.selectList("mypageMapper.selectAlarmList", mno);
	}
	
	public int updateProfileImg(Member m) {
		return sqlSession.update("mypageMapper.updateProfileImg", m);
	}
	
	public int selectFanCheck(Fan f) {
		return sqlSession.selectOne("mypageMapper.selectFanCheck", f);
	}
	
	public int insertFan(Fan f) {
		return sqlSession.insert("mypageMapper.insertFan", f);
	}
	
	public int deleteFan(Fan f) {
		return sqlSession.delete("mypageMapper.deleteFan", f);
	}

	public ArrayList<Member> selectSearchFan(String search) {
		return (ArrayList)sqlSession.selectList("mypageMapper.selectSearchFan", search);
	}

	public ArrayList<Style> selectSearchBrand(String search) {
		return (ArrayList)sqlSession.selectList("mypageMapper.selectSearchBrand", search);
	}

	public ArrayList<Posting> selectSearchHashtag(String search) {
		return (ArrayList)sqlSession.selectList("mypageMapper.selectSearchHashtag", search);
	}

	public ArrayList<Posting> selectSearchLoca(String search) {
		return (ArrayList)sqlSession.selectList("mypageMapper.selectSearchLoca", search);
	}

	public int updateAlarm(int mno) {
		return sqlSession.update("mypageMapper.updateAlarm", mno);
	}

	public int nickNameCheck(Member m) {
		return sqlSession.selectOne("mypageMapper.nickNameCheck", m);
	}

	public int updateAlarmOne(int alno) {
		return sqlSession.update("mypageMapper.updateAlarmOne", alno);
	}

	public int deleteAd(Ad ad) {
		return sqlSession.delete("mypageMapper.deleteAd", ad);
	}

	public int deletePay(Ad ad) {
		return sqlSession.update("mypageMapper.deletePay", ad);
	}
	

}
