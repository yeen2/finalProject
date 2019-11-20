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
public class Ad {

	private int adno;
	private String mno;
	private int payno;
	private String name;  // 업체명
	private String url;
	private String originalImg;
	private String renameImg;
	private String imgPath;
	private Date enrollDate;
	private Date startDate;
	private Date endDate;
	private int status;
	private String email;
	
}
