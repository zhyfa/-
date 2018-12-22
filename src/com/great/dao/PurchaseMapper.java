package com.great.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.great.bean.Purchase;
@Repository
public interface PurchaseMapper {
	public int addPruchase(Purchase purchase);
	public List<Map<String,Object>> queryPurchase();
	public int passPurchase(String auditsdetail_id);
	public List<Map<String,Object>> getUnfinishedPurchase();
	public int updateStock(Purchase purchase);
	public int returnPurchase(String auditsdetail_id);
	public Map<String,Object> queryPurchaseById(String auditsdetail_id);
}
