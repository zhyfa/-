package com.great.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.great.bean.Parameter;
@Repository
public interface ParameterMapper {
	public List<Parameter> getParameters(Parameter parameter);
	
	public int parameterAdd(Parameter parameter);
	
	public Parameter checkParameter(Parameter parameter);
	
	public int delParameter(int parameter_id);
	
	public Parameter getParameterById(int parameter_id);
	
	public int updateParameter(Parameter parameter);
	
	public List<Map<String, Object>> querybyadmin();
}
