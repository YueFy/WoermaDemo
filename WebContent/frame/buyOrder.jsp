<%@page import="java.util.Map"%>
<%@page import="java.util.Iterator"%>
<%@page import="com.usts.woerma.entity.ShopCart"%>
<%@page import="com.usts.woerma.entity.GoodsInfo"%>
<%@page import="java.util.List"%>
<%@page import="java.net.URLDecoder"%>
<%@page import="com.usts.woerma.db.DBImpl"%>
<%@page import="com.usts.woerma.db.DBDao"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>我的订单</title>
</head>
<body style="background-image: url(../img/backg.jpg)">
<%
		boolean bLogin = false;
		String userId = null;
		String name = null;
		Cookie[] cks = request.getCookies();
	for(Cookie ck : cks){
		if ( ck.getName().equalsIgnoreCase("name")){
			name = URLDecoder.decode(ck.getValue(), "UTF-8");
		}
		if ( ck.getName().equalsIgnoreCase("userId")){
			userId = ck.getValue();
		}
	}
	if(userId != null && userId.trim().length() >0){
		bLogin = true;
	}
	if(!bLogin){
		response.sendRedirect("login.jsp");
	}else{
		DBDao dao = new DBImpl();
		List<Map<String,Object>> lst = dao.getMyOrder(Integer.parseInt(userId));
%>
<form>
<center>
<table border="1" cellpadding="0">
	<tr>
		<td>订单Id</td>
		<td>收货人姓名</td>
		<td>收货人地址</td>
		<td>收货人联系电话</td>
		<td>订单总价</td>
		<td>订单状态</td>
		<td>下单时间</td>
		<td>订单详情</td>
	</tr>
	<%for(Map<String,Object> map : lst){
		%>
		<tr><td><%= map.get("orderId") %></td>
			<td><%= map.get("receiveName")%></td>
			<td><%= map.get("receiveAddress")%></td>
			<td><%= map.get("receiveTele")%></td>
			<td><%= map.get("allMoney") %></td>
			<td><%= map.get("status") %></td>
			<td><%= map.get("buyTime") %></td>
			<td align="center"><a href="order.action?orderId=<%=map.get("orderId")%>">查看</a></td></tr>
	<%} %>
</table>
</center>
</form>
<% }%>
</body>
</html>