<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head link href="css/bootstrap.min.css" rel="stylesheet">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" name="viewport" content="width=device-width, initial-scale=1.0">
<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/bootstrap-responsive.min.css" rel="stylesheet">
<title>DiscussAppWeb</title>
<style type="text/css">
body{
background-image: img/bg2.jpg ;
background-attachment:fixed;
background-repeat: no-repeat;
font-family: tahoma;
font-size: 15px;
}
</style>
</head>
<body background="img/bg2.jpg"  >
<%
if (request.getParameter("btRegister") != null) {	//ตรวจสอบการส่งข้อมูลผ่านฟอร์ม
	StringBuilder msgError = new StringBuilder();//สร้างตัวแปรเพื่อเก็บแมสเสจข้อผิดพลาดจากการกรอกข้อมูล
%>
<center><table background="img/bgtb.png"  border="1" bordercolor="white" cellpadding="10" cellspacing="0" style="width: 80%; " >
	  <tr>
           <td> <center> <img src="img/header.png" width="100%" height="100%" align="middle" /></center></td>
      </tr> 
       <tr>
       		<td><ul class="nav nav-tabs">
  			<li role="presentation" class="active"><a href="home.jsp">หน้าหลัก</a></li>
  			<li role="presentation"><a href="About.jsp">เกี่ยวกับเรา</a></li>
 			<li role="presentation"><a href="Contact.jsp">ติดต่อเรา</a></li>
 			<p align = "right" ><Font Size=2><a href="register.jsp">&nbsp;&nbsp;สมัครสมาชิก</a>&nbsp;<a href="login.jsp">&nbsp;&nbsp;เข้าสู่ระบบ</a></Font></p> 		
			</ul></td>
       </tr>

</table></center>       
<table width="80%" align="center" background="img/bgtb.png" border="0" style="border:1px dashed red;  ">
<tr><td>
<jsp:useBean id="Conndb" class="com.rmuti.db.Conndb" scope="page"> </jsp:useBean>
<%
try {//ดักจับความผิดพลาดจากการทำงาน
String user = request.getParameter("username");
String pass = request.getParameter("password"), repassword = request.getParameter("repassword");
String name = new String(request.getParameter("name").getBytes("ISO-8859-1"), "UTF-8");//รองรับชื่อ-สกุลภาษาไทย;
String email = request.getParameter("email"), tel=request .getParameter("tel");
String address = new String(request.getParameter("address").getBytes("ISO-8859-1"), "UTF-8");
//Check Duplicate of User name
ResultSet rsChekUser = Conndb.getConn().executeQuery("SELECT COUNT(username) as userName  FROM tb_user WHERE username='" + user + "'");
rsChekUser.first();
////Check Duplicate of Email
ResultSet rsCheckEmail = Conndb.getConn().executeQuery("SELECT COUNT(userEmail) FROM tb_user WHERE userEmail='" + email + "'");
rsCheckEmail.first();
if (rsChekUser.getString("userName").equals("1")) {
	//หากมีUser name อยู่ก่อนแล้ว ค่าจะเป็น 1
	msgError.append("User name ซ้ำ<br />");
	} else if (user.equals("") || (user.length() < 4) || (user.length() > 16) || (user.matches("[a-zA-Z0-9\\_\\-]+") == false)) {
	//Username ต้องไม่ว่าง  กรอกได้4-16 ตัวอักษร และต้องเป็นภาษาอังกฤษหรือตัวเลขอารบิกและเครื่องหมาย_,-ได้เท่านั้่น
		
	msgError.append("กรุณากรอก User name ให้ถูกต้อง<br />");
	}
	if (pass.equals("") || (!pass.equals(repassword)) || (pass.length() < 4) || (pass.length() > 16) || (pass.matches("[a-zA-Z0-9\\_\\-]+") == false)) {
	//เหมือนกับ User name
	msgError.append("กรณากรอก Password ให้ถูกต้อง<br />");
	}
	if (name.equals("")) {
	//ชื่อ-สกุลต้องไม่เป็นค่าว่าง
	msgError.append("กรุณากรอก ชื่อ-นามสกุล ให้ถูกต้อง<br />");
	}
	if (email.equals("") || email.matches("^[\\w\\.-]{1,}\\@([\\da-zA-Z-]{1,}\\.){1,}[\\da-zA-Z-]+$") == false) {
	//อีเมลต้องไม่ว่างและกรอกถูกต้องตามFormatที่กำหนด
	msgError.append("กรุณากรอก อีเมล ให้ถูกต้อง<br />");
	}
	if (tel.equals("") || tel.matches("[0-9]+") == false) {
	//เบอร์โทรต้องไม่ว่างและกรอกเฉพาะตัวเลขอารบิกเท่านั้น
	msgError.append("กรุณากรอก เบอร์โทรศัพท์ ให้ถูกต้อง<br />");
	}
	if (address.equals("")) {
	//ที่อยู่ต้องไม่ว่าง
	msgError.append("กรุณากรอก ที่อยู่ ให้ชัดเจน");
	}
	if (msgError.toString().equals("")) {
		String cat_topic ="No";
		//หากตัวแปร msgError ซึ่งเป็น Valiable object ของ StringBulilder เป็นค่าว่าง แสดงว่ากรอกข้อมูลถูกต้อง
		StringBuilder sql = new StringBuilder();//สร้างตัวแปรแบบ StringBuilder อีกครั้ง เพื่อเก็บคำสั่ง Insert
		sql.append("INSERT INTO tb_user(username,password,name,userEmail,userTel,userAddress,cat_Topic,role_id) ");
		sql.append("VALUES('" + user + "','" + pass + "','" + name + "','" + email + "','" + tel + "','" + address + "','" + cat_topic + "',3)");
		if (Conndb.getConn().executeUpdate(sql.toString()) > 0) {
		//หากเพิ่มข้อมูลถูกต้อง จะได้รับค่ารีเทิร์นกลับมาเป็น 1 แสดงว่า ได้สมัครสมาชิกสมบูรณ์แล้ว
		out.print("<font color=\"green\">สมัครสมาชิกเรียบร้อยแล้ว</font><BR>");
		out.print("<A HREF=\"login.jsp\">กลับไปหน้า login</A>");
		}
		} else {//หากตัวแปร msgError ไม่เป็นค่าว่าง แสดงว่า มีการกรอกข้อมูลบางจุดที่ไม่ถูกต้อง
		out.print("<font color=\"red\">" + msgError.toString() + "</font>");//แสดงข้อผิดพลาด
		}
		Conndb.closeConn();//ปิดการเชื่อมต่อ
		} catch (SQLException ex) {//หากมีการทำงานกับฐานข้อมูลผิดพลาด
		out.print(ex.getMessage());//แสดงข้อผิดพลาด
}
%>
</td>
</tr>
</table>
<%
}
%>		

