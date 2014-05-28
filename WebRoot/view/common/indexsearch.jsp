<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../../common/taglibs.jsp"%>
<form action="${ctx }/search">
   <span class="search"><input type="text" class="word" name="word" placeholder="搜索：注册码、序列号、激活码、VIP账号、优惠码" value="${word }"/></span>
   <span><input class="searchBtn" type="submit" value="搜 索"/></span>
   <span class="recommend"><b>提示：</b>欢迎访问 <a href="${ctx }/">91注册码(www.91zcm.com)</a></span>
</form>