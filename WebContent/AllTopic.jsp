<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head link href="css/bootstrap.min.css" rel="stylesheet">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" name="viewport" content="width=device-width, initial-scale=1.0">
<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/bootstrap-responsive.min.css" rel="stylesheet">
<title>เว็บบอร์ด</title>
</head>
<body>

<%
		request.setCharacterEncoding("UTF-8");
		try {
			Class.forName("org.gjt.mm.mysql.Driver").newInstance();			
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/andoird", "root", "pong084391");
			//Class.forName("sun.jdbc.odbc.JdbcOdbcDriver").newInstance();
			//Connection con = DriverManager.getConnection("jdbc:odbc:andoird");
			Statement stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery("select * from post");

			if(con != null) {
				if(rs != null) {
	%>
			<center><br><h2>หัวข้อกระทู้ทั้งหมด</h2>	<BR><BR>
	<table class="table  table-hover " style="width: 80%;">
    <thead>
        <tr>
            <th>รหัส</th>
            <th>ชื่อกระทู้</th>
            <th>ชื่อคนโพส</th>
            <th>จำนวนตอบ-วันที่โพส</th>  
              
			  </tr>
    </thead>

					
	<%
					while(rs.next()) {
						String id = new String(rs.getString("topic_id").getBytes(),"TIS-620");
						String url="ShowTopic.jsp?id="+id;
	%>
					<tbody>
						<tr  >
						<TD ><%= id %></TD>
						<TD>
						<A HREF="<%= url %>">						
						<%= new String(rs.getString("topic").getBytes(),"TIS-620") %></A>
						</TD>
						<TD><%= new String(rs.getString("owner").getBytes(),"TIS-620") %></TD>
						<TD>
						(<%= rs.getInt("num_reply") %>-<%= rs.getString("date_time") %>)
						</TD>
						</tr>
	<%
	
					}
	%>
	
	</tbody>					
	</table></center>
				
	<%
				}
				rs.close();
				stmt.close();
				con.close();
			}
		} catch(Exception e) {
			out.print("เกิดข้อผิดพลาดกับการแสดงกระทู้ทั้งหมด");
			System.out.println(e);
		}
		
	%>
	
  <br>	
  <center><a class="btn btn-primary btn-lg" href="NewPost.jsp" role="button">ตั้งกระทู้ใหม่</a></center>	
	  	
<script src="js/jquery.js"></script>
<script src="js/bootstrap.min.js"></script>
</body>
</html>