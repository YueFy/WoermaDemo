<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>支付页面</title>
</head>
<body style="background-image: url(../img/backg.jpg)">
支付页<br/>
<form action="pay.action">
<center>
<table border="1" cellpadding="0">
	<tr>
		<td align="right">支付账号ID</td><td>
			<input type="hidden" name="userId" value=<%= request.getParameter("userId") %>>
			<span><%= request.getParameter("userId") %></span></td>
	</tr>
	<tr>
		<td align="right">支付金额</td>
		<td>
		   <input type="hidden" name="allMoney" value=<%= request.getParameter("allMoney") %>>
		   <span><%= request.getParameter("allMoney") %></span></td>
	</tr>
	<tr>
		<td align="right">收货人</td><td><input id="receiveName" type="text" name="receiveName"></td>
	</tr>
	<tr>
		<td align="right">收货地址</td><td><input id="receiveAddress" type="text" name="receiveAddress"></td>
	</tr>
	<tr>
		<td align="right">联系电话</td><td><input id="receiveTele" type="text" name="receiveTele"></td>
	</tr>
	<tr>
		<td colspan="2" align="center">
			<span><input type="submit" value="支付"></span></td>
	</tr>
	</table>
</center>
</form>
</body>
</html>