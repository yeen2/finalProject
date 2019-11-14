package com.kh.styleblending.posting.model.vo;

import java.sql.Date;
import java.util.List;

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
public class Posting {

	private int pno;
	private int mno;
	private String originalImg;
	private String renameImg;
	private String imgPath;
	private String content;
	private String hashtag;  // content에서 #붙은것만 뽑아서 ,로 합쳐서 넣어주기
	private String gender;
	private String location;
	private int likeCount;
	private int declareCount;
	private Date enrollDate;
	private Date updateDate;
	private String isDelete;
	
	private List<Style> style;
	
}
