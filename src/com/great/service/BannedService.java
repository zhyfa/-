package com.great.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.great.bean.Banned;
import com.great.dao.BannedMapper;
@Service  
public class BannedService {

	@Autowired
	private BannedMapper bannerMapper;
	//添加配伍
	public int addBanned(Banned banned) {
		return bannerMapper.addBanned(banned);
	}
	public int delBanned(Banned banned) {
		return bannerMapper.delBanned(banned);
	}
	public List<Map<String, Object>> queryall() {
		// TODO Auto-generated method stub
		return bannerMapper.queryall();
	}
	
	
}
