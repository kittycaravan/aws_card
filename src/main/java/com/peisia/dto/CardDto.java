package com.peisia.dto;

import lombok.Data;

@Data
public class CardDto {
	private Long no;
	private String job;
	private String job_kor_name;
	private String grade;
	private String id;
	private Long deployment;	//pj 파견지 번호
	private int lv;
	private int type;
	public CardDto() {
		
	}
	public CardDto(String job, String job_kor_name, String grade) {
		this.job = job;
		this.job_kor_name = job_kor_name;
		this.grade = grade;
	}
	
	
}