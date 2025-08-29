package com.peisia.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.peisia.c.util.Dice;
import com.peisia.config.Config;
import com.peisia.dto.PjDto;
import com.peisia.dto.SuccessDto;
import com.peisia.service.PjService;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@CrossOrigin(origins = "http://localhost:3000") // 3000포트에서의 요청 허용
@RequestMapping("/pj/*")
@RestController
public class PjController {
	
	@Setter(onMethod_ = @Autowired)
	private PjService service;	
	
	@RequestMapping("/getPjList")			
	public ArrayList<PjDto> getPjList() {
		ArrayList<PjDto> n = service.getPjList();
		System.out.println("==== 총 pj 수:"+n.size());
		return n;
	}
	@RequestMapping("/getGuildPjList")			
	public ArrayList<PjDto> getGuildPjList(HttpSession s) {
		String id = (String)s.getAttribute("savedId");
		if(Config.DEVMODE) { id = "cat"; }
		log.info("==== 세션 id:"+id);		
		ArrayList<PjDto> n = service.getGuildPjList(id);
		System.out.println("==== 총 길드가 수주 받은 pj 수:"+n.size());
		return n;
	}
	
	@RequestMapping("/addPj")			
	public void addPj(@RequestBody PjDto pj) {
		service.addPj(pj);
		log.info("==== 데이터 잘 오나? pj 값:"+pj);
	}
	
	@RequestMapping("/updateGuild")			
	public void updateGuild(@RequestParam("no") int no, HttpSession s) {
		String id = (String)s.getAttribute("savedId");
		if(Config.DEVMODE) { id = "cat"; }
		log.info("==== 세션 id:"+id);		
		System.out.println("==== 데이터 잘 오나?:"+no);
		service.updateGuild(no,id);
	}
	
	@RequestMapping("/procPj")			
	public SuccessDto procPj(@RequestParam("no") int no, HttpSession s) {
		String id = (String)s.getAttribute("savedId");
		if(Config.DEVMODE) { id = "cat"; }
		log.info("==== 세션 id:"+id);		
		System.out.println("==== 데이터 잘 오나?:"+no);
		
		return service.procPj(no,id);
		
//		if(Dice.percent(50)) {
//			service.procPj(no,id,true);
//			return new SuccessDto(true);
//		} else {
//			service.procPj(no,id,false);
//			return new SuccessDto(false);
//		}
	}
	
}
