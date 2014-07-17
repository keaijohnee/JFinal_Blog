<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../common/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<meta http-equiv="x-ua-compatible" content="ie=7" />
<link href="${ctx }/favicon.ico" rel="shortcut icon"/>
<title>${article.title } - 91注册码</title>
<meta name="keywords" content="<c:forEach items="${tagsList}" var="tags">${tags.tname },</c:forEach>91注册码"/>
<meta name="description" content="${article.remark }"/>
<link href="${css_ctx }/91zcm.css" rel="stylesheet"/> 
<script type="text/javascript" src="${js_ctx }/jquery-1.5.1.min.js"></script>
<script language="javascript">
	function changeVerify(){
		document.getElementById("verifyImg").src = "${common_ctx }/image.jsp?"+Math.random();
	}
	function message(){
	    var nickname = $("#nickname").val();if(nickname==""){ alert("昵称输入为空"); return; }
	    var email = $("#email").val();if(email==""){ alert("邮箱输入为空"); return; }
	    var code = $("#code").val();if(code==""){ alert("验证码输入为空"); return; }
	    var content = $("#msgcontent").val(); if(msgcontent==""){ alert("内容输入为空"); return; } 
	    $.ajax({
	      type: "POST",
	      url: "${ctx}/message.html", 
	      data: "nickname="+nickname+"&content="+content+"&email="+email+"&aid=${article.aid}&verifyimg="+code, 
	      success: function(data){ alert(data);}
	    });
		$("#msgcontent").val("");
		$("#code").val("");
	}
</script>
</head>
<body>
  <table id="container"=>
    <tr id="header">
     <jsp:include page="common/share.jsp"/>
	 <td colspan="2">
	    <table class="top">
		 <tr class="menu">
		   <td>
		     <table class="nav">
			  <tr>
			   <th class="logoth"><h2><a href="${ctx }/">91注册码</a></h2></th>
			   <c:forEach items="${menuList}" var="menu">
			     <c:if test="${menu.cid eq showCid}"><td><h3>${menu.cname }</h3></td></c:if>
			     <c:if test="${menu.cid ne showCid}"><td><h3><a href="${ctx }/${menu.url }.html" title="${menu.cname }" target="_self">${menu.cname }</a></h3></td></c:if>
			   </c:forEach>
			  </tr>
			 </table>
		   </td>
		 </tr>
		 <tr><td><jsp:include page="common/articlesearch.jsp"/></td></tr>
		</table>
	 </td>
	</tr>
	<tr id="content">
	 <td id="left">
	   <table class="detailContent">
			 <tr class="trdetail">
			   <td class="detail_title"><h1 class="h1class"><a href="${ctx }/${article.curl }/${article.aid }.html">${article.title }</a><c:if test="${article.type eq '1'}"><span class="essence">精华</span></c:if><c:if test="${article.type eq '2'}"><span class="original">亲测</span></c:if></h1></td>
			 </tr>
			 <tr class="detailspread">
			  <td height="25px">
			   <div class="official">
			    <span>分类: <a href="${ctx }">首页</a>- &gt;<a href="${ctx }/${article.curl}.html">${article.cname }</a> | 阅读: ${article.clicknum} | 评论:  ${gbookSize } | ${article.addtime}</span>&nbsp;
			   </div>
			  </td>
			 </tr>
			 <tr><td class="detailinfo"><strong>摘要：</strong>${article.remark }</td></tr>
			 <tr>
			   <td class="detail" style="font-size: 13px;">
			   <div style="width: 250px;height: 250px;text-align: left;clear: left;float: left;margin: 0 20px 10px 0;">
			    <script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
					<!-- 91zcm_article_001 -->
					<ins class="adsbygoogle"
					     style="display:inline-block;width:250px;height:250px"
					     data-ad-client="ca-pub-3712320065678109"
					     data-ad-slot="7962713969"></ins>
					<script>
					(adsbygoogle = window.adsbygoogle || []).push({});
			    </script>
			   </div>${article.content }</td>
			 </tr>
			 <tr>
			   <td>
			     <div class="page_ad">
				    <script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
						<!-- 91zcm_article_bottom_001 -->
						<ins class="adsbygoogle"
						     style="display:inline-block;width:600px;height:50px"
						     data-ad-client="ca-pub-3712320065678109"
						     data-ad-slot="1283725160"></ins>
						<script>
						(adsbygoogle = window.adsbygoogle || []).push({});
					</script>
				 </div>
			     <span>&nbsp;声明：91zcm.com 博客文章版权属于作者，受法律保护。未经作者同意不得转载。 </span>
			     <table cellpadding="0" class="relative">
					 <tr>
						  <th class="relative">标签</th>
						  <c:forEach items="${tagsList}" var="tags" varStatus="t">
						  <th class="tag"><a href="${ctx }/search?word=${tags.tname }" title="搜索 : ${tags.tname }" target="_blank">${tags.tname }</a></th><td class="t"></td>
						  </c:forEach>
					 </tr>
				 </table>
			   </td>
			 </tr>
	   </table>
	   <div class="clear"></div>
	   <table class="detailRlist">
	      <tr>
			  <td><h3>共有 <font color="#40AA53">${gbookSize }</font> 条网友评论</h3></td>
		  </tr>
		  <c:forEach items="${gbookList}" var="gbook" varStatus="g">
		  <tr>
		      <td>
			     <table class="ostable">
				   <tr>
					<td class="body">
						<div class="title">${g.index+1 } 楼：<a href="mailto:${gbook.email }" rel="nofollow" target="_blank">${gbook.nickname }</a> 发表于${gbook.addtime }</div>
						<div class="post">${gbook.content }</div>
						<c:if test="${!empty gbook.reply}"><div class="reply">管理回复:${gbook.reply }</div></c:if>
					</td>
				   </tr>
				 </table>
			  </td>
		  </tr>
		  </c:forEach>
		  <c:if test="${empty gbookList}">
		  <tr>
		      <td>
			     <table class="ostable">
				   <tr>
					<td class="body">
						还木有留言,还不抢沙发?
					</td>
				   </tr>
				 </table>
			  </td>
		  </tr>
		  </c:if>
	   </table>
	   <div class="clear"></div>
	   <table class="detailInput">
	      <tr><td><h3>发布评论：</h3></td></tr>
	      <tr>
			 <td>
               <div>
                                       昵称：<input type="text" name="nicknme" id="nickname" style="width: 90px"/>	 
                                       邮箱：<input type="text" name="email" id="email" style="width: 180px"/>	 
                                       验证码：<input type="text" id="code" name="verifyimg" style="width: 50px"/> <img id="verifyImg" align="absmiddle" title="点击刷新" src="${common_ctx }/image.jsp" onclick="changeVerify()" style="width: 50px;height: 19px;cursor: pointer;" />
               </div>
               <div><textarea style="width:550px;height:100px;font-size: 13px;"  name="content" id="msgcontent"></textarea></div>
	           <div><input type="button" class="submit" onclick="return message(messageForm);" class="comment" value="发表评论"/> <span id="cmt_tip">文明上网，理性发言！</span></div>
			 </td>
	      </tr>
	   </table>
	 </td>
	 <jsp:include page="common/articleright.jsp"/>
	</tr>
	<jsp:include page="common/footer.jsp"/>
  </table>
  <jsp:include page="common/ad250.jsp"/>
</body>
</html>
