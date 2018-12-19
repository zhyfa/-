package com.great.dao;

import java.util.List;
import java.util.Map;

public interface DrugTypeMapper {
	// 查询一级药品目录
	public List<Map<String, Object>> firstType();

	// 通过一级药品的Id查询其下的子目录
	public List<Map<String, Object>> secondTypeById(int father_id);

	// 添加一个一级目录
	public int addFirstType(String bigTypeName);

	// 修改一个一级目录的名称
	public int updateFirstType(Map<String, Object> map);

	// 查询全部的二级目录，根据一级目录的名称排序
	public List<Map<String, Object>> secondType();

	// 查询一个的二级目录，通过它的ID
	public Map<String, Object> typeById(int smallTypeId);

	// 修改一个二级目录的名称
	public int updateSecondType(Map<String, Object> map);

	// 删除一个二级目录
	public int delSecondTypeById(int smallTypeId);

	// 添加一个二级目录
	public int addSecondType(Map<String, Object> map);
}
