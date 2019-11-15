package com.kh.styleblending.main.model.vo;

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
public class Notice {

	private int nno;
	private String title;
	private String content;
	private String enrollDate; //다시 date로 바꿔야함.
	//private String isDelete;
	
	
}
