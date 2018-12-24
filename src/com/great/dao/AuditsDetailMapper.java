package com.great.dao;

import java.util.List;
import java.util.Map;

import com.great.bean.AuditsDetail;

public interface AuditsDetailMapper {
	public int addDetail(Map<String,Object> order); 
	public int deleteDetail(String auditsdetail_id);
	public List<Map> queryDetail(String auditsdetail_id); 
	public String getTotalPrice(String auditsdetail_id);
	public int getTotalDrug(String auditsdetail_id);
	public int updateDetail(String auditsdetail_id);
	public int passDetail(String auditsdetail_id);
	public int returnDetail(String auditsdetail_id);
	public int updateStock(AuditsDetail auditsDetail);
	public Map<String,Object> queryByDrugId(int drug_id);
	public List<Map<String,Object>> getdetail(AuditsDetail auditsDetail);
	public Map<String,Object> getdetailInfo(AuditsDetail auditsDetail);
}
