<%@page import="com.usts.woerma.db.DBImpl"%>
<%@page import="com.usts.woerma.entity.GoodsInfo"%>
<%@ page language="java" contentType="text/html; charset=GBK"
    pageEncoding="GBK"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<title>商品修改</title>
</head>
<body style="background-image: url(../img/backg.jpg)">
商品修改
1. 页面文件本身格式是GBK格式<br/>
2. method=post <br/>
3. enctype="multipart/form-data"<br/>
4. Smartupload.getRequest.getParamter<br/>
5. pageEncoding="GBK",JSP,html代码定义为GBK格式。<br/>
6.request.setChart("GBK")<br/>
<hr/>
<%
	String goodsId = request.getParameter("goodsId");
	GoodsInfo gi = 	new DBImpl().getGoodsDetailById(goodsId);
%>
<form action="goodsModify.action" method="post"
	 	enctype="multipart/form-data">
	<table width="90%" border="1" cellpadding="0" cellspacing="0">
		<tr>
			<td>ID</td>
			<td><%= goodsId %><input type="hidden" name="goodsId" value="<%=goodsId%>"></td>
		</tr>
		<tr>
			<td>图片</td>
			<td><img alt="pic" src="../<%= gi.getGoodsImgUrl()%>" width="20%"></td>
		</tr>
		<tr>
			<td>图片路径</td>
			<td><%= gi.getGoodsImgUrl()%></td>
		</tr>
		
		<tr>
			<td>更换图片</td>
			<td><input type="file" name="goodsurl" value="更换图片"></td>
		</tr>
		
		<tr>
			<td>商品名字</td>
			<td><input type="text" name="goodsName" 
				value="<%= gi.getGoodsName()%>"></td>
		</tr>
		
		<tr>
			<td>商品类别</td>
			<td><input type="text" name="goodsType"
				value="<%= gi.getGoodsType()%>"></td>
		</tr>
		
		<tr>
			<td>商品价格</td>
			<td><input type="text" name="goodsPrice" value="<%=gi.getGoodsPrice()%>"></td>
		</tr>
		
		<tr>
			<td>商品数量</td>
			<td><input type="text" name="goodsAmount" value="<%=gi.getGoodsAmount()%>"></td>
		</tr>
		
		<tr>
			<td>商品描述</td>
			<td><textarea rows="4" cols="80" name="goodsDisplay"><%=gi.getGoodsIntroduction()%></textarea>
			<%-- <input type="text" name="goodsDisplay" value="<%=gi.getGoodsIntroduction()%>"> --%>
			</td>
		</tr>
		
		<tr>
			<td rowspan="2" align="center">
				<input type="submit" value="修改">
			</td>
		</tr>
	</table>
</form>
</body>
</html>