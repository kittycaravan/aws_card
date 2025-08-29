package com.peisia.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.peisia.config.Config;
import com.peisia.dto.WealthDto;
import com.peisia.service.ShopService;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@CrossOrigin(origins = "http://localhost:3000") // 3000포트에서의 요청 허용
@RequestMapping("/shop/*")
@RestController
public class ShopController {
	
	@Setter(onMethod_ = @Autowired)
	private ShopService service;	
	
	//일반 함수에 이런 식으로 세션을 선언해도 세션 객체를 주입해줌.
	//아래 설명 참고.
//	
//	Spring MVC에서는 @RequestMapping이 붙은 컨트롤러 메서드뿐만 아니라, 
//	같은 클래스 내부의 일반 메서드에서도 HttpSession을 파라미터로 선언하면, 
//	그 메서드를 호출하는 시점에 Spring이 세션 객체를 전달합니다. 
//	이는 해당 메서드가 요청을 직접 처리하든, 보조 메서드이든 상관없이 적용됩니다.
//	단, 이 메서드가 Spring Bean 외부에서 호출된다면 주입은 되지 않으며, 컨트롤러 내에서 직접 호출될 때만 자동 주입됩니다.
	
	
	private String getSessionIdWithLog(HttpSession session) {
	    String id = (String) session.getAttribute("savedId");
	    if(Config.DEVMODE) { id = "cat"; }
	    log.info("==== 세션 id: " + id);
	    return id;
	}
	
	@RequestMapping("/getWealth")			
	public WealthDto getWealth(HttpSession s) {
		String id = getSessionIdWithLog(s);
		return service.getWealth(id);
	}	
	
	@RequestMapping("/buyGold")			
	public void buyGold(HttpSession s) {
		String id = getSessionIdWithLog(s);
		int testGold = 500000;
		log.info("==== 테스트 골드 충전 원:"+testGold);
		service.buyGold(testGold,id);
	}
	
	@RequestMapping("/buyDice")			
	public void buyDice(HttpSession s) {
		String id = getSessionIdWithLog(s);		
		System.out.println("==== 1 주사위상자 구매");
		service.buyDice(id);
	}
	
	@RequestMapping("/payGold")			
	public void payGold(HttpSession s) {
		String id = getSessionIdWithLog(s);		
		System.out.println("==== 돈 나감(골드)");
		service.payGold(id);
	}
	
	@RequestMapping("/sellCard")			
	public void sellCard(@RequestParam("no") long no, HttpSession s) {
		String id = getSessionIdWithLog(s);		
		System.out.println("==== 카드 팔기");
		service.sellCard(no, id);
	}
}