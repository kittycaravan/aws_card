package com.peisia.mapper;

import com.peisia.dto.MemberDto;

public interface MemberMapper {
	public MemberDto login(MemberDto m);
	public int reg(MemberDto m);
	public int regWealth(String id);
}
