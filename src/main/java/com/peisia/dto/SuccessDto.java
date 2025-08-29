package com.peisia.dto;

import lombok.Data;

@Data
public class SuccessDto {
	private boolean success;
	public SuccessDto() {
		
	}
	public SuccessDto(boolean success) {
		this.success = success;
	}
}