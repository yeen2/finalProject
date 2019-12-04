package com.kh.styleblending.admin.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.styleblending.admin.model.dao.AdminDao;
import com.kh.styleblending.admin.model.vo.Ad;
import com.kh.styleblending.admin.model.vo.Declare;
import com.kh.styleblending.admin.model.vo.PageInfo;
import com.kh.styleblending.admin.model.vo.Statistics;
import com.kh.styleblending.main.model.vo.Notice;
import com.kh.styleblending.member.model.vo.Member;
import com.kh.styleblending.posting.model.vo.Hash;
import com.kh.styleblending.posting.model.vo.Style;

@Service("aService")
public class AdminServiceImpl implements AdminService{

	@Autowired
	private AdminDao aDao;
	
	@Override
	public int selectNewBcount() {
		// 오늘자 새 게시물수
		return aDao.selectNewBcount();
	}
	
	@Override
	public ArrayList<Member> selectNewMember() {
		// 오늘자 가입자수
		return aDao.selectNewMember();
	}
	
	@Override
	public int selectNoCheckDeclare() {
		// 미확인 신고수
		return aDao.selectNoCheckDeclare();
	}
	
	@Override
	public Ad selectStartAd() {
		// 진행중인 광고
		return aDao.selectStartAd();
	}
	
	@Override
	public ArrayList<Hash> selectHashRank() {
		// hash 순위
		return aDao.selectHashRank();
	}

	@Override
	public int getMemberListCount(String keyword) {
		// 총 회원수 조회용
		return aDao.getMemberListCount(keyword);
	}

	@Override
	public ArrayList<Member> selectMemberList(PageInfo pi, String keyword) {
		// 회원목록 조회용
		return aDao.selectMemberList(pi, keyword);
	}
	
	@Override
	public int deleteMember(ArrayList mno) {
		// 회원 탈퇴
		return aDao.deleteMember(mno);
	}

	@Override
	public int getDeclareListCount(HashMap cate) {
		// 총 신고수 조회용
		return aDao.getDeclareListCount(cate);
	}

	@Override
	public ArrayList<Declare> selectDeclareList(PageInfo pi, HashMap cate) {
		// 포스팅 신고목록 조회
		return aDao.selectDeclareList(pi,cate);
	}

	@Override
	public int deleteDeclareBoard(ArrayList dno) {
		// 신고 게시물삭제
		int result = aDao.deleteDeclareBoard(dno);
		return result;
		
	}
	
	@Override
	public int deleteBoard(int type, int bno) {
		if(type==1) {// 포스팅 삭제
			
			return aDao.pDeleteBoard(bno);
		}else {
			return aDao.bDeleteBoard(bno);
		}
	}
	
	@Override
	public int updateIsCheck(String dno) {
		// 신고게시물 상세조회
		return aDao.updateIsCheck(dno);
	}

	@Override
	public int getAdListCount(HashMap<?, ?> map) {
		// 총 광고수 조회
		return aDao.getAdListCount(map);
	}

	@Override
	public ArrayList<Ad> selectAdList(PageInfo pi, HashMap<?, ?> map) {
		// 광고 목록조회
		return aDao.selectAdList(pi, map);
	}
	
	@Override
	public ArrayList<Ad> selectAdNewList() {
		// 승인대기 광고 목록 리스트
		return aDao.selectAdNewList();
	}

	@Override
	public int insertAd(Ad ad) {
		// 광고 등록
		
		int result = aDao.insertPay(ad);
		
		if(result > 0) {
			//System.out.println("impl : 결제 성공 ");
			return aDao.insertAd(ad);
		}else {
			return 0;
		}
		
	}

	@Override
	public int updateStartAd(String adno) {
		// 광고 승인등록
		
		Ad ad = aDao.selectStartAd(); // 진행중인 광고 있는지
		
		if(ad != null) { // 있을때
			int result = aDao.updateEndAd(); // 진행중 광고 마감으로 변경
			
			if(result > 0) {
				return aDao.updateStartAd(adno);
				
			}else {
				return 0;
			}
		}else { // 없을때
			return aDao.updateStartAd(adno);
			
		}
		
	}

	@Override
	public int updateEndAd(String adno) {
		// 광고 마감(종료)
		return aDao.updateEndAd();
	}

	@Override
	public ArrayList<Statistics> selectMemberCount() {
		// 통계(가입자수)-월별
		return aDao.selectMemberCount();
	}
	
	@Override
	public ArrayList<Statistics> selectDayCount() {
		// 통계(가입자수)-일별
		return aDao.selectDayCount();
	}

	@Override
	public ArrayList<Statistics> totalCount() {
		// 총 게시글수(positng,board,fashion) + 광고수익
		return aDao.totalCount();
	}
	
	@Override
	public ArrayList<Style> selectCateRank() {
		// 카테고리별 순위
		return aDao.selectCateRank();
	}
	
	@Override
	public ArrayList<Style> selectBrandRank() {
		// 브랜드별 순위
		return aDao.selectBrandRank();
	}
	
	@Override
	public ArrayList<Style> selectColorRank() {
		// 색깔별 순위
		return aDao.selectColorRank();
	}

	@Override
	public int getNoticeListCount() {
		// 공지사항 총 갯수
		return aDao.getNoticeListCount();
	}

	@Override
	public ArrayList<Notice> selectNoticeAdminList(PageInfo pi) {
		// 공지사항 목록 조회용
		return aDao.selectNoticeAdminList(pi);
	}
	
	@Override
	public ArrayList<Notice> selectNoticeList() {
		// 공지사항 목록 조회용
		return aDao.selectNoticeList();
	}


	


	

	


	

	

	
	
	
}
