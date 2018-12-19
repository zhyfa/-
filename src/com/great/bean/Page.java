package com.great.bean;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;


public class Page {
	private int total;//记录总数
	private int totalPage;//总页数
	private int page;//当前页
	public static int count=4;//每页显示记录数
	private List<Map<String, Object>> queryList;//查询出的数据
	private int StartCount;//记录开始
	private int endCount;//记录结束
	private List<Integer> pageShu;//下标数组
	private static int countTwo=5;//下标每页显示几个
	private int pageTwo;//下标页数
	private int totalPageTwo;//下标总页数
	public Page() {
		pageShu=new ArrayList<>();
	}
	public void csh(){
		totalPage=total%count==0?total/count:total/count+1;
		StartCount=(page-1)*count+1;
		endCount=page*count;
		if(totalPage>=pageTwo*countTwo){
		for(int i=1;i<=countTwo;i++){
			pageShu.add((pageTwo-1)*countTwo+i);
			}
		}else{
			for(int i=(pageTwo-1)*countTwo+1;i<=totalPage;i++){
				pageShu.add(i);
			}
			totalPageTwo=totalPage%countTwo==0?totalPage/countTwo:totalPage/countTwo+1;
		}
	}
	public int getTotalPage() {
		return totalPage;
	}
	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}
	public int getPage() {
		return page;
	}
	public void setPage(int page) {
		this.page = page;
	}
	public List<Map<String, Object>> getQueryList() {
		return queryList;
	}
	public void setQueryList(List<Map<String, Object>> queryList) {
		this.queryList = queryList;
	}
	public int getTotal() {
		return total;
	}
	public void setTotal(int total) {
		this.total = total;
	}
	public int getStartCount() {
		return StartCount;
	}
	public void setStartCount(int startCount) {
		StartCount = startCount;
	}
	public int getEndCount() {
		return endCount;
	}
	public void setEndCount(int endCount) {
		this.endCount = endCount;
	}
	public List<Integer> getPageShu() {
		return pageShu;
	}
	public void setPageShu(List<Integer> pageShu) {
		this.pageShu = pageShu;
	}
	public static int getCountTwo() {
		return countTwo;
	}
	public static void setCountTwo(int countTwo) {
		Page.countTwo = countTwo;
	}
	public int getPageTwo() {
		return pageTwo;
	}
	public void setPageTwo(int pageTwo) {
		this.pageTwo = pageTwo;
	}
	public int getTotalPageTwo() {
		return totalPageTwo;
	}
	public void setTotalPageTwo(int totalPageTwo) {
		this.totalPageTwo = totalPageTwo;
	}
	
	
}
