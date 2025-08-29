package com.peisia.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.peisia.config.Config;
import com.peisia.dto.CardDto;
import com.peisia.dto.SelectCardDto;
import com.peisia.service.CardService;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@CrossOrigin(origins = "http://localhost:3000") // 3000포트에서의 요청 허용
@RequestMapping("/cards/*")
@RestController
public class CardController {
	
	@Setter(onMethod_ = @Autowired)
	private CardService service;	
	
	@RequestMapping("/getMyCards")			
	public ArrayList<CardDto> getMyCards(HttpSession s) {
		String id = (String)s.getAttribute("savedId");
		if(Config.DEVMODE) { id = "cat"; }
		log.info("==== 세션 id:"+id);
		ArrayList<CardDto> n = service.getList(id);
		System.out.println("==== 총 카드 수:"+n.size());
		return n;
	}
	
	@RequestMapping("/pjMemberAdd")			
	public void pjMemberAdd(@RequestBody SelectCardDto c) {
//		CardDto c = new CardDto((String)requestData.get("job"),(String)requestData.get("grade"));
		if(Config.DEVMODE) { c.setId("cat"); }
		service.pjMemberAdd(c);
		System.out.println("==== 데이터 잘 오나?: no:"+c.getNo());
		// id 값은 안쓴다. id로 구분할 필요가 없음.
		// todo
		// id값을 하드코딩으로 cat 으로 리액트에서 넘기고 있음. 삭제할것.
		System.out.println("==== 데이터 잘 오나?: id:"+c.getId());	
		
		System.out.println("==== 데이터 잘 오나?: pjId:"+c.getPjId());
	}
	
	@RequestMapping("/getPjMember")			
	public ArrayList<CardDto> getParty(@RequestParam("no") int no) {
		ArrayList<CardDto> n = service.getPjMember(no);
		System.out.println("==== pj 멤버 카드 수:"+n.size());
		return n;
	}	
	
	@RequestMapping("/clearPjMember")			
	public void clearPjMember(@RequestParam("pjId") long pjId) {
		System.out.println("==== pjId:"+pjId);
		service.clearPjMember(pjId);
	}
	
	@GetMapping("/gacha")
	public ArrayList<CardDto> gacha(HttpSession s) {
		String id = (String)s.getAttribute("savedId");
		if(Config.DEVMODE) { id = "cat"; }
		log.info("==== 세션 id:"+id);
		ArrayList<CardDto> cards = service.gacha(id);
		System.out.println("==== 총 카드 수:"+cards.size());
		return cards;
	}
	
	/*** 10연차 ***/
	@GetMapping("/gacha10")
	public ArrayList<CardDto> gacha10(HttpSession s) {
		String id = (String)s.getAttribute("savedId");
		if(Config.DEVMODE) { id = "cat"; }
		log.info("==== 세션 id:"+id);
		ArrayList<CardDto> cards = service.gacha10(id);
		log.info("==== 총 카드 수:"+cards.size());
		return cards;
	}
	
}
