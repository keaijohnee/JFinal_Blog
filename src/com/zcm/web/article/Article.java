package com.zcm.web.article;

import com.jfinal.plugin.activerecord.Model;

/**
 * Article model.
 */
@SuppressWarnings("serial")
public class Article extends Model<Article> {
	
	public static final Article dao = new Article();
	
}