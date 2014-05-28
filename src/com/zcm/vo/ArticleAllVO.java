package com.zcm.vo;

import java.util.List;

public class ArticleAllVO {
	
	private String cname;       //分类名称
	private long anum;          //分类总文章数
    private String curl;        //分类URL
    private List<ArticleVO> list;  //分类下的文章
    
	public String getCname() {
		return cname;
	}
	public void setCname(String cname) {
		this.cname = cname;
	}
	public long getAnum() {
		return anum;
	}
	public void setAnum(long anum) {
		this.anum = anum;
	}
	public String getCurl() {
		return curl;
	}
	public void setCurl(String curl) {
		this.curl = curl;
	}
	public List<ArticleVO> getList() {
		return list;
	}
	public void setList(List<ArticleVO> list) {
		this.list = list;
	}
    
    
    
}