<form method="post" action="register.jsp">

    
            
           <table border="1" bordercolor="white" background="img/bgtb.png"  align="center" width="80%">
				
				
				<tr>
					<td colspan="2" align="center"><h1>สมัครสมาชิก</h1></td>
				</tr>
				<tr>
					<td colspan="2" align="center"><p>-------------------------------------------------------------------------------------------------------------------------------------------------</p></td>
				</tr>
				<tr>
					<td>&nbsp;&nbsp;&nbsp;User name :</td>
					<td><input type="text" name="username" size="20" />*กรอกเป็นภาษาอังกฤษหรือตัวเลข4-16ตัวอักษร</td>
				</tr>
				 <tr>
					<td>&nbsp;&nbsp;&nbsp;Password :</td>
					<td><input type="password" name="password" size="20" />*กรอกเป็นภาษาอังกฤษหรือตัวเลข4-16ตัวอักษร</td>
				</tr>
				<tr>
					<td>&nbsp;&nbsp;&nbsp;RePassword :</td>
					<td><input type="password" name="repassword" size="20" /></td>
				</tr>
				<tr>
					<td>&nbsp;&nbsp;&nbsp;ชื่อ-สกุล :</td>
					<td><input type="text" name="name" size="30" />*</td>
				</tr>
				<tr>
					<td>&nbsp;&nbsp;&nbsp;อีเมล :</td>
					<td><input type="text" name="email" size="30" />*เช่น abc123@hotmail.com</td>
				</tr>
				<tr>
					<td>&nbsp;&nbsp;&nbsp;เบอร์โทรศัพท์ :</td>
					<td><input type="text" name="tel" size="20" />*กรอกเป็นตัวเลข เช่น 084562145</td>
				</tr>
				<tr>
					<td>&nbsp;&nbsp;&nbsp;ที่อยู่ :</td>
					<td><textarea cols="50" rows="10" name="address"></textarea>*
				</tr>
				 <tr>
					<td colspan="2" align="center"><a class="btn btn-danger" href="home.jsp" role="button">กลับสู่หน้าหลัก</a>&nbsp;&nbsp;&nbsp;<input class="btn btn-success" type="submit" name="btRegister" value="ตกลง" />&nbsp;&nbsp;&nbsp;<input class="btn btn-info" type="reset" value="เคลียร์"></td>
				 </tr>
				</table>
			
        
    
       



<center><table background="img/bgtb.png"  border="1" bordercolor="white" cellpadding="10" cellspacing="0" style="width: 80%; " >
	  <tr>
           <td> <center> <img src="img/below1.png" width="100%" height="100%" align="middle" /></center></td>
      </tr> 

</table></center>
</form>

<script src="js/jquery.js"></script>
<script src="js/bootstrap.min.js"></script>
</body>
</html>