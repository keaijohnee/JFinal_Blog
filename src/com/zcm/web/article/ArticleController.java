package com.zcm.web.article;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import com.jfinal.core.Controller;
import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Page;
import com.jfinal.plugin.activerecord.Record;
import com.zcm.utils.DateUtils;
import com.zcm.utils.LuceneUtil;
import com.zcm.utils.PageUtils;
import com.zcm.utils.RssUtils;
import com.zcm.utils.StringUtils;
import com.zcm.vo.ArticleAllVO;
import com.zcm.vo.ArticleVO;
import com.zcm.web.category.Category;
import com.zcm.web.gbook.Gbook;
import com.zcm.web.tags.Tags;
import com.zcm.web.website.Website;

/**
 * 文章管理
 * @author jiang.li
 */
public class ArticleController extends Controller {
	
	/**
	 * 404页面跳转
	 */
	public void notfound(){
		getResponse().setStatus(404);
	}
	
	/**
	 * 添加留言
	 */
	public void message(){
		String verifyimg = getPara("verifyimg")==null?"":getPara("verifyimg");
		String rand = getSessionAttr("rand");
		String ip = this.getRequest().getRemoteAddr();
		if(verifyimg.equals(rand)){
			String nickname = getPara("nickname")==null?"热心网友":StringUtils.getSearchWord(getPara("nickname"));
			String email = getPara("email")==null?"http://www.91zcm.com":StringUtils.getSearchWord(getPara("email"));
			String content = getPara("content")==null?"木有留言内容":StringUtils.getSearchWord(getPara("content"));
			int aid = getParaToInt("aid");
			Record c = new Record();
			c.set("addtime", DateUtils.getNowTime(DateUtils.DATE_FULL_STR));
			c.set("nickname", nickname);
			c.set("email", email);
			c.set("aid", aid);
			c.set("ip", ip);
			c.set("state", 0);
			c.set("content", content);
			long num = Db.queryLong("select count(1) from gbook where aid = ? and ip = ? and addtime like ?",aid,ip,"%"+DateUtils.getNowTime(DateUtils.DATE_SMALL_STR)+"%");
			if(num>0){
				renderText("这篇文章今天已经评论过了,明天再来吧!");
			}else{
				boolean isok = Db.save("gbook", c);
				if(isok){
					renderText("留言成功，请耐心等待管理员回复！");
				}else{
					renderText("留言失败！");
				}
			}
		}else{
			renderText("验证码输入错误,留言失败！");
		}
	}
	
	
	
