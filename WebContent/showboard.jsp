<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import ="java.sql.*" %>
<%@ page import ="javax.sql.*" %>
<html>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Show</title>
<head>
<!-- กำหนดสไตล์ชีทที่จะใช้ -->
<style type="text/css">
	#color1 {background-color:#5971AF; font-weight:bold; Color:#FFFFFF;}
	#color2 {background-color:#E1E9FC; Color:#000000;}
</style>

</head>
<body>
<%
	try
	{
	//ขั้นตอนที่ 1 โหลดคลาสไดรเวอร์
	Class.forName("org.gjt.mm.mysql.Driver");
	//ขั้นตอนที่ 2 เปิดการเชื่อมต่อไปยังระบบฐานข้อมูล
	Connection mycon = DriverManager.getConnection("jdbc:mysql://localhost:3306/andoird","root","pong084391");
	//ขั้นตอนที่ 3 ติดต่อกับฐานข้อมูลโดยใช้คำสั่ง SQL
	Statement stmt = mycon.createStatement();
	ResultSet myresult = stmt.executeQuery("SELECT * FROM board ");
	//ขั้นตอนที่ 4 จัดการกับผลลัพธ์ที่ได้จากคำสั่ง SQL
	if(myresult!=null)
	{
		out.println("<center> หัวข้อ  board</center><br>");
		out.println("<table width='80%' align=center border=0 cellspacing=1 cellpadding=2");
		out.println("<tr id=color1><td>หัวข้อ</td>");			
		out.println("<td>ชื่อคนโพส</td>");
		out.println("<td>email</td>");
		out.println("<td>รายละเอียด</td></tr>");
		while(myresult.next())
		{
			
			out.println("<tr id=color2><td>"+myresult.getString("topic")+"</td>");			
			out.println("<td>"+myresult.getString("name")+"</td>");
			out.println("<td>"+myresult.getString("email")+"</td>");
			out.println("<td>"+myresult.getString("comment")+"</td></tr>");
		}
		out.println("</table>");
		
		
		
	}
	}
	catch (ClassNotFoundException e)
	{
		out.println("ไม่พบไดรเวอร์ของฐานข้อมูลที่ต้องการติดต่อ");	
	}
	catch (SQLException e)
	{
		out.println("ไม่สามารถติดต่อกับฐานข้อมูลได้");
	}


%>

<center><input type="button" onclick="window.location.href='addnew.jsp'" value="ตั้งกระทู้ใหม่"/></center>
</body>
</html>