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

	private int nNo;
	private String title;
	private String content;
	private Date enrollDate;
	private String isDelete;
	
	
}
