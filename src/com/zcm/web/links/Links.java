package com.zcm.web.links;

import java.util.List;

import com.jfinal.plugin.activerecord.Model;
import com.jfinal.plugin.ehcache.CacheKit;
import com.zcm.utils.EhcacheConst;

/**
 * Links model.
 */
@SuppressWarnings("serial")
public class Links extends Model<Links> {
	
	public static final Links dao = new Links();
	
	public static List<Links> getAllLinks(){
		String key = "Links_getAllLinks";
		List<Links> cList = CacheKit.get(EhcacheConst.ZcmCache, key);
		if(null == cList){
			cList = Links.dao.find("select * from links order by id asc");
			CacheKit.put(EhcacheConst.ZcmCache, key, cList);
		}
		return cList;
	}
	
}