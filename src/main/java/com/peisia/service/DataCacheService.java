package com.peisia.service;

import java.util.ArrayList;

import org.springframework.beans.factory.InitializingBean;
import org.springframework.stereotype.Service;

import com.peisia.dto.game.DataJobDto;
import com.peisia.dto.rate.GradeDto;
import com.peisia.mapper.DataCacheMapper;

import lombok.extern.log4j.Log4j;

@Log4j
@Service
/*
 * InitializingBean을 구현함으로써
 * 스프링 프로젝트가 서버에서 구동될 때
 * 내가 지정한 특정 작업을 단 한 번 자동으로 실행할 수 있음.
 * 
 * 여기서는 DB에서 등급 및 직업 데이터를 미리 불러와 객체에 저장하고,
 * 게임 내에서 필요할 때마다 DB를 직접 조회하지 않고
 * 이 객체에 저장된 데이터를 사용하는 방식으로 처리함.
 * 
 * 이 방식을 통해 DB 요청 횟수를 줄이고
 * 성능을 향상시키는 효과를 얻을 수 있음.
 */
public class DataCacheService implements InitializingBean {

    private final DataCacheMapper dataCacheMapper;
    
    ////	캐시 데이터	////
    private ArrayList<GradeDto> rateGrade;	// 등급(확률) 데이터
    private ArrayList<DataJobDto> dataJob;	// 직업 데이터    

    // Mapper 주입
    // 생성자가 1개뿐인 경우, Spring이 자동으로 이 생성자를 인식하여 의존성을 주입해줌.
    // 따라서 @Autowired 어노테이션 없이도 정상 동작함.
    public DataCacheService(DataCacheMapper gradeMapper) {
        this.dataCacheMapper = gradeMapper;
    }

    /**
     * *** 중요 ***
     * 이 함수는 스프링이 DataCacheService 빈을 생성하고
     * 의존성 주입이 완료된 후 자동으로 실행됨. 
     * 
     * 이 시점에 DB에서 데이터를 가져와 메모리에 저장함으로써
     * 이후에는 DB를 다시 조회하지 않고 캐시 데이터를 사용할 수 있게 됨.
     */
    @Override
    public void afterPropertiesSet() {
        rateGrade = dataCacheMapper.getRateGrade();
        log.info("==== 데이터 캐싱 완료 - 등급(확률) 데이터: " + rateGrade);
        dataJob = dataCacheMapper.getDataJob();
        log.info("==== 데이터 캐싱 완료 - 직업 데이터: " + dataJob);
    }

    // 데이터 필요한 곳에서 이 게터 호출해서 데이터 받아 쓰면 됨
    // 캐싱된 등급(확률) 데이터를 외부에서 조회할 때 사용하는 getter
    public ArrayList<GradeDto> getRateGrade() {
        return rateGrade;
    }
    
    // 데이터 필요한 곳에서 이 게터 호출해서 데이터 받아 쓰면 됨
    // 캐싱된 직업 데이터를 외부에서 조회할 때 사용하는 getter
    public ArrayList<DataJobDto> getDataJob() {
    	return dataJob;
    }
}
