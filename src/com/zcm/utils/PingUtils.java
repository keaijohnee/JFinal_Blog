package com.zcm.utils;

import org.apache.commons.httpclient.HttpClient;
import org.apache.commons.httpclient.methods.PostMethod;
import org.apache.commons.httpclient.methods.RequestEntity;
import org.apache.commons.httpclient.methods.StringRequestEntity;

/**
 * 百度文章Ping工具
 * <p>Company:  91注册码</p>
 * time:2014-06-01
 * @author www.91zcm.com
 * @date 
 * @version 1.0
*/
public class PingUtils {
	
	public static final String PING_RPC   = "http://ping.baidu.com/ping/RPC2";     /**博客Ping地址**/
	public static final String PING_TITLE = "91注册码";                            /**博客名称**/
	public static final String PING_URL   = "http://www.91zcm.com/";               /**博客首页地址**/
	public static final String PING_RSS   = "http://www.91zcm.com/rss.xml";        /**博客RSS地址**/

	/**
	 * 创建Ping需要的XML格式的文件
	 */
	private static String buildMethodCall(String shareURL) {
		StringBuffer buffer = new StringBuffer();
		buffer.append("<?xml version=\"1.0\" encoding=\"UTF-8\" ?>");
		buffer.append("<methodCall>");
		buffer.append("<methodName>weblogUpdates.extendedPing</methodName>");
		buffer.append("<params>");
		buffer.append("<param><value><string>");
		buffer.append(PING_URL);
		buffer.append("</string></value></param>");
		buffer.append("<param><value><string>");
		buffer.append(PING_TITLE);
		buffer.append("</string></value></param>");
		buffer.append("<param><value><string>");
		buffer.append(shareURL);
		buffer.append("</string></value></param>");
		buffer.append("<param><value><string>");
		buffer.append(PING_RSS);
		buffer.append("</string></value></param>");
		buffer.append("</params>");
		buffer.append("</methodCall>");
		return buffer.toString();
	}
  
	
	/**
	 * 91zcm.com Ping 百度方法
	 * @param shareURL   新发文章地址
	 * @return
	 * @throws Exception
	 */
	public static void pingBaidu(String shareURL) throws Exception {
		PostMethod post = new PostMethod(PING_RPC);
		post.addRequestHeader("User-Agent", "request");
		post.addRequestHeader("Content-Type", "text/xml");
		String methodCall = buildMethodCall(shareURL);
		RequestEntity entity = new StringRequestEntity(methodCall, "text/xml","utf-8");
		post.setRequestEntity(entity);
		HttpClient httpclient = new HttpClient();
		httpclient.executeMethod(post);
		String ret = post.getResponseBodyAsString();
		post.releaseConnection();
		System.out.println("百度Ping:\n" + ret);
	}


}
