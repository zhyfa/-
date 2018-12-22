package com.great.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.great.bean.StorgeApply;

@Repository
public interface StorgeApplyMapper {
	public int addStorgeApply(StorgeApply storgeApply);
	public List<Map<String,Object>> queryStorgeApply(); 
	public int updateStorgeApply(StorgeApply storgeApply);
}
