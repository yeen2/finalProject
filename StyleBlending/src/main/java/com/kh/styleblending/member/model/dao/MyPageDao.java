package com.kh.styleblending.member.model.dao;

import java.util.ArrayList;

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

	public ArrayList<Member> selectFanList(int mno) {
		return (ArrayList)sqlSession.selectList("mypageMapper.selectFanList", mno);
	}

	public ArrayList<Member> selectFwList(int mno) {
		return (ArrayList)sqlSession.selectList("mypageMapper.selectFwList", mno);
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
	
	public int[] selectFanCheckTab(Fan f) {
		return sqlSession.selectOne("mypageMapper.selectFanCheckTab", f);
	}
	
	public int insertFan(Fan f) {
		return sqlSession.insert("mypageMapper.insertFan", f);
	}
	
	public int deleteFan(Fan f) {
		return sqlSession.delete("mypageMapper.deleteFan", f);
	}
	

}