	/**
	 * 搜索
	 */
	public void search() throws Exception{
		String word = getPara("word")==null?"":getPara("word");
		if(!"".equals(word)){
			//word = new String(word.getBytes("iso-8859-1"),"UTF-8");
			word = StringUtils.getSearchWord(word);
			setAttr("word", word);
			List<ArticleVO> newarticleList = new ArrayList<ArticleVO>();
			Category category = null;
			String aids = LuceneUtil.searchString(word);
			int pageNumber = 1;
			try{
				pageNumber = this.getRequest().getAttribute("page")==null?1:Integer.parseInt(this.getRequest().getAttribute("page").toString());
			}catch(Exception e){
				pageNumber = 1;
			}
			Page<Article> articleList = null;
			if(com.jiangge.utils.StringUtils.isNotEmpty(word)){
				if(com.jiangge.utils.StringUtils.isNotEmpty(aids)){
					articleList = Article.dao.paginate(pageNumber, 15, "select *", "from article where aid in("+aids+") order by aid desc");
				}else{
					articleList = Article.dao.paginate(pageNumber, 15, "select *", "from article where 1=2 order by aid desc");
				}
			}else{
				articleList = Article.dao.paginate(pageNumber, 15, "select *", "from article order by aid desc");
			}
			ArticleVO vo = null;
			for(Article article : articleList.getList()){
				vo = new ArticleVO();
				vo.setAid(article.getInt("aid"));
				vo.setRemark(StringUtils.getReplace(article.getStr("remark"), word));
				vo.setContent(article.getStr("content"));
				vo.setTitle(StringUtils.getReplace(article.getStr("title"), word));
				vo.setAddtime(article.getStr("addtime"));
				vo.setCid(article.getInt("cid"));
				vo.setClicknum(article.getInt("clicknum"));
				long anum = Db.queryLong("select count(1) from gbook where aid = ? and state = 1",article.get("aid"));
				vo.setMsgnum(anum);
				category = Category.dao.findFirst("select * from category where cid = ?", new Object[]{article.getInt("cid")});
				vo.setCname(category.getStr("cname"));
				vo.setCurl(category.getStr("url"));
				vo.setImgurl(article.getStr("imgurl"));
				vo.setType(article.getStr("type"));
				newarticleList.add(vo);
			}
			setAttr("articleList", newarticleList);
			setAttr("pageNumList", PageUtils.getPages(articleList.getPageNumber(),articleList.getTotalPage()));
			setAttr("pageList", articleList);
			setAttr("listSize", articleList.getTotalRow());
		}else{
			Page<ArticleVO> articleList = new Page<ArticleVO>(new ArrayList<ArticleVO>(),1,15,0,0);
			setAttr("pageList", articleList);
			setAttr("articleList", articleList.getList());
			setAttr("listSize", "0");
		}
		/**获取网站配置**/
		HashMap<String,String> map = Website.getConfig();
		setAttr("config", map);
		/**导航菜单**/
		List<Category> menuList = Category.getAllCategory();
		setAttr("menuList", menuList);
		/**文章标签**/
		List<Tags> tagsList = Tags.dao.find("select distinct tname,tid,aid,cid from tags where tname like ? order by tid desc limit 0,15","%"+word+"%");
		setAttr("tagsList", tagsList);
		render("/view/search.jsp");
	}
	
	
	/**
	 * 文章分类列表
	 */
	public void articleList(){
		String url = this.getRequest().getAttribute("url").toString();
		Category category = Category.dao.findFirst("select * from category where url = ?", new Object[]{url});
		if(category==null){
			getResponse().setStatus(404);
		}else{
			/**获取网站配置**/
			HashMap<String,String> map = Website.getConfig();
			setAttr("config", map);
			/**导航菜单**/
			List<Category> menuList = Category.getAllCategory();
			setAttr("menuList", menuList);
			/**获取一个最新的置顶文章**/
			Article top = Article.dao.findFirst("select * from article where type in('1') and cid = ? order by aid desc", new Object[]{category.getInt("cid")});
			ArticleVO vo = null;
			if(top!=null){
				vo = new ArticleVO();
				vo.setAddtime(top.getStr("addtime"));
				vo.setAid(top.getInt("aid"));
				vo.setCid(top.getInt("cid"));
				vo.setClicknum(top.getInt("clicknum"));
				long anum = Db.queryLong("select count(1) from gbook where aid = ? and state = 1",top.get("aid"));
				vo.setMsgnum(anum);
				category = Category.dao.findFirst("select * from category where cid = ?", new Object[]{top.getInt("cid")});
				vo.setCname(category.getStr("cname"));
				vo.setCurl(category.getStr("url"));
				vo.setImgurl(top.getStr("imgurl"));
				vo.setRemark(top.getStr("remark"));
				vo.setTitle(top.getStr("title"));
				vo.setType(top.getStr("type"));
				setAttr("top", vo);
			}
			/**分页获取**/
			int pageNumber = 1;
			try{
				pageNumber = this.getRequest().getAttribute("page")==null?1:Integer.parseInt(this.getRequest().getAttribute("page").toString());
			}catch(Exception e){
				pageNumber = 1;
			}
			setAttr("showCid", category.getInt("cid"));
			setAttr("category", category);
			Page<Article> articleList = Article.dao.paginate(pageNumber, 15, "select *", "from article where cid = " + category.getInt("cid") + " order by aid desc");
			List<ArticleVO> newarticleList = new ArrayList<ArticleVO>();
			for(Article article:articleList.getList()){
				vo = new ArticleVO();
				vo.setAddtime(article.getStr("addtime"));
				vo.setAid(article.getInt("aid"));
				vo.setCid(article.getInt("cid"));
				vo.setClicknum(article.getInt("clicknum"));
				long num = Db.queryLong("select count(1) from gbook where aid = ? and state = 1",article.get("aid"));
				vo.setMsgnum(num);
				category = Category.dao.findFirst("select * from category where cid = ?", new Object[]{article.getInt("cid")});
				vo.setCname(category.getStr("cname"));
				vo.setCurl(category.getStr("url"));
				vo.setImgurl(article.getStr("imgurl"));
				vo.setRemark(article.getStr("remark"));
				vo.setTitle(article.getStr("title"));
				vo.setType(article.getStr("type"));
				newarticleList.add(vo);
			}
			setAttr("pageList", articleList);
			setAttr("pageNumList", PageUtils.getPages(articleList.getPageNumber(),articleList.getTotalPage()));
			setAttr("articleList", newarticleList);
			/**文章标签**/
			List<Tags> tagsList = Tags.dao.find("select distinct tname,tid,aid,cid from tags where cid = ? order by tid desc limit 0,15",category.getInt("cid"));
			setAttr("tagsList", tagsList);
			render("/view/list.jsp");
		}
	}
	
