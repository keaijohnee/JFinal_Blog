<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../../common/taglibs.jsp"%>
<div id="gotopbtn"><img src="${images_ctx }/gotop.gif" width="30px" height="30px" title="回到顶部&uarr;"/></div>  
<script type="text/javascript">  
  idTest=document.getElementById('gotopbtn');  
  idTest.onclick=function (){  
      document.documentElement.scrollTop=0;  
      sb();  
  }  
  window.onscroll=sb;  
  function sb(){  
      if(document.documentElement.scrollTop==0){  
          idTest.style.display="none";  
      }else{  
          idTest.style.display="block";  
      }  
  }  
</script>
