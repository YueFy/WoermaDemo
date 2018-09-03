<%@page import="com.usts.woerma.entity.GoodsInfo"%>
<%@page import="com.usts.woerma.db.DBImpl"%>
<%@page import="com.usts.woerma.db.DBDao"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>商品详情</title>
</head>
<body style="background-image: url(../img/backg.jpg)">
3.点击图片显示出具体的一个商品信息
<%
	int goodsId = Integer.parseInt(request.getParameter("gId"));
	DBDao dao = new DBImpl();
	int next = 0;
	GoodsInfo gi = dao.getGood(goodsId);
%>
<table border="1" width="90%">
	<tr>
		<!-- 商品图片 -->
		<td width="30%" align="center">
		<a target="rMain" href="goodDetail.jsp?gId=<%=gi.getGoodsId() %>">
			<img alt="商品" width="100%" src="../<%= gi.getGoodsImgUrl()%>"></a></td>
		<!-- 商品信息 -->
		<td width="70%">
			<table >
				<tr><td>商品Id：<%= gi.getGoodsId() %> </td></tr>
				<tr><td>商品名称：<%=gi.getGoodsName() %> </td></tr>
				<tr><td>商品类型： <%=gi.getGoodsType() %></td></tr>
				<tr><td>商品价格： <%=gi.getGoodsPrice() %></td></tr>
				<tr><td>商品数量： <%=gi.getGoodsAmount() %></td></tr>
				<tr><td colspan="2" align="center" >
				<a href="buyInList.action?goodsId=<%=gi.getGoodsId()%>
					&type=<%=gi.getGoodsType()%>&next=<%=next%>">
					<img id="gm" alt="购买" src="../img/app/gm1.png" 
					onmousedown="document.all.gm.src='../img/app/gm2.png'"
					onmousemove="document.all.gm.src='../img/app/gm3.png'"
					onmouseout="document.all.gm.src='../img/app/gm1.png'"></a></td></tr>
			</table>
		</td>
	</tr>
	<tr>
		<!-- 商品描述 -->
		<td colspan="2"><%= gi.getGoodsIntroduction() %></td>
	</tr>
</table>
</body>
</html>