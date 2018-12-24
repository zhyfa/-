package com.great.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.great.bean.StorgeApply;
import com.great.dao.StorgeApplyMapper;

@Service
public class StorgeApplyService {
	@Autowired
	private StorgeApplyMapper StorgeApplyDao;
	public int addStorgeApply(StorgeApply storgeApply) {
		return StorgeApplyDao.addStorgeApply(storgeApply);
	}
	public List<Map<String,Object>> queryStorgeApply(){
		return StorgeApplyDao.queryStorgeApply();
	}
	public int updateStorgeApply(StorgeApply storgeApply) {
		return StorgeApplyDao.updateStorgeApply(storgeApply);
	}
	public Map<String,Object> queryApplyDetail(String storge_id){
		return StorgeApplyDao.queryApplyDetail(storge_id);
	}
	public int getRealTotal(String storge_id) {
		return StorgeApplyDao.getRealTotal(storge_id);
	}
	public int getRealTotalType(String storge_id) {
		return StorgeApplyDao.getRealTotalType(storge_id);
	}
	public int updateRealStorge(StorgeApply storgeApply) {
		return StorgeApplyDao.updateRealStorge(storgeApply);
	};
}
