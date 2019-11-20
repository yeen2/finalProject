package com.kh.styleblending.member.model.vo;

import java.sql.Date;
import java.util.Collection;

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
public class Fan {

	private int fno;
	private int meNo;
	private int youNo;
	private Date enrollDate;
	
	// 팬 체크용 배열
	private int[] meNoArr;
	
}
