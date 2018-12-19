package com.great.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.great.bean.MyLog;
import com.great.bean.Page;
@Repository
public interface LogMapper {
	public int addLog(MyLog myLog);
	
		public List<Map<String, Object>> getallLog(Page page);
		public int queryCountLog();
}
