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
	
	private ArrayList<Image> imageList;
	
	
}
