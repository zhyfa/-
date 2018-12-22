package com.great.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.great.bean.Purchase;
import com.great.dao.PurchaseMapper;
@Service
public class PurchaseService {
	@Autowired
	private PurchaseMapper purchaseDao;
	public int addPruchase(Purchase purchase) {
		return purchaseDao.addPruchase(purchase);
	}
	public int passPurchase(String auditsdetail_id) {
		return purchaseDao.passPurchase(auditsdetail_id);
	}
	public List<Map<String,Object>> queryPurchase() {
		return purchaseDao.queryPurchase();
	};
	public List<Map<String,Object>> getUnfinishedPurchase(){
		return purchaseDao.getUnfinishedPurchase();
	}
	public int updateStock(Purchase purchase) {
		return purchaseDao.updateStock(purchase);
	}
	public int returnPurchase(String auditsdetail_id) {
		return purchaseDao.returnPurchase(auditsdetail_id);
	}
	public Map<String,Object> queryPurchaseById(String auditsdetail_id){
		return purchaseDao.queryPurchaseById(auditsdetail_id);
	}
}
