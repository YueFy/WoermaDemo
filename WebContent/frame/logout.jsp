<%@page import="java.net.URLDecoder"%>
<%@ page language="java"%>
<%@ page pageEncoding="utf-8"%>
<%@ page contentType="text/html; charset=utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
<link type="text/css" rel="stylesheet" href="style/style.css">
</head>
<body style="background-image: url(../img/backg.jpg)">
<script type="text/javascript">
    parent.document.getElementsByName("frmTop")[0].
	contentDocument.all.
	idGoodsManager.hidden = true;
    parent.document.getElementsByName("frmTop")[0].
	contentDocument.all.
	idMMCZ.hidden = false;
    parent.document.getElementsByName("frmTop")[0].
	contentDocument.all.
	idGWC.hidden = false;
    parent.document.getElementsByName("frmTop")[0].
	contentDocument.all.
	idWDDD.hidden = false;
    parent.document.getElementsByName("frmTop")[0].
	contentDocument.all.
	idYHZC.hidden = false;
</script>
	<%
	boolean bLogin = false;
	Cookie[] cks = request.getCookies();
	String name = null;
	String userId = null;
	for ( Cookie ck : cks){
		if ( ck.getName().equalsIgnoreCase("name")){
			name = URLDecoder.decode(ck.getValue(), "UTF-8");
		}
		if ( ck.getName().equalsIgnoreCase("userId")){
			userId = ck.getValue();
		}
	}
	
	if ( name != null && name.trim().length() > 0 ){
		// 确实是登陆状态
		bLogin = true;
	}
%>

<% if (bLogin){ %>
	<%response.sendRedirect("error.jsp"); %>
<% }else{ %>
<div>
	<a href="login.jsp"><h2>您已经注销,请继续重新登陆。</h2></a>
</div>
<% }  %>

</body>
</html>