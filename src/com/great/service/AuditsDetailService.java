package com.great.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.great.bean.AuditsDetail;
import com.great.dao.AuditsDetailMapper;

@Service
public class AuditsDetailService {
	@Autowired 
	private AuditsDetailMapper detailDao;
	public AuditsDetail addDetail(AuditsDetail detail) {
		return detailDao.addDetail(detail);
	}; 
}
