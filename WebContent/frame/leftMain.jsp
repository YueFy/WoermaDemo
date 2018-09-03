<%@page import="java.net.URLEncoder"%>
<%@page import="java.util.Iterator"%>
<%@page import="com.usts.woerma.db.DBDao"%>
<%@page import="java.util.List"%>
<%@page import="com.usts.woerma.db.DBImpl"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title></title>
<style type="text/css">
img{
  position:absolute;
  left:5px;
  bottom:5px;
  }
</style>
</head>
<body style="background-image: url(../img/backg.jpg)">
<script type="text/javascript">  
function searchToggle(obj, evt){  
    var container = $(obj).closest('.search-wrapper');  
  
    if(!container.hasClass('active')){  
          container.addClass('active');  
          evt.preventDefault();  
    }  
    else if(container.hasClass('active') && $(obj).closest('.input-holder').length == 0){  
          container.removeClass('active');  
          // clear input  
          container.find('.search-input').val('');  
          // clear and hide result container when we press close  
          container.find('.result-container').fadeOut(100, function(){$(this).empty();});  
    }  
}  
  
function submitFn(obj, evt){  
    value = $(obj).find('.search-input').val().trim();  
  
    _html = "您搜索的关键词： ";  
    if(!value.length){  
        _html = "关键词不能为空。";  
    }  
    else{  
        _html += "<b>" + value + "</b>";  
    }  
  
    $(obj).find('.result-container').html('<span>' + _html + '</span>');  
    $(obj).find('.result-container').fadeIn(100);  
  
    evt.preventDefault();  
}  
</script>
<%
	//1.后台数据库
	DBDao dao = new DBImpl();
	int next = 0;
	//2.调用接口去获取商品类别
	List<String> lst = dao.getGoodsType();
	Iterator<String> it = lst.iterator();
%>
<form  target="rMain" action="search.action"  onSubmit="submitFn(this, event);">  
    <div class="search-wrapper">  
        <div class="input-holder">  
            <input type="text"  name="search" class="search-input" placeholder="请输入关键词进行商品搜索" />  
           <button name="search" 
            style=" width:50px; height:15px; border:0; 
            background:url(../img/app/sear.gif) no-repeat left top";
             ></button>
        </div>  
        <span class="close" onClick="searchToggle(this, event);"></span>  
        <div class="result-container">  
        </div>  
    </div>  
</form>  
1.左侧显示出商品分类
<table border="1" width="80%" cellpadding="0" cellspacing="0">
	<tr>	
<%
	for(String type : lst) {
		String decod = URLEncoder.encode(URLEncoder.encode(type, "utf-8"), "utf-8");%>
		<td align="center" width="10%"><img src="../img/app/fav.gif"></td>
		<td align="center">
		<%-- <a target="rMain" href="showGoodlist.action?type=<%= decod %>"><%= type %></a> --%>
		<a target="rMain" href="goodlist.jsp?type=<%= decod %>&next=<%=next%>"><%=type%></a>
		</td>
	</tr>
	<%}%>
</table>	
<img alt="收藏店铺" src="../img/scdp.PNG">
</body>
</html>