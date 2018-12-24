package com.great.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.great.bean.LossReport;

@Repository
public interface LossReportMapper {

	public int ReimburseAdd();
	//查找总和
	public int queryCount();
	//查找分页要求的信息
	public List<Map<String, Object>> queryListbypage(Map<String, Object> map);
	//查找所有的信息
	public List<LossReport> queryallList();
	
}
