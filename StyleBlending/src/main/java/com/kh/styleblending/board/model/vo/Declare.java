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
public class Declare {

	private int dno;
	private int mno;
	private int bno;
	private String dcategory;
	private String content;
	private Date enrollDate;
	private String ischeck;
	private int type;
	
}
