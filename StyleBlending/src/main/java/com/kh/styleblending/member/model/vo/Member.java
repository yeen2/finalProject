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
public class Member {

	private int mno;
	private String loginType;
	private String snsId;
	private String email;
	private String pass;
	private String nickName;
	private String profile;
	private String location;
	private String profileImg;
	private String profilePath;
	private Date enrollDate;
	private Date updateDate;
	private Date deleteDate;
	private String isDelete;
	
	
}