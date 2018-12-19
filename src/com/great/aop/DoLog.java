package com.great.aop;

import java.lang.reflect.Method;

import javax.servlet.http.HttpServletRequest;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.After;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import com.great.action.LogAction;
import com.great.bean.Admin;
import com.great.bean.MyLog;


@Aspect
@Configuration
public class DoLog {
	@Autowired
	private LogAction logAction;
	@Pointcut("@annotation(com.great.aop.Log)")
	private void log(){
	}
	
	@After("log()")
	public void test(JoinPoint jp) throws Exception{
		//得到类的名称
		String name=jp.getTarget().getClass().getName();
		//得到类
		Class<?> clazz=Class.forName(name);
		Method[] dec=clazz.getDeclaredMethods();
		HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
		Admin admin=(Admin)request.getSession().getAttribute("admin");
		int adminID=admin.getAdmin_id();
		String thing="";
		for(Method method:dec){
			Log aLog=method.getAnnotation(Log.class);
			if(aLog!=null){
				thing=aLog.thing();
			}
		}
		System.out.println(thing);
		MyLog myLog=new MyLog();
		myLog.setAdmin_id(adminID);
		myLog.setLog_operation(thing);
		logAction.addLog(myLog);
	}
	
}
