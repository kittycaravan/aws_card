package com.peisia.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.peisia.dto.CardDto;
import com.peisia.dto.MyCardsDto;
import com.peisia.dto.SelectCardDto;

public interface CardService {
	public ArrayList<CardDto> getList(String id);
//	public void addCard(CardDto c);
	public void pjMemberAdd(SelectCardDto c);
	public ArrayList<CardDto> getPjMember(int no);
	public void clearPjMember(long pjId);
	public ArrayList<CardDto> gacha(String id);
	public ArrayList<CardDto> gacha10(String id);
}
