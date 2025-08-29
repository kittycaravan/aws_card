package com.peisia.mapper;

import java.util.ArrayList;

import com.peisia.dto.game.DataJobDto;
import com.peisia.dto.rate.GradeDto;

public interface DataCacheMapper {
    ArrayList<GradeDto> getRateGrade();
    ArrayList<DataJobDto> getDataJob();
}
