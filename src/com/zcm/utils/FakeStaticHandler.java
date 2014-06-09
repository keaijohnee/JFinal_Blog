package com.zcm.utils;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jfinal.handler.Handler;

public class FakeStaticHandler extends Handler {

	private static final String[] NO_FILTER = {"index.html","index.jsp"};
	
	public void handle(String target, HttpServletRequest request,HttpServletResponse response, boolean[] isHandled) {
		String newTarget =	target;
		if(filter(target)){
			/**去掉.html后缀**/
			int index = target.lastIndexOf(".html");
		    if (index != -1) {
		       target = target.substring(0, index);
		    }
		    /**URL重写规则方法**/
			newTarget =	TargetUtils.getTarget(target);
			/**整理参数放入request中**/
			if(newTarget.contains("?")){
				String[] params = newTarget.substring(newTarget.indexOf("?")+1, newTarget.length()).split("&");
				for(String strs:params){
					String[] sarr = strs.split("=");
					if(null!=sarr && sarr.length==2){
						request.setAttribute(sarr[0], sarr[1]);
					}
				}
			}
		}
		nextHandler.handle(newTarget, request, response, isHandled);
	}
	
	/**
	 * 判断URL是否需要过滤
	 * @param starget
	 * @return
	 */
	private static boolean filter(String starget){
		boolean filter = true;
		for(String str:NO_FILTER){
			if(starget.endsWith(str)){
				filter = false;
				break;
			}
		}
		return filter;
	}
}