<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>登陆</title>
</head>
<body style="background-image: url(../img/backg.jpg)">
<%
		boolean bLogin = false;
		String userId = null;
		String name = null;
		Cookie[] cks = request.getCookies();
	for(Cookie ck : cks){
		if ( ck.getName().equalsIgnoreCase("name")){
			name = ck.getValue();
		}
		if ( ck.getName().equalsIgnoreCase("userId")){
			userId = ck.getValue();
		}
	}
	if(userId != null && userId.trim().length() >0){
		bLogin = true;
	}
%>
<script type="text/javascript">
	function checkInput(){
		var userName = document
				.getElementsByName("userName")[0];
		var userPwd = document.frmLogin.userPwd;
		if (  userName.value.trim().length == 0 ){
			document.all.idUserNameTip.innerHTML="请输入用户姓名";
			return false;
		}else{
			document.getElementById("idUserNameTip").innerHTML = "";
		}
		if (  userPwd.value.trim().length == 0 ){
			document.all.idUserPwdTip.innerHTML="<i>请输入用户密码</i>";
			return false;
		}else{
			document.all.idUserPwdTip.innerHTML="";
		}
		return true;
	}
</script>
<% if ( bLogin){ %>
<form action="pwdReset.action" name= "frmLogin" onsubmit="return checkInput()" >
<center>
<h3>密码重置</h3>
<table border="1" width="90%">
	<tr>
		<td align="right" width="25%">用户姓名：</td>
		<td width="45%"><input name="userName" type="text" style="width: 95%" value="请输入用户账号"></td>
		<td align="left" width="30%"><span id="idUserNameTip"></span></td>
	</tr>
	<tr>
		<td align="right" width="25%">用户密码：</td>
		<td width="45%"><input name="userPwd" type="password" style="width: 95%"></td>
		<td align="left" width="30%"><span id="idUserPwdTip"></span></td>
	</tr>
	<tr>
		<td align="right" width="25%">二次密码：</td>
		<td width="45%"><input name="twicePwd" type="password" style="width: 95%"></td>
		<td align="left" width="30%"><span id="idUserPwdTip"></span></td>
	</tr>
	<tr>
		<td colspan="3" align="center"><input type="submit" value="重&nbsp;置"></td>
	</tr>
</table>
</center>
</form>
<% }else{ %>
<div>
	<%response.sendRedirect("login.jsp"); %>
</div>
<% }  %>
</body>
</html>