package com.peisia.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.peisia.dto.MemberDto;
import com.peisia.dto.SuccessDto;
import com.peisia.service.MemberService;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@RequestMapping("/member/*")
@RestController
public class MemberController {
	
	@Setter(onMethod_ = @Autowired)
	private MemberService service;	
	
	@RequestMapping("/login")			
	public SuccessDto login(@RequestBody MemberDto m, HttpSession session) {
		log.info("==== 로그인 api 진입");
		MemberDto member = service.login(m);
		if(member != null) {
			log.info("==== 로그인 api - 로그인 성공");
			session.setAttribute("savedId", member.getId());
			return new SuccessDto(true);
		} else {
			log.info("==== 로그인 api - 로그인 실패");
			return new SuccessDto(false);
		}
	}
	@RequestMapping("/reg")			
	public SuccessDto reg(@RequestBody MemberDto m) {
		log.info("==== 회원가입 api 진입");
		return service.reg(m);
	}
	@RequestMapping("/logout")			
	public SuccessDto logout(HttpSession session) {
		log.info("==== 로그아웃 api 진입");
		session.invalidate();
		log.info("==== 로그아웃 api - 로그아웃 처리함");
		return new SuccessDto(true);
	}	
}