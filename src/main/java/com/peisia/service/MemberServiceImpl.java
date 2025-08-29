package com.peisia.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.peisia.dto.MemberDto;
import com.peisia.dto.SuccessDto;
import com.peisia.mapper.MemberMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
//@AllArgsConstructor
public class MemberServiceImpl implements MemberService{

	@Setter(onMethod_ = @Autowired)
	private MemberMapper mapper;
	
	@Override
	public MemberDto login(MemberDto m) {
		return mapper.login(m); 
	}
	
	@Transactional
	@Override
	public SuccessDto reg(MemberDto m) {
		if(mapper.reg(m) == 1 && mapper.regWealth(m.getId()) == 1) {
			return new SuccessDto(true);
		} else {
			return new SuccessDto(false);
		}
	}
	
}
