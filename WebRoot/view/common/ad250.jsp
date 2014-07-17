<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../../common/taglibs.jsp"%>
<style>
<!--
.float_layer { width: 270px; border: 1px solid #aaaaaa; display:none; }
.float_layer h2 { height: 25px; line-height: 25px; padding-left: 10px; font-size: 12px;font-weight: normal;  color: #333; border-bottom: 1px solid #aaaaaa; position: relative; }
.float_layer .min { width: 21px; height: 20px; background: url(data:image/gif;base64,R0lGODlhFQAoAMQAAAAAAP///+zs7Ovr6+rq6unp6ejo6Ofn5+bm5uXl5eTk5OPj4+Li4uHh4d/f397e3t3d3dvb27y8vLm5ube3t7W1tbKysqenp6SkpKKioqCgoJaWlpWVlZSUlHx8fP///yH5BAEAAB8ALAAAAAAVACgAAAXFICWOZGlSQqqu7Cq2cPvGtDDX8I2z+q72PhtqhfEYj8aNa6gqIo/KHyVBpWaeR041IdomJJewOFzZihDotHqtPrPfa9FhTq/b6yKDfs/v80UFgYKDhIMiBIiJiouKIgOPkJGSkSeVJ36YmXebnHCen6BqCqOkpaanqKmnC6ytrq+wDLKztLW2thpYRh21Db6/ubodv74OxsfBWB3HzMwTGNDR0BbND9bX2Nna29zaEN/g4eLj5OXjEejp6uvs7e7v8PHy7CEAOw==) no-repeat 0 bottom; position: absolute; top: 2px; right: 25px; }
.float_layer .min:hover { background: url(data:image/gif;base64,R0lGODlhFQAoAMQAAAAAAP///+zs7Ovr6+rq6unp6ejo6Ofn5+bm5uXl5eTk5OPj4+Li4uHh4d/f397e3t3d3dvb27y8vLm5ube3t7W1tbKysqenp6SkpKKioqCgoJaWlpWVlZSUlHx8fP///yH5BAEAAB8ALAAAAAAVACgAAAXFICWOZGlSQqqu7Cq2cPvGtDDX8I2z+q72PhtqhfEYj8aNa6gqIo/KHyVBpWaeR041IdomJJewOFzZihDotHqtPrPfa9FhTq/b6yKDfs/v80UFgYKDhIMiBIiJiouKIgOPkJGSkSeVJ36YmXebnHCen6BqCqOkpaanqKmnC6ytrq+wDLKztLW2thpYRh21Db6/ubodv74OxsfBWB3HzMwTGNDR0BbND9bX2Nna29zaEN/g4eLj5OXjEejp6uvs7e7v8PHy7CEAOw==) no-repeat 0 0; }
.float_layer .max { width: 21px; height: 20px; background: url(data:image/gif;base64,R0lGODlhFQAoANUAAAAAAP///+zs7Ovr6+rq6unp6ejo6Ofn5+bm5uXl5eTk5OPj4+Li4uHh4eDg4N/f397e3t3d3dzc3Nvb29nZ2dfX19PT09LS0tDQ0MzMzMrKysbGxsPDw8LCwsHBwby8vLe3t7W1tbKysrGxsbCwsK+vr6ysrKmpqaSkpKCgoJubm5mZmZWVlZSUlIuLi4qKioiIiIeHh4SEhIODg4GBgX9/f3x8fP///wAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAACH5BAEAADcALAAAAAAVACgAAAb1QJBwSCwaQYKkcslcCpvQ5jNKFUyr0CuWqWVqCtGuEiFDZs3NkY3mOEMjNZsNdU7Y7wmVXI7B24V+CRt7ciyBQgiJiQsuhHIeiomIkSGOcjAMkUIHnAcSNJZyJZ0HQganqKmqqUIFrq+wsbBCBLW2t7i3QgO8vb6/vkfCR6vFxqTIycmRzM3Oz9CKCtPU1dbX2NnXC9zd3hwN3uIM5OXlEjMi5uvs5SZrFe0MDfT19BZxNin29g/+//5WEMoAsGDBDo5aGHwAoaFDCS8sfXBIsSKJUDEoVIzAkeMFUKFOdBxJsqTJCBNSqlzJsqXLlzBjypzZMggAOw==) no-repeat 0 bottom; position: absolute; top: 2px; right: 25px; }
.float_layer .max:hover { background: url(data:image/gif;base64,R0lGODlhFQAoANUAAAAAAP///+zs7Ovr6+rq6unp6ejo6Ofn5+bm5uXl5eTk5OPj4+Li4uHh4eDg4N/f397e3t3d3dzc3Nvb29nZ2dfX19PT09LS0tDQ0MzMzMrKysbGxsPDw8LCwsHBwby8vLe3t7W1tbKysrGxsbCwsK+vr6ysrKmpqaSkpKCgoJubm5mZmZWVlZSUlIuLi4qKioiIiIeHh4SEhIODg4GBgX9/f3x8fP///wAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAACH5BAEAADcALAAAAAAVACgAAAb1QJBwSCwaQYKkcslcCpvQ5jNKFUyr0CuWqWVqCtGuEiFDZs3NkY3mOEMjNZsNdU7Y7wmVXI7B24V+CRt7ciyBQgiJiQsuhHIeiomIkSGOcjAMkUIHnAcSNJZyJZ0HQganqKmqqUIFrq+wsbBCBLW2t7i3QgO8vb6/vkfCR6vFxqTIycmRzM3Oz9CKCtPU1dbX2NnXC9zd3hwN3uIM5OXlEjMi5uvs5SZrFe0MDfT19BZxNin29g/+//5WEMoAsGDBDo5aGHwAoaFDCS8sfXBIsSKJUDEoVIzAkeMFUKFOdBxJsqTJCBNSqlzJsqXLlzBjypzZMggAOw==) no-repeat 0 0; }
.float_layer .close { width: 21px; height: 20px; background: url(data:image/gif;base64,R0lGODlhFQAoANUAAAAAAP///+zs7Ovr6+rq6unp6ejo6Ofn5+bm5uXl5eTk5OPj4+Li4uHh4eDg4N/f397e3t3d3dvb29XV1be3t6enp6SkpKKiopWVlZSUlJOTk5KSkpGRkY+Pj4GBgYCAgHx8fGRkZP///wAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAACH5BAEAACIALAAAAAAVACgAAAb/QIpwSCwaKYKkcslcCpvQ5jNKFUyr0CuWqRUkQBVlBZTgIpegdHicNjPZ4DTY/ZarpZSEfp+wyC18e0KBCRd2IBmEQgiMjIZpfmkYjYyLlHKTGHKUCEIHn58OIBigmg6gn0IGq6ytrq1CBbKztLW0QgS5uru8u0IDwMHCw8JHxkevycqozM3NnNDR0tPRCtbX2Nna29zaC9/gEiEZ4BkhEuDgDOvsIe4ZDObu7PT1Gu4h9+4a9QwN/wAb6MOnISDABwgTItyAb4PChxA74HPnAeIDCBgzSnTHAZ+HjCBDeoTgAV9ICBFSqpwQ4oPKDyEmqJxJs6bNlBJy6tzJs6fPCJ9Agwod2jMIADs=) no-repeat 0 bottom; position: absolute; top: 2px; right: 3px; }
.float_layer .close:hover { background: url(data:image/gif;base64,R0lGODlhFQAoANUAAAAAAP///+zs7Ovr6+rq6unp6ejo6Ofn5+bm5uXl5eTk5OPj4+Li4uHh4eDg4N/f397e3t3d3dvb29XV1be3t6enp6SkpKKiopWVlZSUlJOTk5KSkpGRkY+Pj4GBgYCAgHx8fGRkZP///wAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAACH5BAEAACIALAAAAAAVACgAAAb/QIpwSCwaKYKkcslcCpvQ5jNKFUyr0CuWqRUkQBVlBZTgIpegdHicNjPZ4DTY/ZarpZSEfp+wyC18e0KBCRd2IBmEQgiMjIZpfmkYjYyLlHKTGHKUCEIHn58OIBigmg6gn0IGq6ytrq1CBbKztLW0QgS5uru8u0IDwMHCw8JHxkevycqozM3NnNDR0tPRCtbX2Nna29zaC9/gEiEZ4BkhEuDgDOvsIe4ZDObu7PT1Gu4h9+4a9QwN/wAb6MOnISDABwgTItyAb4PChxA74HPnAeIDCBgzSnTHAZ+HjCBDeoTgAV9ICBFSqpwQ4oPKDyEmqJxJs6bNlBJy6tzJs6fPCJ9Agwod2jMIADs=) no-repeat 0 0; }
.float_layer .content { height: 200px; overflow: hidden; font-size: 14px; line-height: 18px; color: #666;  }
.float_layer .wrap { padding: 10px; }
-->
</style>
<div class="float_layer" id="miaov_float_layer">
  <h2>
      <span>站内推荐</span>
      <a id="btn_min" href="javascript:void(0);" class="min"></a>
      <a id="btn_close" href="javascript:void(0);" class="close"></a>
  </h2>
  <div class="content">
   <div class="wrap">
		<script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
			<!-- 91zcm_article_001 -->
			<ins class="adsbygoogle"
			     style="display:inline-block;width:250px;height:250px"
			     data-ad-client="ca-pub-3712320065678109"
			     data-ad-slot="7962713969"></ins>
			<script>
			(adsbygoogle = window.adsbygoogle || []).push({});
	    </script>
   </div>
  </div>
</div>
<script type="text/javascript">
function miaovAddEvent(oEle, sEventName, fnHandler){if(oEle.attachEvent){oEle.attachEvent('on'+sEventName, fnHandler);}else{oEle.addEventListener(sEventName, fnHandler, false);}}
function startMove(obj, iTarget, fnCallBackEnd){if(obj.timer){clearInterval(obj.timer);}obj.timer=setInterval(function (){doMove(obj, iTarget, fnCallBackEnd);},30);}
function doMove(obj, iTarget, fnCallBackEnd){var iSpeed=(iTarget-obj.offsetHeight)/8;if(obj.offsetHeight==iTarget){clearInterval(obj.timer);obj.timer=null;if(fnCallBackEnd){fnCallBackEnd();}}else{iSpeed=iSpeed>0?Math.ceil(iSpeed):Math.floor(iSpeed);obj.style.height=obj.offsetHeight+iSpeed+'px';((window.navigator.userAgent.match(/MSIE 6/ig) && window.navigator.userAgent.match(/MSIE 6/ig).length==2)?repositionAbsolute:repositionFixed)()}}
function repositionAbsolute(){var oDiv=document.getElementById('miaov_float_layer');var left=document.body.scrollLeft||document.documentElement.scrollLeft;var top=document.body.scrollTop||document.documentElement.scrollTop;var width=document.documentElement.clientWidth;var height=document.documentElement.clientHeight;oDiv.style.left=left+width-oDiv.offsetWidth+'px';oDiv.style.top=top+height-oDiv.offsetHeight+'px';}
function repositionFixed(){var oDiv=document.getElementById('miaov_float_layer');var width=document.documentElement.clientWidth;var height=document.documentElement.clientHeight;oDiv.style.left=width-oDiv.offsetWidth+'px';oDiv.style.top=height-oDiv.offsetHeight+'px';}
var oDiv = document.getElementById('miaov_float_layer');var oBtnMin = document.getElementById('btn_min');var oBtnClose = document.getElementById('btn_close');var oDivContent = oDiv.getElementsByTagName('div')[0];var iMaxHeight = 0;var isIE6 = window.navigator.userAgent.match(/MSIE 6/ig) && !window.navigator.userAgent.match(/MSIE 7|8/ig);oDiv.style.display = 'block';iMaxHeight = oDivContent.offsetHeight;if (isIE6) {oDiv.style.position = 'absolute';repositionAbsolute();miaovAddEvent(window, 'scroll', repositionAbsolute);miaovAddEvent(window, 'resize', repositionAbsolute);}else {oDiv.style.position = 'fixed';repositionFixed();miaovAddEvent(window, 'resize', repositionFixed);}oBtnMin.timer = null;oBtnMin.isMax = true;oBtnMin.onclick = function() {startMove(oDivContent, (this.isMax = !this.isMax) ? iMaxHeight : 0,function() {oBtnMin.className = oBtnMin.className == 'min' ? 'max' : 'min';});};oBtnClose.onclick = function() {oDiv.style.display = 'none';oDiv.innerHTML = "";};
</script>