package com.kh.styleblending.admin.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.styleblending.admin.model.vo.Ad;
import com.kh.styleblending.admin.model.vo.Declare;
import com.kh.styleblending.admin.model.vo.PageInfo;
import com.kh.styleblending.member.model.vo.Member;

@Repository("aDao")
public class AdminDao {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public int selectNewBcount() {
		return sqlSession.selectOne("adminMapper.selectNewBcount");
	}
	
	public ArrayList<Member> selectNewMember() {
		return (ArrayList)sqlSession.selectList("adminMapper.selectNewMember");
	}
	
	public int getMemberListCount() {
		return sqlSession.selectOne("adminMapper.getMemberListCount");
	}
	
	public ArrayList<Member> selectMemberList(PageInfo pi){
		
		int offset = (pi.getCurrentPage() -1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("adminMapper.selectMemberList", null, rowBounds);
	}
	
	public int deleteMember(ArrayList mno) {
	
		return sqlSession.update("adminMapper.deleteMember", mno);
	}
	
	public int getDeclareListCount(HashMap cate) {
		
		return sqlSession.selectOne("adminMapper.getDeclareListCount",cate);			
		
	}
	
	public ArrayList<Declare> selectDeclareList(PageInfo pi, HashMap cate){
		
		int offset = (pi.getCurrentPage() -1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("adminMapper.selectDeclareList", cate, rowBounds);
		
	}
	
	public int deleteDeclareBoard(ArrayList dno) {
		return sqlSession.update("adminMapper.deleteDeclareBoard",dno);
	}
	
	public int getAdListCount() {
		// 총 신고수 조회
		return sqlSession.selectOne("adminMapper.getAdListCount");
	}

	public ArrayList<Ad> selectAdList(PageInfo pi) {
		// 신고 목록조회
		int offset = (pi.getCurrentPage()-1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset,pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("adminMapper.selectAdList", null ,rowBounds);
	}
	
	public int insertAd(Ad ad) {
		return sqlSession.insert("adminMapper.insertAd",ad);
	}
	
	public int insertPay(Ad ad) {
		return sqlSession.insert("adminMapper.insertPay",ad);
	}
	
}
