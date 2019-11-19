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

	private int imgno;
	private int bno;
	private String originalImg;
	private String renameImg;
	private String imgPath;		// 이미지 저장될 경로
	private String type;
	
	
}
