package com.zcm.web.category;

import java.util.List;

import com.jfinal.plugin.activerecord.Model;
import com.jfinal.plugin.ehcache.CacheKit;
import com.zcm.utils.EhcacheConst;

/**
 * Category model.
 */
public class Category extends Model<Category> {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	public static final Category dao = new Category();
	
	public static List<Category> getAllCategory(){
		String key = "Category_getAllCategory";
		List<Category> cList = CacheKit.get(EhcacheConst.ZcmCache, key);
		if(null == cList){
		    cList = Category.dao.find("select * from category order by cid asc");
			CacheKit.put(EhcacheConst.ZcmCache, key, cList);
		}
		return cList;
	}
	
}