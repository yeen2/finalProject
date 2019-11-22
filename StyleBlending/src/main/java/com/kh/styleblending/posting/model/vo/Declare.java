package com.kh.styleblending.posting.model.vo;

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

	private int dno;
	private int mno;
	private int bno;  // 해당 신고 게시물 번호
	private String category;
	private String content;
	private Date enrollDate;
	private String isCheck;
	private int type;
	
	
}
