package com.great.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.great.bean.Parameter;
import com.great.dao.ParameterMapper;
@Service
public class ParameterService  {

	@Autowired
	private ParameterMapper parameterDao;
	
	public List<Parameter> getParameters(Parameter parameter,Integer pageIndex,Integer NUMBER) {
		PageHelper.startPage(pageIndex, NUMBER);
		return parameterDao.getParameters(parameter);
	}
	
	public int parameterAdd(Parameter parameter) {
		// TODO Auto-generated method stub
		return parameterDao.parameterAdd(parameter);
	}
	
	public Parameter checkParameter(Parameter parameter) {
		// TODO Auto-generated method stub
		return parameterDao.checkParameter(parameter);
	}
	
	public int delParameter(int parameter_id) {
		// TODO Auto-generated method stub
		return parameterDao.delParameter(parameter_id);
	}
	
	public Parameter getParameterById(int parameter_id) {
		// TODO Auto-generated method stub
		return parameterDao.getParameterById(parameter_id);
	}
	
	public int updateParameter(Parameter parameter) {
		// TODO Auto-generated method stub
		return parameterDao.updateParameter(parameter);
	}
	public List<Map<String, Object>> querybyadmin() {
		// TODO Auto-generated method stub
		return parameterDao.querybyadmin();
	}

}
