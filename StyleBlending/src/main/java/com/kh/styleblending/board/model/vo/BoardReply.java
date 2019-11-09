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
public class BoardReply {

	private int brNo;
	private int bNo;
	private String content;
	private Date enrollDate;
	private String isDelete;
	
	
	
}
