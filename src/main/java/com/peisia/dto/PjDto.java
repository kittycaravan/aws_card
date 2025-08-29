package com.peisia.dto;

import java.util.ArrayList;

import lombok.Data;

@Data
public class PjDto {
	private Long no;
	private String name;
	private String content;
	private String level;
	private Long gold;
	private Long exp;
	public ArrayList<CardDto> cards = new ArrayList<CardDto>();	//이 pj에 투입된 카드들
	private String client;
	private String vendor;
	private int success_rate;
	
}