<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>管理员登陆成功</title>
</head>
<body style="background-image: url(../img/backg.jpg)">
管理员登陆成功
<%
	String permitted = null;
	Cookie[] cks = request.getCookies();
	for ( Cookie ck : cks){
		if ( ck.getName().equalsIgnoreCase("permitted")){
			permitted = ck.getValue();
			break;
		}
	}
%>
<% 	if ( permitted !=null && 
			permitted.trim().length()>0 ){ %>
	<br/>去显示top.html上的管理员的按钮
	<script type="text/javascript">
		parent.document.getElementsByName("frmTop")[0].
			contentDocument.all.
			idGoodsManager.hidden = false;
		parent.document.getElementsByName("frmTop")[0].
		contentDocument.all.
		idMMCZ.hidden = true;
		 parent.document.getElementsByName("frmTop")[0].
			contentDocument.all.
			idGWC.hidden = true;
		    parent.document.getElementsByName("frmTop")[0].
			contentDocument.all.
			idWDDD.hidden = true;
		    parent.document.getElementsByName("frmTop")[0].
			contentDocument.all.
			idYHZC.hidden = true;
	</script>
<%	}  %>








</body>
</html>