package com.great.dao;

import java.util.List;
import java.util.Map;

public interface MenuMapper {
	//查询menu（权限表）表的全部信息
	public List<Map<String, Object>> quaryAll();
}
