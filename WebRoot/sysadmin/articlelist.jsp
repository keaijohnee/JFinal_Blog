<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../common/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>项目管理系统</title>
<style type="text/css">
<!--
body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
}
.tabfont01 {	
	font-family: "宋体";
	font-size: 9px;
	color: #555555;
	text-decoration: none;
	text-align: center;
}
.font051 {font-family: "宋体";
	font-size: 12px;
	color: #333333;
	text-decoration: none;
	line-height: 20px;
}
.font201 {font-family: "宋体";
	font-size: 12px;
	color: #FF0000;
	text-decoration: none;
}
.button {
	font-family: "宋体";
	font-size: 14px;
	height: 37px;
}
html { overflow-x: auto; overflow-y: auto; border:0;} 
-->
</style>
<link href="${css_ctx }/css.css" rel="stylesheet" type="text/css" />
<link href="${css_ctx }/style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${js_ctx }/jquery-1.5.1.min.js"></script>
<script type="text/javascript">
  function jump(){
    var num = $("#jump").val();
    window.location.href="${sysadmin_ctx}/listfilm/?page="+num;
  }
</script>
</head>
<body>
<table id="mainpage" width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td><table id="subtree1" style="DISPLAY: " width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td><table width="95%" border="0" align="center" cellpadding="0" cellspacing="0">
              <tr>
                <td height="40" class="font42">
                <table width="100%" border="0" cellpadding="4" cellspacing="1" bgcolor="#464646" class="newfont03">
				  <tr>
                    <td height="20" colspan="3" align="center" bgcolor="#EEEEEE" class="tablestyle_title">文章列表[<a href="${sysadmin_ctx }/inputarticle" style="color: #FFFFFF;">添加文章</a>] </td>
                    <td height="20" colspan="2" align="center" bgcolor="#EEEEEE" class="tablestyle_title"><form action="${sysadmin_ctx }/listarticle" method="post"> 文章查询：<input name="word" value="${word }" type="text"/> <input type="submit" value="查询"/></form> </td>
                  </tr>
                  <tr>
                    <td align="center" bgcolor="#EEEEEE">标题</td>
                    <td align="center" bgcolor="#EEEEEE">分类</td>
                    <td align="center" bgcolor="#EEEEEE">点击数</td>
                    <td align="center" bgcolor="#EEEEEE">添加时间</td>
                    <td align="center" bgcolor="#EEEEEE">操作</td>
                  </tr>
                  <c:if test="${empty articleList}">
                  <tr>
                    <td colspan="5" align="center" bgcolor="#FFFFFF">没有查询到数据！</td>
                  </tr>
                  </c:if>
                  <c:forEach items="${articleList}" var="article">
                  <tr align="center">
                    <td align="left" bgcolor="#FFFFFF">${article.title }</td>
                    <td bgcolor="#FFFFFF"><c:forEach items="${categoryList}" var="category"><c:if test="${category.cid eq article.cid}">${category.cname}</c:if></c:forEach></td>
                    <td align="left" bgcolor="#FFFFFF">${article.clicknum }</td>
                    <td bgcolor="#FFFFFF">${article.addtime }</td>
                    <td bgcolor="#FFFFFF"><a href="${sysadmin_ctx }/getarticle?aid=${article.aid }">编辑</a>|<a href="${sysadmin_ctx }/delarticle?aid=${article.aid }">删除</a></td>
                  </tr>
                  </c:forEach>
                  <tr><td colspan="5" style="background-color: white;">
                  <span>共${ pageList.totalRow}条数据 页次:${pageList.pageNumber }/${ pageList.totalPage}页</span>
	  <em class="nolink">首页</em>
	  <c:if test="${pageList.pageNumber eq 1}"><em class="nolink">上一页</em></c:if><c:if test="${pageList.pageNumber ne 1}"><a href="${sysadmin_ctx}/listarticle/?page=${pageList.pageNumber-1 }">上一页</a></c:if>
	  <c:if test="${pageList.pageNumber lt pageList.totalPage}"><a href="${sysadmin_ctx}/listarticle/?page=${pageList.pageNumber+1 }">下一页</a></c:if><c:if test="${pageList.pageNumber eq pageList.totalPage}"><em class="nolink">下一页</em></c:if>
	  <c:if test="${pageList.pageNumber lt pageList.totalPage}"><a href="${sysadmin_ctx}/listarticle/?page=${pageList.pageNumber }">尾页</a></c:if><c:if test="${pageList.pageNumber eq pageList.totalPage}"><em class="nolink">尾页</em></c:if>
	  <span><input type="text" name="page" value="${pageList.pageNumber }" id="jump" size="4"/><input type="button" value="跳转" onclick="jump();" class="btn"/></span>
                  
                  </td></tr>
                </table>
                </td>
              </tr>
            </table></td>
        </tr>
      </table>
     </td>
  </tr>
</table>
<c:if test="${!empty msg }">
<script>
 alert("${msg}");
</script>
<c:remove var="msg"/>
</c:if>
</body>
</html>