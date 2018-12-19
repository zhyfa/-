package com.great.action;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.great.bean.Purchase;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import net.sf.json.JsonConfig;


@Controller
@RequestMapping("/exportTable")
public class ExportTable {
	@RequestMapping(value = "/exportTable.action",method=RequestMethod.POST,produces="application/json;charset=utf-8")
	public @ResponseBody String exportTable(@RequestBody String b) {
		try {
			b=URLDecoder.decode(b, "UTF-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		b = b.substring(0,b.length() - 1);
		System.out.println(b);
		JSONArray jsonArray=JSONArray.fromObject(b);
//		List<Purchase> purchases = jsonArray.toList(jsonArray, new Purchase(),new JsonConfig());
		System.out.println(jsonArray);
//		for(int i=0;i<=jsonArray.size();i++) {
//			String jsonObject2 = (String) jsonArray.get(i);
//			String[] parts = jsonObject2.split(",");
//			System.out.println(parts);
//		}
		System.out.println(jsonArray);
		return "1";
	}
	
}
