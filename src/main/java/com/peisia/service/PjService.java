package com.peisia.service;

import java.util.ArrayList;

import com.peisia.dto.PjDto;
import com.peisia.dto.SuccessDto;

public interface PjService {
	public ArrayList<PjDto> getPjList();
	public ArrayList<PjDto> getGuildPjList(String id);
	public void addPj(PjDto pj);
	public void updateGuild(int no,String id);
	public SuccessDto procPj(int no,String id);
}
