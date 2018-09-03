<%@ page language="java" contentType="text/html; charset=GBK"
    pageEncoding="GBK"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<title>商品增加</title>
</head>
<body style="background-image: url(../img/backg.jpg)">
商品增加
<form action="goodsAdd.action" method="post"
	 	enctype="multipart/form-data">
	<table>
		<tr>
			<td>图片</td>
			<td><img alt="pic" src="file:///C:/11.jpg"></td>
		</tr>
		
		<tr>
			<td>图片Url</td>
			<td><input type="file" name="goodsurl"></td>
		</tr>
		
		<tr>
			<td>商品名字</td>
			<td><input type="text" name="goodsName" 
				value="htc"></td>
		</tr>
		
		<tr>
			<td>商品类别</td>
			<td><input type="text" name="goodsType"
				value="手机"></td>
		</tr>
		
		<tr>
			<td>商品价格</td>
			<td><input type="text" name="goodsPrice"></td>
		</tr>
		
		<tr>
			<td>商品数量</td>
			<td><input type="text" name="goodsAmount"></td>
		</tr>
		
		<tr>
			<td>商品描述</td>
			<td><input type="text" name="goodsDisplay"></td>
		</tr>
		
		<tr>
			<td rowspan="2" align="center">
				<input type="submit" value="增加">
			</td>
		</tr>
	</table>
</form>
</body>
</html>