package com.peisia.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.peisia.c.util.Dice;
import com.peisia.dto.Animal;
import com.peisia.dto.CardDto;
import com.peisia.dto.Cat;
import com.peisia.service.CardService;

import lombok.Setter;

//@CrossOrigin(origins = "http://localhost:3000") // 3000포트에서의 요청 허용
@RequestMapping("/api/*")
@RestController
public class ControllerApi {
	
	@Setter(onMethod_ = @Autowired)
	private CardService service;	

	@GetMapping("/cat")
	public Cat cat() {
		Cat cat = new Cat("야옹이",7);
		cat.hobby.add("식빵굽기");
		cat.hobby.add("잠자기");
		
		//친구 사귀기
		cat.friends.add(new Animal("개",5));
		cat.friends.add(new Animal("너굴맨",8));
		
		return cat;
	}
}