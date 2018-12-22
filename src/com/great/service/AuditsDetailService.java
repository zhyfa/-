package com.great.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.great.bean.AuditsDetail;
import com.great.dao.AuditsDetailMapper;

@Service
public class AuditsDetailService {
	@Autowired 
	private AuditsDetailMapper detailDao;
	public int addDetail(List<Map> orders) {
		Map<String,Object> order = null;
		for(int i=0;i<orders.size();i++) {
			detailDao.addDetail(orders.get(i));
		}
		return 0;
	}; 
	public int updateDetail(String auditsdetail_id){
		return detailDao.updateDetail(auditsdetail_id);
	}
	public List<Map> queryDetail(String auditsdetail_id){
		return detailDao.queryDetail(auditsdetail_id);
	}
	public String getTotalPrice(String auditsdetail_id) {
		return detailDao.getTotalPrice(auditsdetail_id);
	};
	public int getTotalDrug(String auditsdetail_id) {
		return detailDao.getTotalDrug(auditsdetail_id);
	};
	public int deleteDetail(String auditsdetail_id) {
		return detailDao.deleteDetail(auditsdetail_id);
	}
	public int passDetail(String auditsdetail_id) {
		return detailDao.passDetail(auditsdetail_id);
	}
	public int returnDetail(String auditsdetail_id) {
		return detailDao.returnDetail(auditsdetail_id);
	}
	public int updateStock(AuditsDetail auditsDetail) {
		return detailDao.updateStock(auditsDetail);
	}
	public Map<String,Object> queryByDrugId(int drug_id){
		return detailDao.queryByDrugId(drug_id);
	}
}
