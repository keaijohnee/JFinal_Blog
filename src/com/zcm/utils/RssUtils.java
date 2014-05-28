package com.zcm.utils;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import com.sun.syndication.feed.rss.Channel;
import com.sun.syndication.feed.rss.Description;
import com.sun.syndication.feed.rss.Item;
import com.sun.syndication.io.FeedException;
import com.sun.syndication.io.WireFeedOutput;
import com.zcm.vo.ArticleVO;

public class RssUtils {
	
	public static String getRssString(List<ArticleVO> filmList,HashMap<String,String> map){
		
        Channel channel = new Channel("rss_2.0");
        channel.setTitle(map.get("title"));
        channel.setDescription(map.get("description"));
        channel.setLink("http://www.91zcm.com/");
        channel.setEncoding("UTF-8");
        /**这个list对应rss中的item列表**/
        List<Item> items = new ArrayList<Item>();
        /**新建Item对象，对应rss中的<item></item>**/
        Item item = null;
        for(ArticleVO article:filmList){
        	item = new Item();
        	item.setAuthor("91zcm");
        	item.setLink("http://www.91zcm.com/"+article.getCurl()+"/"+article.getAid()+".html");
        	item.setPubDate(DateUtils.parse(article.getAddtime()));
            item.setTitle(article.getTitle());
            Description description = new Description();
            description.setValue(article.getRemark());
            item.setDescription(description);
            items.add(item);
        }
        channel.setItems(items);
        /**用WireFeedOutput对象输出rss文本**/
        WireFeedOutput out = new WireFeedOutput();
        String rssString = "";
        try {
        	rssString = out.outputString(channel);
        } catch (IllegalArgumentException e) {
            e.printStackTrace();
        } catch (FeedException e) {
            e.printStackTrace();
        }
        return rssString;
	}
}