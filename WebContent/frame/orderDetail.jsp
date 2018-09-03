<%@page import="java.util.Map"%>
<%@page import="java.net.URLEncoder"%>
<%@page import="java.net.URLDecoder"%>
<%@page import="com.usts.woerma.db.DBImpl"%>
<%@page import="com.usts.woerma.db.DBDao"%>
<%@page import="com.usts.woerma.entity.GoodsInfo"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>显示商品列表</title>
</head>
<body style="background-image: url(../img/backg.jpg)">
<%
	DBDao dao = new DBImpl();
	List<Map<String,Object>> lst = (List<Map<String,Object>>) session.getAttribute("OrderDetail");
%>
<table border="1" cellpadding="0" width="90%">
<%
	/* List<GoodsInfo> lst =(List<GoodsInfo>) session.getAttribute("GoodsListByType"); */
	for(Map<String,Object> map : lst){
		%>
	<tr><td>
	<table border="1" cellpadding="0" width="100%">
		<tr align="center"><td width="100%" colspan="3"><%=map.get("id") %></td></tr>
		<tr align="center"><td width="20%">订单Id</td><td colspan="2"><%=map.get("orderId") %></td></tr>
		<tr><td  rowspan="6" width="20%" align="center">
			<a target="rMain" href="goodDetail.jsp?gId=<%=map.get("goodsId") %>">
			<img alt="商品" width="100%"  src="../<%= map.get("goodsImgUrl")%>"></a></td>
			<td width="20%">商品名称</td><td><%= map.get("goodsName") %></td></tr>
			<tr><td width="20%">商品Id</td><td><%= map.get("goodsId") %></td></tr>
			<tr><td width="20%">商品类型</td><td><%= map.get("goodsType") %></td></tr>
			<tr><td width="20%">购买数量</td><td><%= map.get("buyAmount")%></td></tr>
			<tr><td width="20%">商品价格</td><td><%=map.get("goodsPrice")%></td></tr>
			<tr><td width="20%">商品日期</td><td><%= map.get("goodsDate") %></td></tr>
	</table>
	</td></tr>
<%;}%>
</table>
</body>
</html>