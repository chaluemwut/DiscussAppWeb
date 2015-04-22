<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head link href="css/bootstrap.min.css" rel="stylesheet">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" name="viewport" content="width=device-width, initial-scale=1.0">
<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/bootstrap-responsive.min.css" rel="stylesheet">
<title>DiscussAppWeb</title>
<script type="text/javascript">
//<![CDATA[
	function redirect(url) {
		window.location.href = url;
	}
//]]>
</script>

<style type="text/css">
body {
background-image: img/bg2.jpg ;
background-attachment:fixed;
background-repeat: no-repeat; }
</style>
</head>
<body background="img/bg2.jpg"  >
<% String u = (String) request.getSession().getAttribute("userid"); %>
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
        <tr>
          <tr>
           <td><p>เลือกประเภทเว็บบอร์ด :
			    <select name="link" id="link" onchange="redirect(this.value);">
					<option value="1AllTopicNoLogin.jsp">อุปกรณ์อิเล็กทรอนิกส์</option>
					<option value="2AllTopicNoLogin.jsp">รถยนต์และรถมอเตอร์ไซค์</option>
					<option value="3AllTopicNoLogin.jsp">สัตว์เลี้ยง</option>
				</select>
			  </p></td>
        
        </tr>
       
        <tr>        
        <td>
        	<%
       			
        		//out.println(u);
				request.setCharacterEncoding("UTF-8");
			try {
				Class.forName("org.gjt.mm.mysql.Driver").newInstance();			
				Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/andoird", "root", "pong084391");
				//Class.forName("sun.jdbc.odbc.JdbcOdbcDriver").newInstance();
				//Connection con = DriverManager.getConnection("jdbc:odbc:andoird");
				Statement stmt = con.createStatement();
				ResultSet rs = stmt.executeQuery("select * from 1post order by topic_id DESC;");

			if(con != null) {
				if(rs != null) {
	%>
	       
			
				<table class="table  table-hover " style="width: 100%;">
    <thead>
    <center><br><h3>หมวด อุปกรณ์อิเล็กทรอนิกส์</h3>	<BR><BR>
        <tr>
            <th>รหัส</th>
            <th></th>
            <th>ชื่อกระทู้</th>
            <th>ชื่อคนโพส</th>
            <th>จำนวนตอบ-วันที่โพส</th>  
              
			  </tr>
    </thead>

					
	<%
					while(rs.next()) {
						String id = new String(rs.getString("topic_id").getBytes(),"TIS-620");
						String url="1ShowNo.jsp?id="+id;
	%>
					<tbody>
						<tr  >
						<TD ><%= id %></TD>
						<TD>
						 <img src=<%="images1/"+id+".png"%> class="img-responsive" width="70" height="70">
						</TD>
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
  				<center><a class="btn btn-danger" href="home.jsp" role="button">กลับหน้าหลัก</a></center>	
       
 				
       
       
        </td>
        
        </tr> 


</table></center>

<center><table background="img/bgtb.png"  border="1" bordercolor="white" cellpadding="10" cellspacing="0" style="width: 80%; " >
	  <tr>
           <td> <center> <img src="img/below1.png" width="100%" height="100%" align="middle" /></center></td>
      </tr> 

</table></center>





<script src="js/jquery.js"></script>
<script src="js/bootstrap.min.js"></script>
</body>
</html>