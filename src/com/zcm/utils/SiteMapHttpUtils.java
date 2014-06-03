package com.zcm.utils;

import java.io.IOException;
import java.io.OutputStreamWriter;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLConnection;

import com.jiangge.utils.DateUtils;

/**
 * 百度文章SiteMap工具
 * <p>Company:  91注册码</p>
 * time:2014-06-01
 * @author www.91zcm.com
 * @date 
 * @version 1.0
*/
public class SiteMapHttpUtils {
	
	
	/**百度SiteMap地址**/
	public static final String siteMapURL = "http://ping.baidu.com/sitemap?site=www.91zcm.com&resource_name=sitemap&access_token=lcrfZbBh";  
	
	
	/**
	 * 百度SiteMap
	 * @param articleURL
	 */
	public static void postSiteMap(String articleURL) {  
        try {  
            URL url = new URL(siteMapURL);  
            URLConnection con = url.openConnection();  
            con.setDoOutput(true);  
            con.setRequestProperty("Pragma:", "no-cache");  
            con.setRequestProperty("Cache-Control", "no-cache");  
            con.setRequestProperty("Content-Type", "text/xml");  
            OutputStreamWriter out = new OutputStreamWriter(con.getOutputStream());      
            String xmlInfo = SiteMapHttpUtils.getXmlInfo(articleURL);  
            out.write(new String(xmlInfo.getBytes("ISO-8859-1")));  
            out.flush();  
            out.close();  
        } catch (MalformedURLException e) {  
            e.printStackTrace();  
        } catch (IOException e) {  
            e.printStackTrace();  
        }  
    }  
	
	/**
	 * 组装SiteMap需要的XML文件
	 * @param url
	 * @return
	 */
	private static String getXmlInfo(String url){
		StringBuffer xmlData = new StringBuffer("");
		xmlData.append("<?xml version=\"1.0\" encoding=\"UTF-8\"?>");
		xmlData.append("<urlset>");
		xmlData.append("<url>");
		xmlData.append("<loc><![CDATA[");
		xmlData.append(url);
		xmlData.append("]]></loc>");
		xmlData.append("<lastmod>");
		xmlData.append(DateUtils.getNowTime(DateUtils.DATE_SMALL_STR));
		xmlData.append("</lastmod>");
		xmlData.append("<changefreq>daily</changefreq>");
		xmlData.append("<priority>0.8</priority>");	
		xmlData.append("</url>");	
		xmlData.append("</urlset>");
		return xmlData.toString();
	}
	
}
