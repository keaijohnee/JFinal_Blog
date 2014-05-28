<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../common/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
		<title>项目管理系统</title>
		<link rel="stylesheet" href="${css_ctx }/style.css" type="text/css" />
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
		<form action="${sysadmin_ctx }/updateadmin" method="post" name="form" id="form">
		    <input name="id" value="${admin.id }" type="hidden" />
			<div class="MainDiv">
				<table width="99%" border="0" cellpadding="0" cellspacing="0" class="CContent" style="height: 500px">
					<tr>
						<th class="tablestyle_title">
							密码修改
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
												密码修改
											</legend>
											<table border="0" cellpadding="2" cellspacing="1"
												style="width: 100%">
												<tr>
													<td align="right" width="13%">
														用户名:
													</td>
													<td width="41%">
														<input name="username" value="${admin.username }" class="text" style="width: 150px; background-color: DFDFDF" readonly="readonly" type="text" size="40" />
														<span style="color: red;"> *</span>
													</td>
												</tr>
												<tr>
													<td align="right">
														密码:
													</td>
													<td>
														<input type="text" name="password" id="password" class="text" style="width: 150px" />
														<span style="color: red;">不修改则留空</span>
													</td>
												</tr>
												<tr>
													<td align="center" height="50px">
														<input type="submit" name="submit" value="保存" class="button"/>
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
