package com.peisia.mapper;

import org.apache.ibatis.annotations.Param;

import com.peisia.dto.WealthDto;

public interface ShopMapper {
	public WealthDto getWealth(String id);
	public void buyGold(@Param("gold") long gold,@Param("id") String id);
	public void buyDice(String id);	
	public void payGold(@Param("id") String id, @Param("gold") long gold);
	public void payDice(@Param("id") String id, @Param("count") int count);
}