	/**
	 * Tag列表
	 */
	public void tagList(){
		/**获取网站配置**/
		HashMap<String,String> map = Website.getConfig();
		setAttr("config", map);
		/**导航菜单**/
		List<Category> menuList = Category.getAllCategory();
		setAttr("menuList", menuList);
		/**分页获取**/
		int pageNumber = 1;
		try{
			pageNumber = this.getRequest().getAttribute("page")==null?1:Integer.parseInt(this.getRequest().getAttribute("page").toString());
		}catch(Exception e){
			pageNumber = 1;
		}
		Page<Tags> tagList = Tags.dao.paginate(pageNumber, 200, "select distinct tname,tid,aid,cid", "from tags order by aid desc");
		setAttr("pageList", tagList);
		setAttr("pageNumList", PageUtils.getPages(tagList.getPageNumber(),tagList.getTotalPage()));
		render("/view/tags.jsp");
	}
	
	
	
	/**
	 * 网站html格式地图
	 */
	public void sitemap(){
		List<ArticleAllVO> allVOList = new ArrayList<ArticleAllVO>();
		List<Category> menuList = Category.getAllCategory();
		ArticleAllVO vo = null;
		for(Category c:menuList){
			vo = new ArticleAllVO();
			vo.setCname(c.getStr("cname"));
			vo.setCurl(c.getStr("url"));
			List<ArticleVO> aList = new ArrayList<ArticleVO>();
			List<Article> articleList = Article.dao.find("select * from article where cid = ? ", new Object[]{c.getInt("cid")});
			ArticleVO avo = null;
			Category category = null;
			for(Article article : articleList){
				avo = new ArticleVO();
				avo.setAddtime(article.getStr("addtime"));
				avo.setAid(article.getInt("aid"));
				avo.setCid(article.getInt("cid"));
				avo.setClicknum(article.getInt("clicknum"));
				category = Category.dao.findFirst("select * from category where cid = ?", new Object[]{article.getInt("cid")});
				avo.setCname(category.getStr("cname"));
				avo.setCurl(category.getStr("url"));
				avo.setImgurl(article.getStr("imgurl"));
				avo.setRemark(article.getStr("remark"));
				avo.setTitle(article.getStr("title"));
				avo.setContent(article.getStr("content"));
				avo.setType(article.getStr("type"));
				aList.add(avo);
			}
			vo.setList(aList);
			allVOList.add(vo);
		}
		setAttr("articleList", allVOList);
		/**首页下的总分类详细**/
		render("/view/sitemap.jsp");
	}

