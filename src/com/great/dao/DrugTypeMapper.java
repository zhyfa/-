package com.great.dao;

import java.util.List;
import java.util.Map;

public interface DrugTypeMapper {

	// 通过bigtype_id查询该ID的名字
	public String BigtypeById(int bigType_id);

	// 检查该二级类别名是否可用
	public Integer checkSecondTypeName(String smalltype_name);

	// 检查该一级类别名是否可用
	public Integer checkBigTypeName(String bigTypeName);

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
