package com.peisia.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.peisia.c.util.Dice;
import com.peisia.dto.CardDto;
import com.peisia.dto.SelectCardDto;
import com.peisia.dto.game.DataJobDto;
import com.peisia.dto.rate.GradeDto;
import com.peisia.mapper.CardMapper;
import com.peisia.mapper.ShopMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
//@AllArgsConstructor
public class CardServiceImpl implements CardService{

	@Setter(onMethod_ = @Autowired)
	private CardMapper mapper;
	@Setter(onMethod_ = @Autowired)
	private ShopMapper mapperShop;
	@Setter(onMethod_ = @Autowired)
	private DataCacheService dataCacheService;

	@Override
	public ArrayList<CardDto> getList(String id) {
		ArrayList<CardDto> n = mapper.getList(id);
		return n;
	}

	//todo
	//확인중
	//미사용 함수
//	@Transactional	//트랜잭션 처리함
//	@Override
//	public void addCard(CardDto c) {
//		mapper.addCard(c);
//		mapperShop.payDice();	//다이스박스 차감 까지해야함
//	}

	@Override
	public void pjMemberAdd(SelectCardDto c) {
		mapper.pjMemberAdd(c);
	}

	@Override
	public ArrayList<CardDto> getPjMember(int no) {
		ArrayList<CardDto> n = mapper.getPjMember(no);
		return n;		
	}	
	@Override
	public void clearPjMember(long pjId) {
		mapper.clearPjMember(pjId);
	}

	////	1가차(1뽑)	////
	@Transactional
	@Override
	public ArrayList<CardDto> gacha(String id) {
		DataJobDto gachaJob = getGachaJob();
		CardDto c = new CardDto(gachaJob.getJob_name(),gachaJob.getJob_kor_name(),getGrade());		
		mapper.addCard(c,id);
		mapperShop.payDice(id,1);	//다이스박스 차감 까지해야함
		return getList(id);	//가챠로 뽑은 카드가 추가된 최종 목록을 다시 가져와서 api로 뿌려줌
	}
	
	////	10연차	////
	@Transactional
	@Override
	public ArrayList<CardDto> gacha10(String id) {
		ArrayList<CardDto> gacha10Cards = new ArrayList<>();
		for(int i=0;i<10;i++) {
			DataJobDto gachaJob = getGachaJob();
			CardDto c = new CardDto(gachaJob.getJob_name(),gachaJob.getJob_kor_name(),getGrade());
			gacha10Cards.add(c);
		}
		mapper.addCard10(gacha10Cards,id);
		mapperShop.payDice(id,10);	//다이스박스 차감 까지해야함
		return getList(id);	//가챠로 뽑은 카드가 추가된 최종 목록을 다시 가져와서 api로 뿌려줌
	}
	
	private DataJobDto getGachaJob() {
		ArrayList<DataJobDto> jobs = dataCacheService.getDataJob();
		int r = Dice.roll(jobs.size()) - 1;
		return jobs.get(r);
	}
	
	public String getGrade() {
		ArrayList<GradeDto> grades = dataCacheService.getRateGrade();
		log.info("==== 확률:"+grades);
		////	확률 누적 계산 후 배열에 넣기
		ArrayList<Integer> cumulative = new ArrayList<>();
		cumulative.add(grades.get(0).getChance());						// ssr 	3%
		cumulative.add(cumulative.get(0)+grades.get(1).getChance());	// sr	10% (+ 7%) 
		cumulative.add(cumulative.get(1)+grades.get(2).getChance());	// r	25% (+ 15%)
		cumulative.add(cumulative.get(2)+grades.get(3).getChance());	// h	50% (+ 25%)

		int r = Dice.roll(1,10000);
		int t = 4;	// 기본 n 등급
		if(r<=cumulative.get(3)) {	// 50이하면 h 등급 확정
			t = 3; 
		}
		if(r<=cumulative.get(2)) {	// 25이하면 r 등급 확정 
			t = 2; 
		}
		if(r<=cumulative.get(1)) {	// 10이하면 sr 등급 확정
			t = 1; 
		}
		if(r<=cumulative.get(0)) {	// 3이하면 SSR 등급 확정
			t = 0; 
		}
		return grades.get(t).getGrade();
	}	
}