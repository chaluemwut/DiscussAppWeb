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
	#color1 {background-color:#5971AF; font-weight:bold; Color:#FFFFFF; }
	#color2 {background-color:#E1E9FC; Color:#000000;}
</style>
</head>
<body>
<%
	//ขั้นตอนที่ 1 โหลดคลาสไดรเวอร์
	Class.forName("org.gjt.mm.mysql.Driver");
	//ขั้นตอนที่ 2 เปิดการเชื่อมต่อไปยังระบบฐานข้อมูล
	Connection mycon = DriverManager.getConnection("jdbc:mysql://localhost:3306/andoird","root","pong084391"); 
	//ขั้นตอนที่ 3 ติดต่อกับฐานข้อมูลโดยใช้คำสั่ง SQL
	Statement stmt = mycon.createStatement();
	
	ResultSet myresult = stmt.executeQuery("SELECT *FROM board ");
		out.println("<center><b>เว็บบอร์ดแสดงความคิดเห็น<br></center><br>");		
		out.println("<center><table width=80% border=0 cellpadding=0 cellspacing=1 cellpadding=2>");
		out.println("<tr id=color1 align=center>");
		out.println("<td colspan=2>หัวข้อ</td>");
		out.println("<td>ผู้ถาม</td>");
		out.println("<td>ตอบ</td>");
		out.println("<td>ดู</td>");
		out.println("<td>โพสต์ครั้งสุดท้าย</td></tr><center>");	
	//ขั้นตอนที่ 4 จัดการกับผลลัพธ์ที่ได้จากคำสั่ง SQL
	while(myresult.next())
	{
		out.println("<tr id=color2 align=center>");
		out.println("<td width='3%'><img src='icon.gif'></td>");
		out.println("<td width='47%' align=left>&nbsp;<a href='view.jsp?id="+myresult.getString("id")+"' target='_new'>"+myresult.getString("topic")+"</a></td>");
		out.println("<td width='15%'>"+myresult.getString("name")+"</td>");
		out.println("<td width='7%'>"+myresult.getString("ans")+"</td>");
		out.println("<td width='8%'>"+myresult.getString("view")+"</td>");
		out.println("<td width='20%'><font face='MS Sans Serif' size='2'>"+myresult.getString("lastpost")+"<br>โดย <B><font color='#56426C' >"+myresult.getString("lastname")+"</font></B></font></td></tr>");
	}
	out.println(" </table>");
	
	out.println("<a href='addnew.jsp'>ตั้งคำถามใหม่</a>");
	myresult.close();
	stmt.close();
	mycon.close();
%>
</body>
</html>