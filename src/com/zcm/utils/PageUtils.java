package com.zcm.utils;

import java.util.ArrayList;
import java.util.List;

/**
 * PageUtils
 * @author jiang.li
 */
public class PageUtils {
	
	/**最多显示的数字数目**/
	private static final int PAGE_NUM = 5;
	
	/**
	 * 对分页显示数据的处理
	 * @param pageNumber
	 * @param totalPage
	 * @return
	 */
	public static List<Integer> getPages(int pageNumber,int totalPage){
		List<Integer> pageList = new ArrayList<Integer>();
		/**1、当总页数小于 PAGE_NUM 时 **/
		if(totalPage <= PAGE_NUM){
			for(int num=1;num<=totalPage;num++){
				pageList.add(num);
			}
		}else if(totalPage > PAGE_NUM){
			if(pageNumber > 2 && (totalPage-pageNumber)>=2){
				pageList.add(pageNumber-2);
				pageList.add(pageNumber-1);
				pageList.add(pageNumber);
				pageList.add(pageNumber+1);
				pageList.add(pageNumber+2);
			}else if(pageNumber <= 2){
				for(int num = 1; num <= pageNumber; num++){
					pageList.add(num);
				}
				pageList.add(pageNumber+1);
				pageList.add(pageNumber+2);
			}else if((totalPage-pageNumber)<=2){
				pageList.add(pageNumber-2);
				pageList.add(pageNumber-1);
				for(int num = pageNumber; num <= totalPage; num++){
					pageList.add(num);
				}
			}
		}
		return pageList;
	}


}
