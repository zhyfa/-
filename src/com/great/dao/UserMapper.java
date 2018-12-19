package com.great.dao;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Select;


public interface UserMapper {

//	public int addUser(User user);

//	@Select("select a.*,b.parameterName from t_user a,t_parameter b where a.state=b.parameterValue and b.parameterType='用户状态' ")
//	public List<User> queryAll(User user);
	
	@Select("select count(0) from t_user")
	public int queryCount();
//=====================================================================
	@Delete("delete from f_user_t where id=#{id}")
	public void delUser(Integer userId);

//	@Select("select * from f_user_t where id=#{id")
//	public User queryUserById(Integer userId);

}