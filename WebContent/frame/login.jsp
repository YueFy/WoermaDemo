<%@ page language="java" %>
<%@ page pageEncoding="utf-8" %>
<%@ page contentType="text/html; charset=utf-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
<link type="text/css" rel="stylesheet" href="../style/style.css">
</head>
<body style="background-image: url(../img/backg.jpg)">
1. 正常登陆页面<br/>
2. 如果用户已经登录，提示用户已经登录。<br/>
3. 后台登陆，增加cookie。
<%
	boolean bLogin = false;
	Cookie[] cks = request.getCookies();
	String name = null;
	String userId = null;
	for ( Cookie ck : cks){
		if ( ck.getName().equalsIgnoreCase("name")){
			name = ck.getValue();
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

${cookie.name}
${cookie}
<script type="text/javascript">
	function checkInput(){
		// 通过getElementsByName方式取出name=userCode的元素标签，
		//    返回是数组，我们从数组中取出第1个元素
		var userCode = document
				.getElementsByName("userCode")[0];
		// 从文档中取出name=frmLogin的标签，该标签是form表单。
		//   再从frmLogin中取出name=userPwd的标签，
		var userPwd = document.frmLogin.userPwd;
		if (  userCode.value.trim().length == 0 ){
			// 从文档中取出all，所有的ID中id=idUserNameTip的标签
			document.all.idUserNameTip.innerHTML="请输入用户姓名";
			return false;
		}else{
			// 通过getElementById方式取出id=idUserNameTip
			// 的元素标签，返回是一个元素，
			// 在一个jsp中，id定义不能重发，否则不能取到元素数据。
			document.getElementById("idUserNameTip")
				.innerHTML = "";
			//document.all.idUserNameTip.innerHTML="";
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

<% if ( bLogin == false){ %>
<form name= "frmLogin" action="login.action" onsubmit="return checkInput()" >
	<!-- <center> -->
	<table border="1" width="90%" >
		<tr>
			<td width="25%" align="right">用户姓名</td>
			<td width="45%">
				<input style="width: 96%;"  type="text" 
					name="userCode" value="manager">
			</td>
			<td width="30%" align="left">
				<span id="idUserNameTip"></span>
			</td>
		</tr>
		<tr>
			<td width="25%" align="right">用户密码</td>
			<td width="45%">
				<input  style="width: 96%;" value="123456"
					type="password" name="userPwd">
			</td>
			<td width="30%" align="left">
				<span id="idUserPwdTip"></span>
			</td>
		</tr>
		<tr>
			<td colspan="3" align="center">
				<input type="submit" value="登 &nbsp;陆">
			</td>
		</tr>
	</table>
	<!-- </center> -->
</form>
<% }else{ %>
<div>
	用户【<%=name %>】已经登录，请使用。
</div>
<% }  %>

</body>
</html>