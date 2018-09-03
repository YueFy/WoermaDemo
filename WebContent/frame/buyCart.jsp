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
<title>我的购物车</title>
</head>
<body style="background-image: url(../img/backg.jpg)">
<script type="text/javascript">
function deleteConfirm(name){
	return window.confirm("是否删除 "+name+" ?");
}
function checkLogin(){
	<%
		boolean bLogin = false;
		String userId = null;
		Cookie[] cks = request.getCookies();
		for(Cookie ck : cks){
		if(ck.getName().equalsIgnoreCase("userId")){
			userId = ck.getValue();
			break;
			}
		}
		if(userId != null && userId.trim().length() >0){
			bLogin = true;
		}
		if(bLogin){
			%>return true;
			window.location = "pay.jsp";<%
		}else{
			%>
			window.location = "login.jsp";
			return false;<%
		}
		%>
}
</script>
<%
	DBDao dao = new DBImpl();
	//1.数据使用类对象的方式，存放在list
	//List<ShopCart> lst = dao.getShopCart();
	//2.数据使用map方式，存放在list
	List<Map<String,Object>> lst = dao.getShopCartEx();
%>
<table border="1" cellpadding="0" width="90%">
<thead><tr>
		<td>商品ID</td>
		<td>商品名称</td>
		<td>商品类型</td>
		<td>购买数量</td>
		<td>商品价格</td>
		<td>购买时间</td>
		<td>操作</td></tr></thead>
<%
	//Iterator it = lst.iterator();
	//ShopCart shopCart = new ShopCart();
	double total = 0;
	/* for(int i = 0; i<lst.size();i++) {
		total += shopCart.getgPrice() * shopCart.getgBuyAmount();
		shopCart = lst.get(i); */
		for(Map<String,Object> map : lst){
			total += Double.parseDouble(map.get("goodsPrice").toString())
					*Integer.parseInt(map.get("orderAmount").toString());
%>
	<tr>
		<%-- <td><%= shopCart.getgId() %></td>
		<td><%= shopCart.getgName() %></td>
		<td><%= shopCart.getgType() %></td>
		<td><%= shopCart.getgBuyAmount()%></td>
		<td><%= shopCart.getgPrice() %></td>
		<td><%= shopCart.getgBuyDate() %></td> 
		<td><a href="deleteInShopCart.action?goodsId=<%= shopCart.getgId() %>"
			onclick="return deleteConfirm('<%=shopCart.getgName()%>')">删除</a></td></tr> --%>
		
		<td><%= map.get("goodsId") %></td>
		<td><%= map.get("goodsName") %></td>
		<td><%= map.get("goodsType")%></td>
		<td><%= map.get("orderAmount")%></td>
		<td><%= map.get("goodsPrice") %></td>
		<td><%= map.get("buyTime") %></td>
		<td><a href="deleteInShopCart.action?goodsId=<%= map.get("goodsId") %>" 
			onclick="return deleteConfirm('<%=map.get("goodsName")%>')">删除</a></td></tr>
<%;}

	if(total==0.0){
		%>
		<a href="rightFirst.jsp"><h2>您的购物车空空如也，请您先去商城购物</h2></a>
		<% 
	}else{
		%>
	<tr><td colspan="8" align="right">购物车内总价：<%= total %> 元 
		<a href="pay.jsp?userId=<%=userId %>&allMoney=<%= total%>"  onclick="return checkLogin()"><button>确认购买</button></a>
		</td></tr>	
	</table>
		<%
	}
%>
</body>
</html>