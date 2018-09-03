<%@page import="com.usts.woerma.entity.GoodsInfo"%>
<%@page import="java.util.List"%>
<%@page import="com.usts.woerma.db.DBImpl"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>商品管理页面</title>
<style type="text/css">
	.idRecord1{
		background: #DDDDDD;
	}
	.idRecord2{
		background: #FFFFFF;
	}
</style>
</head>
<body style="background-image: url(../img/backg.jpg)">

商品管理页面<br/>
1. 获取商品，并且展示<br/>
2. 管理商品。<br/>
<%
	List<GoodsInfo> lst= new DBImpl().getGoodsList();
%>

<hr/>
<a href="goodsAdd.jsp">增加商品</a>
<hr/>

<table width="98%" border="1" cellpadding="0" 
		cellspacing="0">
	<tr background="olive" style="background: olive">
		<td width="5%">ID</td>
		<td width="10%">图片</td>
		<td width="10%">图片Url</td>
		<td width="10%">名字</td>
		<td width="10%">类别</td>
		<td width="10%">价格</td>
		<td width="10%">数量</td>
		<td width="10%">发布时间</td>
		<td width="15%">描述</td>
		<td width="10%">管理</td>
	</tr>
<% 	for ( int i=0;i<lst.size();i++ ) { 
		GoodsInfo gi = lst.get(i);
%>
		<tr class="idRecord<%=i%2+1%>">
			<td><%= gi.getGoodsId() %></td>
			<td><img alt="pic" height="60"
				src="../<%= gi.getGoodsImgUrl() %>"></td>
			<td><%= gi.getGoodsImgUrl() %></td>
			<td><%= gi.getGoodsName() %></td>
			<td><%= gi.getGoodsType() %></td>
			<td><%= gi.getGoodsPrice() %></td>
			<td><%= gi.getGoodsAmount() %></td>
			<td><%= gi.getGoodsDate() %></td>
			<td><%= gi.getGoodsIntroduction() %></td>
			<td><a href="goodsModify.jsp?goodsId=<%= gi.getGoodsId() %>">修改</a>
				<a href="goodsDelete.action?goodsId=<%= gi.getGoodsId() %>" 
					onclick="return confirm('delete? 【<%=gi.getGoodsName()%>】')">删除</a></td>
		</tr>
<% } %>
</table>

<%= lst %>




</body>
</html>