
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import ="java.sql.*" %>
<%@ page import ="javax.sql.*" %>
<html>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Homepage</title>
<head>
<!-- กำหนดสไตล์ชีทที่จะใช้ -->
<style type="text/css">
	#color1 {background-color:#5971AF; font-weight:bold; Color:#FFFFFF;}
	#color2 {background-color:#E1E9FC; Color:#000000;}
</style>
</head>
<body>

<form action="addnew1.do" method="post">
<table width='80%' align=center border=0 cellspacing=1 cellpadding=2>
	<tr id=color1>
		<td colspan=2 align=center>ตั้งหัวข้อใหม่</td></tr>
	<tr id=color2>
		<td>หัวข้อ</td>
		<td><input type=text name=topic size=50 ></td></tr>
	<tr id=color2>
		<td>ชื่อ</td>
		<td><input type=text name=name size=30></td></tr>
	<tr id=color2>
		<td>อีเมล</td>
		<td><input type=text name=email size=30 ></td></tr>
	<tr id=color2>
		<td>รายละเอียด</td>
		<td><textarea cols=50 rows=6 name=comment></textarea></td></tr>
	<tr id=color2>
		<td colspan=2 align=center><input type=submit name=submit >&nbsp;<input type=reset></td></tr>
</table>
</form>

	

</body>
</html>