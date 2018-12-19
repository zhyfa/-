package com.great.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.great.dao.DrugTypeMapper;

@Service
public class DrugTypeService {
	@Resource
	private DrugTypeMapper drugTypeMapper;

	// 查询一级药品目录
	public List<Map<String, Object>> firstType() {
		// TODO Auto-generated method stub
		return drugTypeMapper.firstType();
	}

	// 通过一级药品的Id查询其下的子目录
	public List<Map<String, Object>> secondTypeById(int father_id) {
		// TODO Auto-generated method stub
		return drugTypeMapper.secondTypeById(father_id);
	}

	// 添加一个一级目录
	public int addFirstType(String bigTypeName) {
		return drugTypeMapper.addFirstType(bigTypeName);
	}

	// 修改一个一级目录的名称
	public int updateFirstType(Map<String, Object> map) {
		return drugTypeMapper.updateFirstType(map);
	}

	// 查询全部的二级目录，根据一级目录的名称排序
	public List<Map<String, Object>> secondType() {
		return drugTypeMapper.secondType();
	}

	// 修改一个二级目录的名称
	public int updateSecondType(Map<String, Object> map) {
		return drugTypeMapper.updateSecondType(map);
	}

	// 查询一个的二级目录，通过它的ID
	public Map<String, Object> typeById(int smallTypeId) {
		return drugTypeMapper.typeById(smallTypeId);
	}

	// 删除一个二级目录
	public int delSecondTypeById(int smallTypeId) {
		return drugTypeMapper.delSecondTypeById(smallTypeId);
	}

	// 添加一个二级目录
	public int addSecondType(Map<String, Object> map) {
		return drugTypeMapper.addSecondType(map);
	}

}
