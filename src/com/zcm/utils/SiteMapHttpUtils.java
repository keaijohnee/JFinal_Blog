package com.zcm.utils;

import java.io.IOException;

import org.apache.commons.httpclient.HttpClient;
import org.apache.commons.httpclient.HttpException;
import org.apache.commons.httpclient.methods.PostMethod;

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
	 * @return
	 * @throws HttpException
	 * @throws IOException
	 */
	public static void postSiteMap() throws HttpException, IOException{
		HttpClient httpClient = new HttpClient();  
		PostMethod postMethod = new PostMethod(siteMapURL);  
		httpClient.executeMethod(postMethod); 
		String response = postMethod.getResponseBodyAsString();  
		System.out.println("百度SiteMap:\n" + response);
	}
	
}
