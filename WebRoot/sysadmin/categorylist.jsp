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
</head>
<body>
<form name="fom" id="fom" method="post" action="">
<table id="mainpage" width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td><table id="subtree1" style="DISPLAY: " width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td><table width="95%" border="0" align="center" cellpadding="0" cellspacing="0">
              <tr>
                <td height="40" class="font42">
                <table width="100%" border="0" cellpadding="4" cellspacing="1" bgcolor="#464646" class="newfont03">
				  <tr>
                    <td height="20" colspan="3" align="center" bgcolor="#EEEEEE" class="tablestyle_title">分类列表[<a href="${sysadmin_ctx }/inputcategory" style="color: #FFFFFF;">添加分类</a>]</td>
                  </tr>
                  <tr>
                    <td width="40%" align="center" bgcolor="#EEEEEE">名称</td>
                    <td width="40%" align="center" bgcolor="#EEEEEE">地址</td>
                    <td width="20%" align="center" bgcolor="#EEEEEE">操作</td>
                  </tr>
                  <c:if test="${empty categoryList}">
                   <tr align="center">
                    <td bgcolor="#FFFFFF" colspan="3">没有找到相关分类！</td>
                  </tr>
                  </c:if>
                  <c:forEach items="${categoryList}" var="category">
                  <tr align="center">
                    <td bgcolor="#FFFFFF" align="left">${category.cname }</td>
                    <td bgcolor="#FFFFFF" align="left">${category.url }</td>
                    <td bgcolor="#FFFFFF"><a href="${sysadmin_ctx }/getcategory?cid=${category.cid }">编辑</a>|<a href="${sysadmin_ctx }/delcategory?cid=${category.cid }">删除</a></td>
                  </tr>
                  </c:forEach>
                </table>
                </td>
              </tr>
            </table></td>
        </tr>
      </table>
     </td>
  </tr>
</table>
</form>
<c:if test="${!empty msg }">
<script>
 alert("${msg}");
</script>
<c:remove var="msg"/>
</c:if>
</body>
</html>