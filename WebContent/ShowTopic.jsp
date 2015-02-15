<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%
	request.setCharacterEncoding("UTF-8");
	String topic="";
	String topic_id="";
	try {
		
		Class.forName("org.gjt.mm.mysql.Driver").newInstance();			
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/andoird", "root", "pong084391");
		//Class.forName("sun.jdbc.odbc.JdbcOdbcDriver").newInstance();
		//Connection con = DriverManager.getConnection("jdbc:odbc:andoird");
		Statement stmt = con.createStatement();
		String sql = "select * from post where topic_id='"+request.getParameter("id")+"'";
		String sql2 = "select * from post_reply where topic_id='"+request.getParameter("id")+"'";
		ResultSet rs = stmt.executeQuery(sql);
		if(con != null) {
			if(rs != null) {
				while(rs.next()) {
					topic_id = new String(rs.getString("topic_id").getBytes(),"TIS-620"); 
					topic = new String(rs.getString("topic").getBytes(),"TIS-620");
%>
					<html lang="en">
					<head link href="css/bootstrap.min.css" rel="stylesheet">
					<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" name="viewport" content="width=device-width, initial-scale=1.0">
					<link href="css/bootstrap.min.css" rel="stylesheet">
					<link href="css/bootstrap-responsive.min.css" rel="stylesheet">
					<meta http-equiv="Content-Type" content="text/html; charset=TIS-620">
					<title><%=topic_id%> <%=topic %></title>
					</head>
					<body>
					
					<br><center><H3>หัวข้อเรื่อง <%=topic %></H3></center><br>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;รายละเอียด : 	<%= new String(rs.getString("description").getBytes(),"TIS-620") %><br><br>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;จากคุณ : <%= new String(rs.getString("owner").getBytes(),"TIS-620") %><br>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;วันที่ : <%= new String(rs.getString("date_time").getBytes(),"TIS-620") %><hr><br>
				
					<h4>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;ตอบ</h4><hr>
					
<%
				}
			}
			rs.close();

			ResultSet rs2 = stmt.executeQuery(sql2);
			if(rs2 != null) {
				while(rs2.next()) {
%>
					<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;รายละเอียด : <%= new String(rs2.getString("description").getBytes(),"TIS-620") %><br><br>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;จากคุณ : <%= new String(rs2.getString("name").getBytes(),"TIS-620") %><br>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;วันที่ : <%= new String(rs2.getString("date_time").getBytes(),"TIS-620") %><HR>
					
					
<%
				}
			}
			rs2.close();
			stmt.close();
			con.close();
		}
	} catch(Exception e) {
		out.print("เกิดข้อผิดพลาดกับการแสดงกระทู้");
		System.out.println(e);
	}
%>
<FORM ACTION="PostReply" METHOD="post">
		
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a class="btn btn-danger" href="AllTopic.jsp" role="button">ดูกระทู้ทั้งหมด</a>
		<center><TABLE>
		<h3>ตอบกระทู้</h3>
		<TR><TD><p  class="lead">ชื่อ</p></TD>
					<TD><INPUT TYPE="text" NAME="param_name"></TD></TR>
		<TR><TD><p  class="lead">รายละเอียด</p></TD>
					<TD><TEXTAREA NAME="param_desc" COLS="20" ROWS="5"></TEXTAREA></TD></TR>
		<TR><TD></TD>
				  <TD COLSPAN=2>
				  <input class="btn btn-primary" type="submit" value="ส่งข้อมูล">
				  <input class="btn btn-info" type="reset" value="เคลียร์">
		          </TD></TR>
	</TABLE></center>
	<INPUT TYPE="hidden" NAME="id" VALUE="<%=request.getParameter("id")%>">
</FORM>
<BR>
 

<script src="js/jquery.js"></script>
<script src="js/bootstrap.min.js"></script>
</body>
</html>