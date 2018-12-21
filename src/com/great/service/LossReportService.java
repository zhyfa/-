package com.great.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.great.dao.LossReportMapper;

@Service
public class LossReportService {
	@Autowired
	private LossReportMapper lossReportMapper;
}
