package com.zcm.common;

import com.alibaba.druid.filter.stat.StatFilter;
import com.alibaba.druid.wall.WallFilter;
import com.jfinal.config.Constants;
import com.jfinal.config.Handlers;
import com.jfinal.config.Interceptors;
import com.jfinal.config.JFinalConfig;
import com.jfinal.config.Plugins;
import com.jfinal.config.Routes;
import com.jfinal.plugin.activerecord.ActiveRecordPlugin;
import com.jfinal.plugin.druid.DruidPlugin;
import com.jfinal.plugin.ehcache.EhCachePlugin;
import com.jfinal.render.ViewType;
import com.zcm.utils.FakeStaticHandler;
import com.zcm.utils.ReadPropertity;
import com.zcm.web.admin.Admin;
import com.zcm.web.admin.AdminController;
import com.zcm.web.article.Article;
import com.zcm.web.article.ArticleController;
import com.zcm.web.category.Category;
import com.zcm.web.gbook.Gbook;
import com.zcm.web.links.Links;
import com.zcm.web.tags.Tags;
import com.zcm.web.website.Website;

/**
 * API引导式配置
 */
public class CommonConfig extends JFinalConfig {
	
	/**
	 * 配置常量
	 */
	@Override
	public void configConstant(Constants me) {
	    boolean devMode = Boolean.parseBoolean(ReadPropertity.getProperty("devMode"));
		me.setDevMode(devMode);
		me.setViewType(ViewType.JSP); 	
	}
	
	/**
	 * 配置路由
	 */
	@Override
	public void configRoute(Routes me) {
		me.add("/", CommonController.class);
		me.add("/sysadmin", AdminController.class);
		me.add("/article", ArticleController.class);
	}
	
	/**
	 * 配置插件
	 */
	@Override
	public void configPlugin(Plugins me) {
		/**配置Druid数据库连接池插件**/
		DruidPlugin dp = new DruidPlugin(ReadPropertity.getProperty("jdbcUrl"), ReadPropertity.getProperty("user"), ReadPropertity.getProperty("password"));
		dp.addFilter(new StatFilter());
		dp.setMaxActive(150);
		WallFilter wall = new WallFilter();
		wall.setDbType(ReadPropertity.getProperty("dbType"));
		dp.addFilter(wall);
		me.add(dp);
		
		/**配置ActiveRecord插件**/
		ActiveRecordPlugin arp = new ActiveRecordPlugin(dp);
		me.add(arp);
		
		/**加载EhCache插件**/
		me.add(new EhCachePlugin());
		
		arp.addMapping("admin", Admin.class);
		arp.addMapping("category", Category.class);
		arp.addMapping("article", Article.class);
		arp.addMapping("links", Links.class);
		arp.addMapping("website", Website.class);
		arp.addMapping("tags", Tags.class);
		arp.addMapping("gbook", Gbook.class);
	}
	
	/**
	 * 配置全局拦截器
	 */
	@Override
	public void configInterceptor(Interceptors me) {
		
	}
	
	/**
	 * 配置处理器
	 */
	@Override
	public void configHandler(Handlers me) {
		me.add(new FakeStaticHandler());
	}
}
