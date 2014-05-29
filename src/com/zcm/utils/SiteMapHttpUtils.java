package com.zcm.utils;

import java.io.IOException;

import org.apache.commons.httpclient.HttpClient;
import org.apache.commons.httpclient.HttpException;
import org.apache.commons.httpclient.methods.PostMethod;

public class SiteMapHttpUtils {
	
	/**
	 * 百度SiteMap
	 * @return
	 * @throws HttpException
	 * @throws IOException
	 */
	public static boolean postSiteMap() throws HttpException, IOException{
		boolean exeState = false;
		HttpClient httpClient = new HttpClient();  
		String siteMapURL = "http://ping.baidu.com/sitemap?site=www.91zcm.com&resource_name=sitemap&access_token=lcrfZbBh";  
		PostMethod postMethod = new PostMethod(siteMapURL);  
		httpClient.executeMethod(postMethod); 
		String response = postMethod.getResponseBodyAsString();  
		System.out.println(response);
		if(response.contains("<int>200</int>")){
			exeState = true;
		}
		return exeState;
	}
}
