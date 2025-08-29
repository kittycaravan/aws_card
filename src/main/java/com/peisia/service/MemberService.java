package com.peisia.service;

import com.peisia.dto.MemberDto;
import com.peisia.dto.SuccessDto;

public interface MemberService {
	public MemberDto login(MemberDto m);
	public SuccessDto reg(MemberDto m);
	
}
