package com.kh.styleblending.posting.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.styleblending.posting.model.vo.Brand;
import com.kh.styleblending.posting.model.vo.Declare;
import com.kh.styleblending.posting.model.vo.Posting;
import com.kh.styleblending.posting.model.vo.PostingReply;
import com.kh.styleblending.posting.model.vo.Style;

@Repository("pDao")
public class PostingDao {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public int insertPosting(Posting p) {
		return sqlSession.insert("postingMapper.insertPosting", p);
	}
	
	public int insertStyle(Style s) {
		return sqlSession.insert("postingMapper.insertStyle", s);
	}
	
	public int insertHashtag(String hash) {
		return sqlSession.insert("postingMapper.insertHashtag", hash);
	}
	
	public Posting selectOnePosting(int id, int mno) {
		
		HashMap map = new HashMap<>();
		map.put("pno", id);
		map.put("mno", mno);
		return sqlSession.selectOne("postingMapper.selectOnePosting", map);
	}
	
	public ArrayList<PostingReply> selectReplyList(int pno) {
		return (ArrayList)sqlSession.selectList("postingMapper.selectReplyList", pno);
	}
	
	public int insertReply(PostingReply r) {
		return sqlSession.insert("postingMapper.insertReply", r);
	}
	
	public ArrayList<Style> selectStyle(int id) {
		return (ArrayList)sqlSession.selectList("postingMapper.selectStyle", id);
	}
	
	public int insertReReply(PostingReply r) {
		return sqlSession.insert("postingMapper.insertReReply", r);
	}
	
	public int insertPostingLike(int pno, int mno) {
		HashMap map = new HashMap<>();
		map.put("pno", pno);
		map.put("mno", mno);
		return sqlSession.insert("postingMapper.insertPostingLike", map);
	}
	
	public int deletePostingLike(int pno, int mno) {
		HashMap map = new HashMap<>();
		map.put("pno", pno);
		map.put("mno", mno);
		return sqlSession.insert("postingMapper.deletePostingLike", map);
	}
	
	public int increasePostingLike(int pno) {
		return sqlSession.update("postingMapper.increasePostingLike", pno);
	}
	
	public int decreasePostingLike(int pno) {
		return sqlSession.update("postingMapper.decreasePostingLike", pno);
	}
	
	public int selectPLikeCount(int pno) {
		return sqlSession.selectOne("postingMapper.selectPLikeCount", pno);
	}
	
	public int selectPLikeCheck(int pno, int mno) {
		HashMap map = new HashMap<>();
		map.put("pno", pno);
		map.put("mno", mno);
		return sqlSession.selectOne("postingMapper.selectPLikeCheck", map);
	}

	public int insertPDeclare(Declare d) {
		return sqlSession.insert("postingMapper.insertPDeclare", d);
	}
	
	public int deleteReply(int prno) {
		return sqlSession.update("postingMapper.deleteReply", prno);
	}
	
	public int updateReply(int prno, String content) {
		HashMap<String, Object> map = new HashMap<>();
		map.put("prno", prno);
		map.put("content", content);
		return sqlSession.update("postingMapper.updateReply", map);
	}
	
	public int deleteReReply(int prno) {
		return sqlSession.update("postingMapper.deleteReReply", prno);
	}
	
	public int updateReReply(int prno, String content) {
		HashMap<String, Object> map = new HashMap<>();
		map.put("prno", prno);
		map.put("content", content);
		return sqlSession.update("postingMapper.updateReReply", map);
	}
	
	//검색
	public List<Posting> selectSearchPosting(String type, String keyword, int mno){
		HashMap<String, Object> map = new HashMap<>();
		map.put("type", type);
		map.put("keyword", keyword);
		map.put("mno", mno);
		return sqlSession.selectList("postingMapper.selectSearchPosting", map);
	}
	
	public List<Posting> selectSearchPosting_brand(String keyword, int mno){
		HashMap<String, Object> map = new HashMap<>();
		map.put("keyword", keyword);
		map.put("mno", mno);
		return sqlSession.selectList("postingMapper.selectSearchPosting_brand", map);
	}
	
	public List<Posting> selectSearchPosting_hash(String keyword, int mno){
		HashMap<String, Object> map = new HashMap<>();
		map.put("keyword", keyword);
		map.put("mno", mno);
		return sqlSession.selectList("postingMapper.selectSearchPosting_hash", map);
	}
	
	public List<Posting> selectSearchPosting_loca(String keyword, int mno){
		HashMap<String, Object> map = new HashMap<>();
		map.put("keyword", keyword);
		map.put("mno", mno);
		return sqlSession.selectList("postingMapper.selectSearchPosting_loca", map);
	}
	
	public List<Posting> selectSearchPosting_cate(String keyword, int mno){
		HashMap<String, Object> map = new HashMap<>();
		map.put("keyword", keyword);
		map.put("mno", mno);
		return sqlSession.selectList("postingMapper.selectSearchPosting_cate", map);
	}
	
	public int insertLive(String keyword) {
		return sqlSession.insert("postingMapper.insertLive", keyword);
	}
	
	public ArrayList<Brand> selectBrand(String brand) {
		return (ArrayList)sqlSession.selectList("postingMapper.selectBrand", brand);
	}
	
	
	
	
	
	
	
	
	
}
