package com.great.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.great.bean.MyLog;
import com.great.bean.Page;
@Repository
public interface LogMapper {
	public int addLog(MyLog myLog);
	
	//初始化
			public List<Map<String, Object>> getallLog(Page page);
			public int queryCountLog();
			//条件查询分页总数
			public int queryCountbysome(Map<String, Object> map);
			//条件模糊搜索
			public List<Map<String, Object>> queryLogbysome(Map<String, Object> map);
		
		
}
