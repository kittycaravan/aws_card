package com.peisia.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.peisia.c.util.Dice;
import com.peisia.dto.CardDto;
import com.peisia.dto.PjDto;
import com.peisia.dto.SuccessDto;
import com.peisia.mapper.CardMapper;
import com.peisia.mapper.PjMapper;
import com.peisia.mapper.ShopMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
//@AllArgsConstructor
public class PjServiceImpl implements PjService{

	@Setter(onMethod_ = @Autowired)
	private PjMapper mapper;
	@Setter(onMethod_ = @Autowired)
	private CardMapper cardMapper;
	@Setter(onMethod_ = @Autowired)
	private ShopMapper shopMapper;

	@Override
	public ArrayList<PjDto> getPjList() {
		ArrayList<PjDto> pjs = mapper.getPjList();
		return pjs;
	}
	@Override
	public ArrayList<PjDto> getGuildPjList(String id) {
		ArrayList<PjDto> pjs = mapper.getGuildPjList(id);
		
		//카드들을 파견지별로 나눠서 파견지 pjId 를 키로 밸류에 카드배열을 넣어 리턴
		//문제발생: hash 구조를 써먹지 못함 그래서 일반 배열 중첩으로 변경하겠음
		ArrayList<CardDto> cards = cardMapper.getMyCards();	//모든 카드를 다 가져오고
		for(CardDto c : cards) {
			for(PjDto m: pjs) {	//기존 pjs 배열 탐색
				if(m.getNo() == c.getDeployment()) {	//pjId 를 검사해서
					m.cards.add(c);	// 찾으면 해당 pj 안에 add
					break;
				}
			}
		}		
		return pjs;
	}

	@Override
	public void addPj(PjDto pj) {
		mapper.addPj(pj);
	}
	
	@Override
	public void updateGuild(int no, String id) {
		mapper.updateGuild(no, id);
	}

	@Transactional
	@Override
	public SuccessDto procPj(int no,String id) {
		boolean isSuccess = false;
		PjDto pd = mapper.getPj(no);
		log.info("==== pj 데이터확인:"+pd);
		if(Dice.percent(pd.getSuccess_rate())) {
			////	보상처리	////
			shopMapper.buyGold(pd.getGold(),id); //돈+. 
			cardMapper.addExp(pd.getExp(), no);	//각 카드 경험치+
			isSuccess = true;
		}
		mapper.delPj(no);	// 해당 프로젝트 삭제 ( 순서 중요.. )
		cardMapper.clearPjMember(no);	//클리어도 해야됨
		return new SuccessDto(isSuccess);
	}
}