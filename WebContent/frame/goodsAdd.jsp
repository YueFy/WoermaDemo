<%@ page language="java" contentType="text/html; charset=GBK"
    pageEncoding="GBK"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<title>��Ʒ����</title>
</head>
<body style="background-image: url(../img/backg.jpg)">
��Ʒ����
<form action="goodsAdd.action" method="post"
	 	enctype="multipart/form-data">
	<table>
		<tr>
			<td>ͼƬ</td>
			<td><img alt="pic" src="file:///C:/11.jpg"></td>
		</tr>
		
		<tr>
			<td>ͼƬUrl</td>
			<td><input type="file" name="goodsurl"></td>
		</tr>
		
		<tr>
			<td>��Ʒ����</td>
			<td><input type="text" name="goodsName" 
				value="htc"></td>
		</tr>
		
		<tr>
			<td>��Ʒ���</td>
			<td><input type="text" name="goodsType"
				value="�ֻ�"></td>
		</tr>
		
		<tr>
			<td>��Ʒ�۸�</td>
			<td><input type="text" name="goodsPrice"></td>
		</tr>
		
		<tr>
			<td>��Ʒ����</td>
			<td><input type="text" name="goodsAmount"></td>
		</tr>
		
		<tr>
			<td>��Ʒ����</td>
			<td><input type="text" name="goodsDisplay"></td>
		</tr>
		
		<tr>
			<td rowspan="2" align="center">
				<input type="submit" value="����">
			</td>
		</tr>
	</table>
</form>
</body>
</html>