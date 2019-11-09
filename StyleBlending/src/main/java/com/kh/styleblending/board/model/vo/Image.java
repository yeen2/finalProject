package com.kh.styleblending.board.model.vo;

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
public class Image {

	private int imgNo;
	private int bNo;
	private String originalImg;
	private String renameImg;
	private String imgPath;
	private String type;
	
	
}
