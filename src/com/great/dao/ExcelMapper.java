package com.great.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.great.bean.AuditsDetail;
import com.great.bean.Check;
import com.great.bean.Factory;
import com.great.bean.Inventory;
import com.great.bean.Page;

@Repository
public interface ExcelMapper {
	//工厂表导出Ecxel
	public List<Factory> queryFactory();
	//导入采购单Excel
	public int addCgTail(AuditsDetail auditsDetail);
	//导出药房盘点表
	public List<Inventory> queryDaily();
	//导入盘点表Excel
	public int addCheck(Check check);
	//显示盘点列表
	public List<Check> checkDaily(Page page);
	//查询记录总条数
	public int queryCount();
}
