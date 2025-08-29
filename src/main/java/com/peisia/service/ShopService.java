package com.peisia.service;

import com.peisia.dto.WealthDto;

public interface ShopService {
	public WealthDto getWealth(String id);
	public void buyGold(long g, String id);
	public void buyDice(String id);
	public void payGold(String id);
	public void sellCard(long no,String id);
}
