<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../common/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml"><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<title>网站地图 - 91注册码(www.91zcm.com)</title>
<meta http-equiv="x-ua-compatible" content="ie=7" />
<link href="${ctx }/favicon.ico" rel="shortcut icon"/>
<style type="text/css">
body {font-family: Verdana;FONT-SIZE: 12px;MARGIN: 0;background: #ffffff;}
li {margin-top: 8px;}
#nav, #bottom, #content, #footer {padding: 8px; border: 1px solid #EEEEEE; clear: both; width: 900px; margin: auto; margin-top: 10px;}
</style>
</head>	
<body vlink="#0034F6" link="#0034F6">
<h2 style="text-align: center; margin-top: 20px">91注册码-网站地图 </h2>
<center></center>
<div id="nav"><a href="${ctx }/" title="91注册码" target="_blank"><strong>91注册码</strong></a>  » <a href="${ctx }/sitemap.html" title="91注册码网站地图">站点地图</a></div>
<div id="content">
    <c:forEach items="${articleList}" var="articlevo">
      <h3>${articlevo.cname }列表(${articlevo.anum })</h3>
      <ul>
        <c:forEach items="${articlevo.list}" var="article">
          <li><a href="${ctx }/${article.curl }/${article.aid }.html" title="${article.title }" target="_blank">${article.title }</a></li>
        </c:forEach>
      </ul>
      &nbsp;&nbsp;<a href="${ctx }/${articlevo.curl }.html" title="${articlevo.cname }">更多>></a>
    </c:forEach>
</div>
<div id="bottom"><a href="${ctx }/" title="91注册码" target="_blank"><strong>91注册码</strong></a>  » <a href="${ctx }/sitemap.html" title="91注册码网站地图">站点地图</a></div>
</body>
</html>