	/**
	 * RSS服务
	 */
	public void rss(){
		/**获取网站配置**/
		HashMap<String,String> map = Website.getConfig();
		/**最近更新**/
		List<ArticleVO> aList = new ArrayList<ArticleVO>();
		List<Article> articleList = Article.dao.find("select * from article order by addtime desc limit 100");
		ArticleVO avo = null;
		Category category = null;
		for(Article article : articleList){
			avo = new ArticleVO();
			avo.setAddtime(article.getStr("addtime"));
			avo.setAid(article.getInt("aid"));
			avo.setCid(article.getInt("cid"));
			avo.setClicknum(article.getInt("clicknum"));
			category = Category.dao.findFirst("select * from category where cid = ?", new Object[]{article.getInt("cid")});
			avo.setCname(category.getStr("cname"));
			avo.setCurl(category.getStr("url"));
			avo.setImgurl(article.getStr("imgurl"));
			avo.setRemark(article.getStr("remark"));
			avo.setTitle(article.getStr("title"));
			avo.setContent(article.getStr("content"));
			avo.setType(article.getStr("type"));
			aList.add(avo);
		}
		String rssText = RssUtils.getRssString(aList,map);
		this.renderText(rssText, "application/xml");
	}
	
	/**
	 * 获取单个文章信息
	 */
	public void getarticle(){
		Integer aid = 0;
		try{
			aid = this.getRequest().getAttribute("aid")==null?1:Integer.parseInt(this.getRequest().getAttribute("aid").toString());
			Record record = Db.findFirst("select * from article where aid = ?",aid);
			if(record!=null){
				int num = record.getInt("clicknum");
				record.set("clicknum", num+1);
				Db.update("article", "aid", record);
				ArticleVO vo = new ArticleVO();
				vo.setAddtime(record.getStr("addtime"));
				vo.setAid(record.getInt("aid"));
				vo.setCid(record.getInt("cid"));
				vo.setClicknum(record.getInt("clicknum"));
				Category category = Category.dao.findFirst("select * from category where cid = ?", new Object[]{record.getInt("cid")});
				vo.setCname(category.getStr("cname"));
				vo.setCurl(category.getStr("url"));
				vo.setImgurl(record.getStr("imgurl"));
				vo.setRemark(record.getStr("remark"));
				vo.setTitle(record.getStr("title"));
				vo.setContent(record.getStr("content"));
				vo.setType(record.getStr("type"));
				setAttr("article", vo);
				setAttr("showCid", category.getInt("cid"));
				setAttr("category", category);
				/**导航菜单**/
				List<Category> menuList = Category.getAllCategory();
				setAttr("menuList", menuList);
				/**获取网站配置**/
				HashMap<String,String> map = Website.getConfig();
				setAttr("config", map);
				/**文章留言**/
				List<Gbook> gbookList = Gbook.dao.find("select * from gbook where aid = ? and state = 1 order by mid asc",aid);
				setAttr("gbookList", gbookList);
				setAttr("gbookSize", gbookList.size());
				/**文章标签**/
				List<Tags> tagsList = Tags.dao.find("select distinct tname,tid,aid,cid from tags where aid = ? order by tid asc" , aid);
				setAttr("tagsList", tagsList);
				render("/view/article.jsp");
			}else{
				getResponse().setStatus(404);
			}
		}catch(Exception e){
			getResponse().setStatus(404);
		}
	}
	
	
	/**
	* 提供（相对）精确的除法运算。当发生除不尽的情况时，由scale参数指
	* 定精度，以后的数字四舍五入。
	* @param v1 被除数
	* @param v2 除数
	* @param scale 表示表示需要精确到小数点以后几位。
	* @return 两个参数的商
	*/
	public static double div(double v1, double v2, int scale) {
	   if (scale < 0) {
	    throw new IllegalArgumentException(
	      "The scale must be a positive integer or zero");
	   }
	   BigDecimal b1 = new BigDecimal(Double.toString(v1));
	   BigDecimal b2 = new BigDecimal(Double.toString(v2));
	   return b1.divide(b2, scale, BigDecimal.ROUND_HALF_UP).doubleValue();
	}
	
}


