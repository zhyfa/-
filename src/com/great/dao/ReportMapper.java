package com.great.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;
@Repository
public interface ReportMapper {
	public List<Map<String, Object>> queryIn();
	public List<Map<String, Object>> queryOut();
}
