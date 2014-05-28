<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../../common/taglibs.jsp"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>后台管理系统</title>
<style type="text/css">
<!--
body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
	background-image: url(${images_ctx }/left.gif);
}
-->
</style>
<link href="${css_ctx }/css.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${js_ctx }/jquery-1.5.1.min.js"></script>
</head>
<script language="javascript">
function clearCache(){
   $.ajax({
	   type: "POST",
	   url: "${sysadmin_ctx}/clearCache",
	   success: function(msg){
	    alert(msg);
	   }
	 });
}
function createHTML(){
   $.ajax({
	   type: "POST",
	   url: "${sysadmin_ctx }/createhtml",
	   success: function(msg){
	    alert(msg);
	   }
	 });
}

function tupian(idt){
    var nametu="xiaotu"+idt;
    var tp = document.getElementById(nametu);
    tp.src="${images_ctx }/ico05.gif";//图片ico04为白色的正方形
	for(var i=1;i<30;i++){
	  var nametu2="xiaotu"+i;
	  if(i!=idt*1)
	  {
	    var tp2=document.getElementById('xiaotu'+i);
		if(tp2!=undefined)
	    {tp2.src="${images_ctx }/ico06.gif";}//图片ico06为蓝色的正方形
	  }
	}
}

function list(idstr){
	var name1="subtree"+idstr;
	var name2="img"+idstr;
	var objectobj=document.all(name1);
	var imgobj=document.all(name2);
	
	if(objectobj.style.display=="none"){
		for(i=1;i<10;i++){
			var name3="img"+i;
			var name="subtree"+i;
			var o=document.all(name);
			if(o!=undefined){
				o.style.display="none";
				var image=document.all(name3);
				image.src="${images_ctx }/ico04.gif";
			}
		}
		objectobj.style.display="";
		imgobj.src="${images_ctx }/ico03.gif";
	}
	else{
		objectobj.style.display="none";
		imgobj.src="${images_ctx }/ico04.gif";
	}
}
</script>
<body>
<table width="198" border="0" cellpadding="0" cellspacing="0" class="left-table01">
  <tr>
    <td>
		<table width="100%" border="0" cellpadding="0" cellspacing="0">
		  <tr>
			<td width="207" height="55" background="${images_ctx }/nav01.gif">
				<table width="90%" border="0" align="center" cellpadding="0" cellspacing="0">
				  <tr>
					<td width="25%" rowspan="2"><img src="${images_ctx }/ico02.gif" width="35" height="35" /></td>
					<td width="75%" height="22" class="left-font01">您好，<span class="left-font02">${sysadmin.username }</span></td>
				  </tr>
				  <tr>
					<td height="22" class="left-font01">
						[&nbsp;<a href="${sysadmin_ctx }/logout" target="_top" class="left-font01">退出</a>&nbsp;]</td>
				  </tr>
				</table>
			</td>
		  </tr>
		</table>
		<!--  任务系统开始    -->
		<table width="100%" border="0" cellpadding="0" cellspacing="0" class="left-table03">
          <tr>
            <td height="29">
				<table width="85%" border="0" align="center" cellpadding="0" cellspacing="0">
					<tr>
						<td width="8%"><img name="img8" id="img8" src="${images_ctx }/ico04.gif" width="8" height="11" /></td>
						<td width="92%"><a href="javascript:" target="mainFrame" class="left-font03" onClick="list('8');" >系统管理</a></td>
					</tr>
				</table>
			</td>
          </tr>		  
        </table>
		<table id="subtree8" style="DISPLAY: none" width="80%" border="0" align="center" cellpadding="0" cellspacing="0" class="left-table02">
				<tr>
				  <td width="9%" height="20" ><img id="xiaotu20" src="${images_ctx }/ico06.gif" width="8" height="12" /></td>
				  <td width="91%"><a href="${sysadmin_ctx }/getadmin" target="mainFrame" class="left-font03" onClick="tupian('20');">密码修改</a></td>
				</tr>
				<tr>
				  <td width="9%" height="20" ><img id="xiaotu18" src="${images_ctx }/ico06.gif" width="8" height="12" /></td>
				  <td width="91%"><a href="${sysadmin_ctx }/listcategory" target="mainFrame" class="left-font03" onClick="tupian('18');">分类管理</a></td>
				</tr>
				<tr>
				  <td width="9%" height="20" ><img id="xiaotu17" src="${images_ctx }/ico06.gif" width="8" height="12" /></td>
				  <td width="91%"><a href="${sysadmin_ctx }/listwebsite" target="mainFrame" class="left-font03" onClick="tupian('17');">网站配置</a></td>
				</tr>
				<tr>
				  <td width="9%" height="20" ><img id="xiaotu16" src="${images_ctx }/ico06.gif" width="8" height="12" /></td>
				  <td width="91%"><a href="${sysadmin_ctx }/listlinks" target="mainFrame" class="left-font03" onClick="tupian('16');">友情链接</a></td>
				</tr>
        </table>
		<!--  任务系统结束    -->
		<!--  消息系统结束    -->
        <table width="100%" border="0" cellpadding="0" cellspacing="0" class="left-table03">
          <tr>
            <td height="29">
				<table width="85%" border="0" align="center" cellpadding="0" cellspacing="0">
					<tr>
						<td width="8%"><img name="img1" id="img1" src="${images_ctx }/ico04.gif" width="8" height="11" /></td>
						<td width="92%"><a href="javascript:" target="mainFrame" class="left-font03" onClick="list('1');" >文章管理</a></td>
					</tr>
				</table>
			</td>
          </tr>		  
        </table>
		<table id="subtree1" style="DISPLAY: none" width="80%" border="0" align="center" cellpadding="0" cellspacing="0" class="left-table02">
				<tr>
				  <td width="9%" height="20" ><img id="xiaotu1" src="${images_ctx }/ico06.gif" width="8" height="12" /></td>
				  <td width="91%"><a href="${sysadmin_ctx }/inputarticle" target="mainFrame" class="left-font03" onClick="tupian('1');">添加文章</a></td>
				</tr>
				<tr>
				  <td width="9%" height="20" ><img id="xiaotu2" src="${images_ctx }/ico06.gif" width="8" height="12" /></td>
				  <td width="91%"><a href="${sysadmin_ctx }/listarticle" target="mainFrame" class="left-font03" onClick="tupian('2');">文章管理</a></td>
				</tr>
				<tr>
				  <td width="9%" height="20" ><img id="xiaotu3" src="${images_ctx }/ico06.gif" width="8" height="12" /></td>
				  <td width="91%"><a href="${sysadmin_ctx }/listgbook" target="mainFrame" class="left-font03" onClick="tupian('3');">评论管理</a></td>
				</tr>
        </table>
		<!--  项目系统结束    -->
	  </td>
  </tr>
</table>
</body>
</html>
