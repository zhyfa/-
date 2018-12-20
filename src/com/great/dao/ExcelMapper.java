package com.great.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.great.bean.AuditsDetail;
import com.great.bean.Factory;

@Repository
public interface ExcelMapper {
	//工厂表导出Ecxel
	public List<Factory> queryFactory();
	//导入采购单Excel
	public int addCgTail(AuditsDetail auditsDetail);
}
