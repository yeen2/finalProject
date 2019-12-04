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

	private int brno;
	private int bno;
	private int mno;
	private String content;
	private Date enrollDate;
	private String isDelete;
	
	// 댓글 프로필 이미지
	private String profileImg;
	private String renameImg;
	
	//닉네임
	private String nickName;
	private int mmno;
	
}
