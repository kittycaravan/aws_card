package com.peisia.mapper;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import com.peisia.dto.PjDto;

public interface PjMapper {
	public ArrayList<PjDto> getGuildPjList(String id);
	public ArrayList<PjDto> getPjList();
	public void addPj(PjDto pj);
	public void updateGuild(@Param("no") int no, @Param("id") String id);
	public void delPj(int no);
	public PjDto getPj(int no);
}
