package com.peisia.mapper;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import com.peisia.dto.CardDto;
import com.peisia.dto.SelectCardDto;

public interface CardMapper {
	public ArrayList<CardDto> getList(String id);
//	public void addCard(CardDto c, String id);
	public void addCard(@Param("card") CardDto c, @Param("id") String id);
	public void addCard10(@Param("cardList") ArrayList<CardDto> cardList, @Param("id") String id);
	public void pjMemberAdd(SelectCardDto c);
	public ArrayList<CardDto> getPjMember(int no);
	public void clearPjMember(long pjId);
	public ArrayList<CardDto> getMyCards();
	public void delCard(long no);
	public void addExp(@Param("exp") long exp, @Param("pjNo") int pjNo);
}
