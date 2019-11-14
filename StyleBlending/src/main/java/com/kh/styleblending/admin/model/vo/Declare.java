package com.kh.styleblending.admin.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class Declare {

	private int dno; // 신고번호
	private int mno; // 신고한 회원번호
	private int pno; // 신고한 포스팅,게시판 번호
	private String category; // 신고사유 카테고리
	private String content; // 사유 기타시 내용
	private Date enrollDate; // 신고일자
	private String isCheck; // 신고상태 
	

}
