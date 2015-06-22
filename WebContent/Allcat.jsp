<%@page import="com.rmuti.Config"%>
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
<% String u = (String) request.getSession().getAttribute("userid"); 
Integer roleid = (Integer) request.getSession().getAttribute("role_id");
Integer catid = (Integer) request.getSession().getAttribute("cat_id"); 
if(u == null){
	response.sendRedirect("login.jsp");
}
if(roleid > 1){
	response.sendRedirect("home.jsp");
}
%>
<center><table background="img/bgtb.png"  border="1" bordercolor="white" cellpadding="10" cellspacing="0" style="width: 80%; " >
	  <tr>
           <td> <center> <img src="img/header.png" width="100%" height="100%" align="middle" /></center></td>
      </tr> 
       <tr>
       		<td><ul class="nav nav-tabs">
  			<li role="presentation" class="active"><a href="homeLogin.jsp">หน้าหลัก</a></li>
  			<li role="presentation"><a href="AboutLogin.jsp">เกี่ยวกับเรา</a></li>
 			<li role="presentation"><a href="ContactLogin.jsp">ติดต่อเรา</a></li>
 			<p align = "right" ><Font Size=2>สวัสดี คุณ &nbsp;&nbsp;<%out.println(u);%>&nbsp;<a href="logout.jsp">&nbsp;&nbsp;ออกจากระบบ</a></Font></p> 	

			</ul></td>
       </tr>
        <tr>
          
        <tr>        
        <td>
        	<%
       			
        		//out.println(u);
				request.setCharacterEncoding("UTF-8");
			try {
				Class.forName("org.gjt.mm.mysql.Driver").newInstance();			
				Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/"+Config.db_name,Config.db_user,Config.db_password);		
				Statement stmt = con.createStatement();
				String sql = "select  * from cat_id order by cat_id asc ";
				ResultSet rs = stmt.executeQuery(sql);
			if(con != null) {
				if(rs != null) {
	%>
	       
			
				<center><table class="table  table-hover " style="width: 80%;">
    <thead>
    <center><br><h3>หัวข้อทั้งหมด</h3>	<BR><BR>
        <tr>
            
          
            <th>ชื่อหมวดกระทู้</th>
            
            <th>ผู้ดูแล</th>
            <th>วันที่เพิ่ม</th>
            <th>จำนวนกระทู้</th> 
            <th>แก้ไข</th>
            <th>ลบ</th> 
            
			  </tr>
    </thead>

					
	<%
	
					while(rs.next()) {
						
						String id = new String(rs.getString("cat_id").getBytes(),"TIS-620");
						//String User =new String(rs.getString("username").getBytes(),"TIS-620");
						//session.setAttribute("UserDel", User); 	
						//session.setAttribute("UserDel", rs.getString(3));
							
						String url="ShowCatID.jsp?id="+id;
						
	%>
					<tbody>
						<tr  >	
						
						<TD>
						<A HREF="<%= url %>">						
						<%= new String(rs.getString("cat_topic").getBytes(),"TIS-620") %></A>
						</TD>
						<TD><%= new String(rs.getString("username").getBytes(),"TIS-620") %></TD>
						<TD><%= new String(rs.getString("date_time").getBytes(),"TIS-620") %></TD>
						<TD>
						<%= rs.getInt("num_reply") %>
						</TD>
						<TD>
						 <a href="EditUpdateCat.jsp?id=<%=rs.getString("cat_id")%>-<%=rs.getString("cat_topic")%>-<%=rs.getString("username")%>"><img src="img/edit.png" width="20" height="20" /></a>
						       
						</TD>
						<TD>
						 <a href="delCat.jsp?id=<%=rs.getString("cat_id")%>-<%=rs.getString("cat_topic")%>-<%=rs.getString("username")%>"><img src="img/delete.png" width="20" height="20"  /></a>
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
  				<center><a class="btn btn-primary" href="topic.jsp" role="button">เพิ่มกระทู้ใหม่</a></center><br>
       	<p align="center"><a  class="btn btn-danger" href="homeLogin.jsp" role="button">กลับไปหน้าแรก</a></p><br>
       
       
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