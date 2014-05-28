// 弹出层
function dialog(){
	if($.browser.msie && $.browser.version=='6.0'){
	   $('select.select_hide').hide();
	}
	var temp_box=new String;
	temp_box+="<div id=\"dialogBg\" style=\"height:"+$(document).height()+"px;\"></div>";
	temp_box+="<div id=\"dialog\">";
	temp_box+="<div id=\"dialog_title\"><h4></h4><small onclick=\"new dialog().close()\">关闭</small></div>";
	temp_box+="<div id=\"dialog_content\"></div>";
	temp_box+="</div>";
	this.init=function(_title,_w,_h){
		if(! $("#dialog").length)$("body").append(temp_box);
		$("#dialogBg").show();
		$("#dialog").show().css({width:_w,left:$(document).width()/2-parseInt(_w)/2,top:$(document).scrollTop()+document.documentElement.clientHeight/2-parseInt(_h)/2-50});
		if(_title.length)$("#dialog_title h4").html(_title);
		$("#dialog_content").css({height:_h});
	}
	this.close=function(){
    	$("#dialogBg").hide();
		$("#dialog").hide();
		if($.browser.msie && $.browser.version=='6.0'){
			   $('select.select_hide').show();
		}
	}
	this.open=function(_url){
		$("#dialog_content").html("<iframe src=\""+_url+"\" width=\"100%\" height=\"100%\" scrolling=\"auto\" frameborder=\"0\" marginheight=\"0\" marginwidth=\"0\"></iframe>");
	}
	this.alert=function(_url){
		$.get(_url,function(data){
			$("#dialog_content").html(data);
		});
	}

}
function openWindow(_url,_title,_w,_h){
	var obj=new dialog();
	obj.init(_title,_w,_h);
	obj.open(_url);
}
function colseWindow(_url,_title,_w,_h){
	var obj=new dialog();
	obj.init(_title,_w,_h);
	obj.close();
}
