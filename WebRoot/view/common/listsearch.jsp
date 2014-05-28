<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../../common/taglibs.jsp"%>
<form action="${ctx }/search">
   <span class="search"><input type="text" class="word" placeholder="搜索：${category.cname }" name="word" value="${word }"/></span>
   <span><input class="searchBtn" type="submit" value="搜 索"/></span>
   <span class="recommend"><b>导航：</b><span><a href="${ctx }/">首页(91注册码)</a> -&gt; <a href="${ctx }/${category.url}.html">${category.cname }</a></span></span>
</form>