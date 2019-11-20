package com.kh.styleblending.posting.model.vo;

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
public class Style {

	private int sno;
	private int pno;
	private String cate;
	private String brand;
	private String color;
	
	private String name;
	private String img;
	
}
