package com.great.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.great.bean.MyLog;
import com.great.bean.Page;
import com.great.dao.LogMapper;
@Service
public class LogService {
	@Autowired
	private LogMapper logMapper;
	public int addLog(MyLog myLog) {
		int flag=0;
		flag=logMapper.addLog(myLog);
		return flag;
		
	}
	public List<Map<String, Object>> getallLog(Page page) {
		// TODO Auto-generated method stub
		return logMapper.getallLog(page);
	}
	public int queryCountLog() {
		// TODO Auto-generated method stub
		return logMapper.queryCountLog();
	}
}
