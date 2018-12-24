package com.great.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.great.bean.Storge;
@Repository
public interface StorgeMapper {
	public int addStorge(Map<String,Object> storge);
	public List<Map<String,Object>> queryStorge(String storge_id);
	public int deleteStorge(String storge_id); 
	public int getStorgeTotal(String storge_id);
	public int getDrugtypeTotal(String storge_id);
	public int updateStorge(Storge storge);
	public int submitStorgeApply(Storge storge);
	public Map<String,Object> getDetailById(int storgedetail_id);
}
