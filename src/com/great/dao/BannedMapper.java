package com.great.dao;

import java.util.List;
import java.util.Map;

import com.great.bean.Banned;
public interface BannedMapper {

	public int addBanned(Banned banned);

	public int delBanned(Banned banned);

	public List<Map<String, Object>> queryall();

}
