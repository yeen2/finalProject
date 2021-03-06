package com.kh.styleblending.board.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.styleblending.board.model.vo.Board;
import com.kh.styleblending.board.model.vo.BoardReply;
import com.kh.styleblending.board.model.vo.Declare;
import com.kh.styleblending.board.model.vo.FashionBoard;
import com.kh.styleblending.board.model.vo.Image;
import com.kh.styleblending.board.model.vo.PageInfo;
import com.kh.styleblending.board.model.vo.Search;

@Repository("bDao")
public class BoardDao {

	@Autowired
	private SqlSessionTemplate sqlSession;

	public int insertBoard(Board b) {
		
		return sqlSession.insert("boardMapper.insertBoard", b);
	}
	
	public int insertfBoard(FashionBoard fb) {
		
		return sqlSession.insert("boardMapper.insertfBoard", fb);
	}

	public int insertbImgFile(Image i) {

		return sqlSession.insert("boardMapper.insertbImgFile", i);
	}
	
	public int insertfImgFile(Image i) {

		return sqlSession.insert("boardMapper.insertfImgFile", i);
	}

	
	public Board selectBoard(int bno) {
		return sqlSession.selectOne("boardMapper.selectBoard", bno);
	}
	
	public int updateCount(int bno) {

		return sqlSession.update("boardMapper.updateCount", bno);
	}

	public int updateBoard(Board b) {

		return sqlSession.update("boardMapper.updateBoard", b);
	}

	public int deleteBoard(int bno) {

		return sqlSession.update("boardMapper.deleteBoard", bno);
	}
	
	// 댓글
	public ArrayList<BoardReply> selectBoardReplyList(int bno) {

		return (ArrayList)sqlSession.selectList("boardMapper.selectBoardReplyList", bno);
	}

	public int insertBoardReply(BoardReply r) {

		return sqlSession.insert("boardMapper.insertBoardReply", r);
	}

	public int getListCount() {

		return sqlSession.selectOne("boardMapper.getListCount");
	}
	// 댓글 수정
	public int updateBoardReply(int brno, String content) {
		HashMap<String, Object> hsm = new HashMap<>();
		hsm.put("brno", brno);
		hsm.put("content", content);
		
		return sqlSession.update("boardMapper.updateBoardReply", hsm);
	}
	
	// 댓글 삭제
	public int deleteBoardReply(int brno) {

		return sqlSession.update("boardMapper.deleteBoardReply", brno);
	}
	
	// 자유게시판 리스트
	public ArrayList<Board> selectList(PageInfo pi) {

		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());		
		
		ArrayList<Board> list = (ArrayList)sqlSession.selectList("boardMapper.selectList",null , rowBounds);
		
		return list;
	}

	// 패션 게시판 리스트
	public ArrayList<FashionBoard> fashionSelectList(PageInfo pi) {
		
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());		
		
		ArrayList<FashionBoard> list = (ArrayList)sqlSession.selectList("boardMapper.fashionSelectList", null , rowBounds);
		
		return list;
	}
	
	// --------------------------------- 추천 --------------------------------------
	public int insertBoardLike(int bno, int mno) {
		HashMap hsm = new HashMap<>();
		hsm.put("bno", bno);
		hsm.put("mno", mno);
		
		//System.out.println("insertBno : " + bno);
		//System.out.println("insertMno : " + mno);
		return sqlSession.insert("boardMapper.insertBoardLike", hsm);
	}

	public int deleteBoardLike(int bno, int mno) {
		HashMap hsm = new HashMap<>();
		hsm.put("bno", bno);
		hsm.put("mno", mno);
		//System.out.println("bnoDao : " + bno);
		//System.out.println("mnoDao : " + mno);
		return sqlSession.delete("boardMapper.deleteBoardLike", hsm);
	}

	public int blikeCheckUp(int bno) {

		return sqlSession.update("boardMapper.blikeCheckUp", bno);
	}

	public int blikeCheckDown(int bno) {

		return sqlSession.update("boardMapper.blikeCheckDown", bno);
	}

	public int selectBoardLikeCnt(int bno) {

		return sqlSession.selectOne("boardMapper.selectBoardLikeCnt", bno);
	}

	public int selectBoardLikeCheck(int bno, int mno) {
		HashMap hsm = new HashMap<>();
		hsm.put("bno", bno);
		hsm.put("mno", mno);
		
		//System.out.println("checkBno : " + bno);
		//System.out.println("checkMno : " + mno);
		return sqlSession.selectOne("boardMapper.selectBoardLikeCheck", hsm);
	}

	public int insertbDeclare(Declare d) {

		return sqlSession.insert("boardMapper.insertbDeclare", d);
	}

	public int getSearchListCount(Search sc) {

		return sqlSession.selectOne("boardMapper.getSearchListCount", sc);
	}

	public ArrayList<Board> SearchselectList(PageInfo pi, Search sc) {

		HashMap hsm = new HashMap();
		hsm.put("pi", pi);
		hsm.put("sc", sc);
		
		ArrayList<Board> list = (ArrayList)sqlSession.selectList("boardMapper.SearchselectList", hsm);
		//System.out.println("dao list : " + list);
		return list;
	}

	public FashionBoard selectfBoard(int fbno) {

		return sqlSession.selectOne("boardMapper.selectfBoard", fbno);
	}

	public int FbupdateCount(int fbno) {

		return sqlSession.update("boardMapper.FbupdateCount", fbno);
	}

	public int getfbListCount() {

		return sqlSession.selectOne("boardMapper.getfbListCount");
	}

	public int FbdeleteBoard(int fbno) {

		return sqlSession.update("boardMapper.FbdeleteBoard", fbno);
	}

	public int updatefBoard(FashionBoard fb) {

		System.out.println(fb);
		return sqlSession.update("boardMapper.updatefBoard", fb);
	}

	public int getfbSearchListCount(Search sc) {

		return sqlSession.selectOne("boardMapper.getfbSearchListCount", sc);
	}

	public ArrayList<FashionBoard> SearchfselectList(PageInfo pi, Search sc) {

		HashMap hsm = new HashMap();
		hsm.put("pi", pi);
		hsm.put("sc", sc);
		
		ArrayList<FashionBoard> list = (ArrayList)sqlSession.selectList("boardMapper.SearchfselectList", hsm);

		return list;
		
	}

	public int updatefImgfile(int resultImgno) {

		return sqlSession.update("boardMapper.updatefImgfile", resultImgno);
	}

	public int selectImg() {

		return sqlSession.selectOne("boardMapper.selectImg");
	}

	



	
	
	
	
}
