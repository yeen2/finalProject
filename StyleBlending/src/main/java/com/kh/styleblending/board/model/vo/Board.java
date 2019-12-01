package com.kh.styleblending.board.model.vo;

import java.sql.Date;
import java.util.ArrayList;

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
public class Board {

	private int bno;
	private int mno;
	private String title;
	private String content;
	private int count;
	private Date enrollDate;
	private Date updateDate;
	private String isDelete;
	private int likeCount;
	
	private String originalImg;
	private String renameImg;
	
	//닉네임
	private String nickName;
	private String loginUser;
	
	
	// 로그인한 회원이 좋아요
	private int loginLike;
	
	
}
