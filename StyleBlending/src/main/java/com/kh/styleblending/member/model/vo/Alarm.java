package com.kh.styleblending.member.model.vo;

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
public class Alarm {

	private int alNo;
	private int tNo;
	private int mNo;
	private Date enrollDate;
	private String status;
	private String type;
	
}
