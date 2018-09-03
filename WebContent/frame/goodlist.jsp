<%@page import="com.usts.woerma.db.DBImpl"%>
<%@page import="com.usts.woerma.db.DBDao"%>
<%@page import="com.usts.woerma.entity.GoodsInfo"%>
<%@page import="java.net.URLEncoder"%>
<%@page import="java.net.URLDecoder"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>显示商品列表</title>
</head>
<body style="background-image: url(../img/backg.jpg)">
2.左侧点击改变商品类别
<%
	DBDao dao = new DBImpl();
	String type = request.getParameter("type");
	int next = Integer.parseInt(request.getParameter("next"));
	String dtype = URLDecoder.decode(URLDecoder.decode(type, "utf-8"),"utf-8");
	List<GoodsInfo> lst = dao.getGoodsListByType(dtype,next);
%>
<table border="1" cellpadding="0" width="90%">
<%
	/* List<GoodsInfo> lst =(List<GoodsInfo>) session.getAttribute("GoodsListByType"); */
	Iterator it = lst.iterator();
	String ty = "";
	GoodsInfo goodsInfo = new GoodsInfo();
	for(int i = 0; i<lst.size();i++) {
		goodsInfo = lst.get(i);
		ty = URLEncoder.encode(URLEncoder.encode(goodsInfo.getGoodsType(), "utf-8"),"utf-8");%>
	<tr><td>
	<table border="1" cellpadding="0" width="100%">
		<tr><td  rowspan="7" width="30%" align="center">
			<a target="rMain" href="goodDetail.jsp?gId=<%=goodsInfo.getGoodsId() %>">
			<img alt="商品" width="100%"  src="../<%= goodsInfo.getGoodsImgUrl()%>"></a></td>
			<td width="10%">商品名称</td><td><%= goodsInfo.getGoodsName() %></td></tr>
			<tr><td width="10%">商品ID</td><td><%= goodsInfo.getGoodsId() %></td></tr>
			<tr><td width="10%">商品类型</td><td><%= goodsInfo.getGoodsType() %></td></tr>
			<tr><td width="10%">商品数量</td><td><%= goodsInfo.getGoodsAmount()%></td></tr>
			<tr><td width="10%">商品价格</td><td><%= goodsInfo.getGoodsPrice() %></td></tr>
			<tr><td width="10%">商品日期</td><td><%= goodsInfo.getGoodsDate() %></td></tr>
			<tr><td colspan="2" align="center" >
				<a href="buyInList.action?goodsId=<%=goodsInfo.getGoodsId()%>
					&type=<%=ty%>&next=<%=next%>">
					<img id="gm<%= i+1%>" alt="购买" src="../img/app/gm1.png" 
					onmousedown="document.all.gm<%= i+1%>.src='../img/app/gm2.png'"
					onmousemove="document.all.gm<%= i+1%>.src='../img/app/gm3.png'"
					onmouseout="document.all.gm<%= i+1%>.src='../img/app/gm1.png'"></a></td></tr>
	</table>
	</td></tr>
<%;}%>
</table>
<a target="rMain" href="goodlist.jsp?type=<%=ty%>&next=<%=next-2%>"><img alt="上一页" src="../img/app/prev.gif" name="next"></a>
<a target="rMain" href="goodlist.jsp?type=<%=ty%>&next=<%=next+2%>"><img alt="下一页" src="../img/app/next.gif" name="next"></a>
</body>
</html>