package com.great.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.great.bean.Storge;
import com.great.dao.StorgeMapper;
@Service
public class StorgeService {
	@Autowired 
	private StorgeMapper storgeDao;
	
	public int addStorge(Map<String,Object> storge) {
		return storgeDao.addStorge(storge);
	}
	public List<Map<String,Object>> queryStorge(String storge_id){
		return storgeDao.queryStorge(storge_id);
	}
	public int deleteStorge(String storge_id) {
		return storgeDao.deleteStorge(storge_id);
	}
	public int getStorgeTotal(String storge_id) {
		return storgeDao.getStorgeTotal(storge_id);
	};
	public int getDrugtypeTotal(String storge_id) {
		return storgeDao.getDrugtypeTotal(storge_id);
	};
	public int updateStorge(Storge storge) {
		return storgeDao.updateStorge(storge);
	}
}
