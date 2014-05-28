package com.zcm.utils;

public class TargetUtils {
	
	private static final String[] NO_FILTER = {".css",".js",".png",".gif",".jpg",".ico"};
	
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
	
	/**
	 * URL重写规则处理
	 * @param starget
	 * @return
	 */
	public static String getTarget(String starget){
		if(filter(starget)){
			/**网站首页和后台不过滤**/
			if(starget.equals("/") || starget.equals("") || starget.contains("sysadmin")){
				return starget;
			}else{
				  String[] arr =  null;
				  /**去掉开始的斜杠**/
				  if(starget.startsWith("/")){
					  arr = starget.substring(1, starget.length()).split("/");
				  }else{
					  arr = starget.split("/");
				  }
				  int len = arr.length;
				  if(len==1){
					  String url = arr[0];
					  if(url.equals("search")){
						 starget = "/article/search";
					  }else if(url.equals("rss.xml")){
						 starget = "/article/rss";
					  }else if(url.equals("sitemap")){
						 starget = "/article/sitemap";
					  }else if(url.equals("message")){
						 starget = "/article/message";
					  } else if(url.equals("tags")){
						 starget = "/article/tagList";
					  }else{
						 starget = "/article/articleList/?url=" + url;
					  }
				  }else if(len==2){
					  String arr1 = arr[0];
					  String arr2 = arr[1];
					  if(arr1.equals("page")){
						  starget = "/?page=" + arr2;
					  }else if(arr1.equals("search")){
						  starget = "/article/search/?word=" + arr2;
					  }else{
						  starget = "/article/getarticle/?aid=" + arr2;
					  }
				  }else if(len==3){
					  String arr1 = arr[0];
					  String arr2 = arr[1];
					  String arr3 = arr[2];
					  if(arr1.equals("tags") && arr2.equals("page")){
						  starget = "/article/tagList/?page=" + arr3;
					  }else if(arr1.equals("search") && arr2.equals("page")){
						  starget = "/article/search/?page=" + arr3;
					  }else if(arr2.equals("page")){
						  starget = "/article/articleList/?url=" + arr1 + "&page=" + arr3;
					  }else{
						  starget = "/article/notfound";
					  }
				  }else{
					  starget = "/article/notfound";
				  }
				  return starget;
			}
		}else{
			return starget;
		}
	}

}
