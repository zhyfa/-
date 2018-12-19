package com.great.bean;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.github.pagehelper.PageInfo;
/**
 * 分页助手
 * 蒋亚福
 * @author ASUS
 *
 */
public class InfoPage {
	public static Integer NUMBER=5;  //每页的条数
	private Integer count;//总记录数
	private Integer all;//总页数
	private Integer page;//当前页
	private List list ;//所有 记录
	private Integer next;//下一页
	private Integer pre;//上一页
	private List prePages;
	private List nextPages;
	
	public void init(){
		all = (count%NUMBER)==0?(count/NUMBER):(count/NUMBER)+1;
		all = all == 0?1:all;
		next = page+1>=all?all:page+1;
		pre = page-1<=1?1:page-1;
		paging();
	}
	public InfoPage() {
	}
	
	public InfoPage(List list) {
		this.list = list;
		PageInfo l = new PageInfo<>(list);
		this.count = (int) l.getTotal();
		this.page =  l.getPageNum();
		all = (count%NUMBER)==0?(count/NUMBER):(count/NUMBER)+1;
		all = all == 0?1:all;
		next = page+1>=all?all:page+1;
		pre = page-1<=1?1:page-1;
		paging();
	}
	public InfoPage(Integer count, Integer page, List list) {
		this.count = count;
		this.page = page;
		this.list = list;
		all = (count%NUMBER)==0?(count/NUMBER):(count/NUMBER)+1;
		all = all == 0?1:all;
		next = page+1>=all?all:page+1;
		pre = page-1<=1?1:page-1;
		paging();
	}
	
	private void paging(){
		prePages = new ArrayList<>();
		nextPages = new ArrayList<>();
		for(Integer i = 1;i <= 2;i++){
			if(page - i < 1){
				break;
			}else{
				prePages.add(0, page-i);
			}
		}
		for(Integer i = 1;i <= 4-prePages.size();i++){
			if(page + i > all){
				break;
			}else{
				nextPages.add(page+i);
			}
		}
	}
	
	public Integer getPage() {
		return page;
	}
	public void setPage(Integer page) {
		this.page = page;
	}
	public Integer getCount() {
		return count;
	}
	public void setCount(Integer count) {
		this.count = count;
	}
	public Integer getAll() {
		return all;
	}
	public void setAll(Integer all) {
		this.all = all;
	}
	
	public List getList() {
		return list;
	}

	public void setList(List list) {
		this.list = list;
	}

	public Integer getNext() {
		return next;
	}
	public void setNext(Integer next) {
		this.next = next;
	}
	public Integer getPre() {
		return pre;
	}
	public void setPre(Integer pre) {
		this.pre = pre;
	}

	public List getPrePages() {
		return prePages;
	}

	public void setPrePages(List prePages) {
		this.prePages = prePages;
	}

	public List getNextPages() {
		return nextPages;
	}

	public void setNextPages(List nextPages) {
		this.nextPages = nextPages;
	}
	@Override
	public String toString() {
		return "Page [count=" + count + ", all=" + all + ", page=" + page + ", list=" + list + ", next=" + next
				+ ", pre=" + pre + ", prePages=" + prePages + ", nextPages=" + nextPages + "]";
	}
	
}
