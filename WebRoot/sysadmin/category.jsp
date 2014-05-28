<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../common/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
		<title>项目管理系统</title>
		<link rel="stylesheet" href="${css_ctx }/style.css" type="text/css" />
		<script language="javascript" type="text/javascript" src="${js_ctx }/jquery-1.8.2.min.js"></script>
		<script type="text/javascript">
		   function checkCategory(type){
		     var cid = $("#cid").val();
		     if(cid==""){cid="0";}
		     var value = $("#"+type).val();
		     if(value!=""){
		        $.ajax({
				   type: "POST",
				   url: "${sysadmin_ctx}/checkCategory",
				   data: "type="+type+"&value="+value+"&cid="+cid,
				   success: function(msg){
				     var state = msg.state;
				     if(state=="true"){
				        $("#cansubmit").val("1");
				        $("#"+type+"msg").css("color","green");
				        $("#submit").show();
				     }else{
				       $("#cansubmit").val("0");
				       $("#"+type+"msg").css("color","red");
				       $("#submit").hide();
				     }
				     $("#"+type+"msg").html(msg.msg);
				   }
				 });
		     }
		   }
		</script>
<style type="text/css">
<!--
.atten {
	font-size: 12px;
	font-weight: normal;
	color: #F00;
}
-->
</style>
	</head>
	<body class="ContentBody">
		<form action="${sysadmin_ctx }/updatecategory" method="post" name="form" id="form">
		    <input name="cansubmit" id="cansubmit" value="0" type="hidden" />
		    <input name="cid" id="cid" value="${category.cid }" type="hidden" />
			<div class="MainDiv">
				<table width="99%" border="0" cellpadding="0" cellspacing="0" class="CContent" style="height: 500px">
					<tr>
						<th class="tablestyle_title">
							分类编辑
						</th>
					</tr>
					<tr>
						<td class="CPanel" valign="top">
							<table border="0" cellpadding="0" cellspacing="0"
								style="width: 700px">
								<tr>
									<td width="100%">
										<fieldset style="height: 100%;">
											<legend>
												分类编辑
											</legend>
											<table border="0" cellpadding="2" cellspacing="1"
												style="width: 100%">
												<tr>
													<td align="right" width="13%">
														分类名称:
													</td>
													<td width="41%">
														<input id="cname" name="cname" value="${category.cname }" onmouseout="checkCategory('cname');" class="text" style="width: 150px;" type="text" size="40" />
														<span style="color: red;"> *</span><span style="color: red;" id="cnamemsg"></span>
													</td>
												</tr>
												<tr>
													<td align="right">
														分类URL:
													</td>
													<td>
														<input type="text" id="url" name="url" value="${category.url }" onmouseout="checkCategory('url');" class="text" style="width: 150px" />
														<span style="color: red;"> *</span><span style="color: red;" id="urlmsg"></span>
													</td>
												</tr>
												<tr>
													<td align="right">
														分类标题:
													</td>
													<td>
														<input type="text" name="title" value="${category.title }"  id="title" class="text" style="width: 300px" />
													</td>
												</tr>
												<tr>
													<td align="right">
														分类关键词:
													</td>
													<td>
														<input type="text" name="keywords" value="${category.keywords }"  id="keywords" class="text" style="width: 300px" />
													</td>
												</tr>
												<tr>
													<td align="right">
														分类描述:
													</td>
													<td>
														<input type="text" id="description" name="description" value="${category.description}"  class="text" style="width:400px" />
													</td>
												</tr>
												<tr>
													<td align="center" height="50px">
														<input type="submit" id="submit" name="submit" value="保存" class="button"/>
												    </td>
												    <td>
												        <input type="reset" name="reset" value="重置" class="button" />
													</td>
												</tr>
											</table>
											<br />
										</fieldset>
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
