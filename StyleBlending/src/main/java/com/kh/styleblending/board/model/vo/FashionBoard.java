package com.kh.styleblending.board.model.vo;

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
public class FashionBoard {

	private int fbno;
	private int mno;
	private String title;
	private String content;
	private int count;
	private Date enrollDate;
	private Date updateDate;
	private String isDelete;
	
	private String loginUser;
	private String nickName;
	private String renameImg;
	
	
}
