<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../../common/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
		<title>上传和预览</title>
		<script type="text/javascript" src="${js_ctx }/jquery-1.5.1.min.js"></script>
		<script src="${js_ctx }/jquery.Jcrop.js" type="text/javascript"></script>
		<link rel="stylesheet" href="${css_ctx }/jquery.Jcrop.css" type="text/css" />	
		<style type="text/css">
		<!--
		img{border:0}
		#show{background:url(${ctx}/upload/temp/${fileName})}
		-->
		</style>	
		<script type="text/javascript">
			jQuery(function($){
				$('#target').Jcrop({
					onChange:   showCoords,
					onSelect:   showCoords,
					onRelease:  clearCoords,
					minSize: [90, 90],
					setSelect: [0, 0, 90, 90] 
				});	
			});  	
			function showCoords(c){
				$('#txtX1').val(c.x);
				$('#txtY1').val(c.y);
				$('#txtX2').val(c.x2);
				$('#txtY2').val(c.y2);
				$('#txtW').val(c.w);
				$('#txtH').val(c.h);   
				$('#show').css({"backgroundPosition":"-"+c.x+"px -"+c.y+"px","width":c.w,"height":c.h}); 
			};
			
			function clearCoords(){
				$('#coords input').val('');
				$('#h').css({color:'red'});
				window.setTimeout(function(){
					$('#h').css({color:'inherit'});
				},500);
			};
		</script>
	</head>
	<body>
	 <form action="${sysadmin_ctx }/cut" method="post">
	    <input type="hidden" name="x" id="txtX1" />
		<input type="hidden" name="y" id="txtY1" />
		<input type="hidden" id="txtX2" />
		<input type="hidden" id="txtY2" />
		<input type="hidden" name="width" id="txtW" />
		<input type="hidden" name="height" id="txtH" />
		<input type="hidden" name="fileName" value="${fileName}" />
		<table width="550px">
         <tr>
          <td width="100px">&nbsp;</td>
          <td width="300px"><img src="${ctx }/upload/temp/${fileName}" id="target" /></td>
          <td width="110px"><div id="show"></div></td>
          <td valign="bottom"><input type="submit" value="确定"/></td>
         </tr>
        </table>
     </form>
	</body>
</html>