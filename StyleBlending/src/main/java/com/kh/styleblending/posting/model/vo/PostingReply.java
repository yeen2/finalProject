package com.kh.styleblending.posting.model.vo;

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
public class PostingReply {

	private int prno;
	private int pno;
	private int mno;
	private String content;
	private Date enrollDate;
	private Date updateDate;
	private int prrno;
	private String level;
	private int likeCount;
	private String isDelete;
	
	private String nickName;
	private String profileImg;
	
}
