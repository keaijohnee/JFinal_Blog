package com.zcm.web.website;

import java.util.HashMap;
import java.util.List;

import com.jfinal.plugin.activerecord.Model;
import com.jfinal.plugin.ehcache.CacheKit;
import com.zcm.utils.EhcacheConst;

/**
 * Website model.
 */
@SuppressWarnings("serial")
public class Website extends Model<Website> {
	
	public static final Website dao = new Website();
	
	/**
	 * 获取网站配置
	 * @return
	 */
	public static HashMap<String,String> getConfig(){
		String key = "Website_getConfig";
		HashMap<String,String> map = CacheKit.get(EhcacheConst.ZcmCache, key);
		if(null == map){
		    map = new HashMap<String,String>();
	    	String sql = "select * from website";
	    	List<Website> websiteList = Website.dao.find(sql);
			for(Website web:websiteList){
				map.put(web.getStr("code"), web.getStr("content"));
			}
			CacheKit.put(EhcacheConst.ZcmCache, key, map);
		}
		return map;
	}
}