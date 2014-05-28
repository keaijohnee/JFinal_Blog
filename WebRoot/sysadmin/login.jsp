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
-->
</style>
<script language="javascript">
	function changeVerify(){
		document.getElementById("verifyImg").src = "${common_ctx }/image.jsp?"+Math.random();
	}
	function login(obj){
	   if (obj.username.value==""){alert('你还没有输入登陆账号！');obj.username.focus();return false;} 
	   if (obj.password.value==""){alert('你还没有输入登陆密码！');obj.password.focus();return false;} 
	   if (obj.code.value==""){alert('你还没有输入登陆验证码！');obj.code.focus();return false;} 
	   obj.submit();
	}
  </script>
<link href="${css_ctx }/css.css" rel="stylesheet" type="text/css" />
</head>
<body>
<form action="${sysadmin_ctx }/login" method="post" id="loginForm">
<table width="562" border="0" align="center" cellpadding="0" cellspacing="0" class="right-table03" style="margin-top:100px">
  <tr>
    <td width="221"><table width="95%" border="0" cellpadding="0" cellspacing="0" class="login-text01">
      
      <tr>
        <td><table width="100%" border="0" cellpadding="0" cellspacing="0" class="login-text01">
          <tr>
            <td align="center"><img src="${images_ctx }/ico13.gif" width="107" height="97" /></td>
          </tr>
          <tr>
            <td height="40" align="center">&nbsp;</td>
          </tr>
        </table></td>
        <td><img src="${images_ctx }/line01.gif" width="5" height="292" /></td>
      </tr>
    </table></td>
    <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="31%" height="35" class="login-text02">用户名：<br /></td>
        <td width="69%"><input id="username" name="username" type="text" size="20" /></td>
      </tr>
      <tr>
        <td height="35" class="login-text02">密　码：<br /></td>
        <td><input id="password" name="password" type="password" size="20" /></td>
      </tr>
      <tr>
        <td height="35" class="login-text02">验证码：<br /></td>
        <td style="vertical-align:middle;"><input id="code" name="verifyimg" type="text" size="6" /><img id="verifyImg" align="absmiddle" src="${common_ctx }/image.jsp" onclick="changeVerify()" width="50" height="20" /> <a href="#" onclick="changeVerify()" class="login-text03">点击换一个</a></td>
      </tr>
      <tr>
        <td height="35">&nbsp;</td>
        <td>
          <input name="Submit2" type="button" onmousedown="return login(loginForm);" class="right-button01" value="确认登陆" style="cursor: pointer;"/>
          <input name="Submit232" type="reset" class="right-button02" value="重 置" /></td>
      </tr>
    </table></td>
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