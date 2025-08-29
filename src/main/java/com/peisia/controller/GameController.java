package com.peisia.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/game/*")
@Controller
public class GameController {
	
	@RequestMapping("/play")			
	public void play() {
		
	}				
}
