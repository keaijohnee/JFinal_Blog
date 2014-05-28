<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../common/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
		<title>项目管理系统</title>
		<link rel="stylesheet" href="${css_ctx }/style.css" type="text/css" />
		<link rel="stylesheet" type="text/css" href="${css_ctx }/dialog.css" />
		<script type="text/javascript" src="${js_ctx }/jquery-1.5.1.min.js"></script>
		<script charset="utf-8" src="${js_ctx }/common.js"></script>
		<style type="text/css">
<!--
.atten {
	font-size: 12px;
	font-weight: normal;
	color: #F00;
}
-->
</style>
<script charset="utf-8" src="${editor_ctx }/kindeditor.js"></script>
<script charset="utf-8" src="${editor_ctx }/lang/zh_CN.js"></script>
<script>
        KindEditor.ready(function(K) {
                window.editor = K.create('#editor_id');
        });
        
</script>
 <script type="text/javascript" src="${datepicker_ctx }/WdatePicker.js"></script> 
	</head>
	<body class="ContentBody">
		<form action="${sysadmin_ctx }/updatearticle" method="post" name="form" id="form">
		    <input name="aid" value="${article.aid }" type="hidden" />
			<div class="MainDiv">
				<table width="99%" border="0" cellpadding="0" cellspacing="0" class="CContent" style="height: 500px">
					<tr>
						<th class="tablestyle_title">
							文章编辑
						</th>
					</tr>
					<tr>
						<td class="CPanel" valign="top">
							<table border="0" cellpadding="0" cellspacing="0" style="width: 100%">
								<tr>
									<td width="100%">
											<table border="0" cellpadding="2" cellspacing="1" style="width: 100%">
											    <tr>
													<td align="right" width="13%"></td>
													<td width="41%">
														<input name="imgurl" id="pic" value="<c:if test="${empty article.imgurl }">${images_ctx}/nopic.gif</c:if><c:if test="${!empty article.imgurl }">${article.imgurl}</c:if>" readonly="readonly" class="text" style="width: 250px;background-color: DFDFDF;" type="hidden" size="50" />
													</td>
													<td rowspan="6">
													    <img width="90px" height="90px" id="fileName" style="border: 1px solid #ECE9D8;" src="<c:if test="${empty article.imgurl }">${images_ctx}/nopic.gif</c:if><c:if test="${!empty article.imgurl }">${article.imgurl}</c:if>"/>
														<input type="button" onclick="openWindow('${sysadmin_ctx}/image','照片上传','600px','350px');" value="上传照片"/>
													</td>
												</tr>
												<tr>
													<td align="right" width="13%">文章标题:</td>
													<td width="41%"><input id="title" name="title" value="${article.title }" class="text" style="width: 400px;" type="text" size="50" /><span style="color: red;"> *</span></td>
												</tr>
												<tr>
													<td align="right" width="13%">文章类型:</td>
													<td width="41%">
													  <input type="radio"  value="0" <c:if test="${ empty article.type}">checked="checked"</c:if><c:if test="${ article.type eq '0'}">checked="checked"</c:if> name="type"/>普通
													  <input type="radio" value="1" <c:if test="${ article.type eq '1'}">checked="checked"</c:if> name="type"/>精华
													  <input type="radio" value="2" <c:if test="${ article.type eq '2'}">checked="checked"</c:if> name="type"/>亲测
													  <span style="color: red;"> *</span>
													</td>
												</tr>
												<tr>
													<td align="right" width="13%">文章分类:</td>
													<td width="41%">
													  <select name="cid" style="width: 100px">
													  <c:forEach items="${categoryList}" var="category">
													   <option value="${category.cid }" <c:if test="${category.cid eq article.cid}">selected="selected"</c:if>>${category.cname }</option> 
													  </c:forEach>
													  </select>
													</td>
												</tr>
												<tr>
													<td align="right" width="13%">添加时间:</td>
													<td width="41%" colspan="2"><input name="addtime" onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})" value="${addtime }" class="text" style="width: 200px;" type="text" size="50" /></td>
												</tr>
												<tr>
													<td align="right" width="13%">文章摘要:</td>
													<td width="41%" colspan="2"><textarea style="width: 400px;height: 50px;" name="remark" >${article.remark}</textarea></td>
												</tr>
												<tr>
													<td align="right" width="13%">文章内容:</td>
													<td width="41%" colspan="2"><textarea style="width: 650px;height: 220px;" id="editor_id" name="content" >${article.content}</textarea></td>
												</tr>
												<tr>
													<td align="right" width="13%">文章标签:</td>
													<td width="41%" colspan="2">
													<input id="tags" name="tags" value="${tags }" class="text" style="width: 400px;" type="text" size="50" />
													</td>
												</tr>
												<tr>
													<td align="center" height="50px"><input type="submit" name="submit" value="保存" class="button"/> </td>
												    <td colspan="2" colspan="2">  <input type="reset" name="reset" value="重置" class="button" /></td>
												</tr>
											</table>
									</td>
								</tr>
							</table>
						</td>
					</tr>
				</table>
			</div>
		</form>
<c:if test="${!empty msg }">
<script>
 alert("${msg}");
</script>
<c:remove var="msg"/>
</c:if>
	</body>
</html>
