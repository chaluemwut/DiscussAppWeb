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
  
  <%//----------------------------------------------------------------------------------------------- %> 
<center><table background="img/bgtb.png"  border="1" bordercolor="white" cellpadding="10" cellspacing="0" style="width: 80%; " >
	  <tr>
           <td> <center> <img src="img/header.png" width="100%" height="100%" align="middle" /></center></td>
      </tr> 
       <tr>
       		<td><ul class="nav nav-tabs">
  			<li role="presentation"><a href="homeLogin.jsp">หน้าหลัก</a></li>
  			<li role="presentation"><a href="AboutLogin.jsp">เกี่ยวกับเรา</a></li>
 			<li role="presentation"><a href="ContactLogin.jsp">ติดต่อเรา</a></li>
 			<p align = "right" ><Font Size=2>สวัสดี คุณ &nbsp;&nbsp;<%out.println(u);%> &nbsp;<a href="logout.jsp">&nbsp;&nbsp;ออกจากระบบ</a></Font></p> 	
			
			</ul></td>
       </tr>
       
      
        
        
       
         <%//----------------------------------------------------------------------------------------- %>
        <tr>        
        <td> 
        	<center><table background="img/bgtb.png"  border="1" bordercolor="white" cellpadding="10" cellspacing="0" style="width:90%; " >
        	 <tr>        
             <td> 
             	<br><center><H3>รายชื่อสมาชิก</H3></center><br>	
             <center>  <table class="table table-hover" style="width: 100%;">
        	  
        	     <thead>          
        	            <tr >
        	       
        	            
        	            <th>ชือผู้ใช้</th>          
        	            <th>รหัสผ่าน</th>    
        	            <th>ชื่อจริง</th> 	             
        	             <th>สถานะผู้ใช้</th> 
        	               <th>แก้ไข</th> 
        	             <th>ลบ</th> 
        	           
        				</tr>
        		</thead>	   		
        	      

        						
                 
        		<%
       			
        		request.setCharacterEncoding("UTF-8");	
        		
        	                   
        		try {      			      	        
        		
        			
        			Class.forName("org.gjt.mm.mysql.Driver").newInstance();			
        			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/"+Config.db_name+"?characterEncoding=utf-8",Config.db_user,Config.db_password);   			
        			Statement stmt = con.createStatement();
        			String sql = "(select * from tb_user where role_id= "+1+" ORDER BY user_id DESC )";    
        			String sql2 = "(select * from tb_user where role_id= "+2+" ORDER BY user_id DESC)";  
        			String sql3 = "(select * from tb_user where role_id= "+3+" ORDER BY user_id DESC)";  
        			ResultSet rs = stmt.executeQuery(sql);
        			
        			
        			if(con != null) {
        				if(rs != null) {
        					while(rs.next()) {
        						
        	%>
        			<tr>		 
						
				     <td><%= new String(rs.getString("username").getBytes()) %></td>					
					 <td><%= new String(rs.getString("password").getBytes()) %></td>
					  <td><%= new String(rs.getString("name").getBytes()) %></td>					 
					   <td>ผู้ดูแลระบบ</td>
					   <td> <a href="EditUpdateUser.jsp?id=<%=rs.getString("user_id")%>"><img src="img/edit.png" width="20" height="20" /></a></td>
					
        			</tr>   	 
        	<%
        					
        				}
        				rs.close();  
        				ResultSet rs2 = stmt.executeQuery(sql2);
        				if(rs2 != null) {
        					while(rs2.next()) {	
        	%>			<tr>	
        					 <td><%= new String(rs2.getString("username").getBytes()) %></td>					
        					 <td><%= new String(rs2.getString("password").getBytes()) %></td>
        					  <td><%= new String(rs2.getString("name").getBytes()) %></td>         					
        					  <td>ดูแล<%= new String(rs2.getString("cat_topic").getBytes()) %></td>
        					  <td> <a href="EditUpdateUser.jsp?id=<%=rs2.getString("user_id")%>"><img src="img/edit.png" width="20" height="20" /></a></td>
					          <td><a href="delUser.jsp?id=<%=rs2.getString("user_id")%>"><img src="img/delete.png" width="20" height="20"  /></a><td>
        				</tr>
        
        
        	<% 				
        				
        					}	
        				}
        				rs2.close();
        				ResultSet rs3 = stmt.executeQuery(sql3);
        				if(rs3 != null) {
        					while(rs3.next()) {	
        	%>			<tr>	
        					 <td><%= new String(rs3.getString("username").getBytes()) %></td>					
        					 <td><%= new String(rs3.getString("password").getBytes()) %></td>
        					  <td><%= new String(rs3.getString("name").getBytes()) %></td>           					 
        					     <td>ผู้ใช้ทั่วไป</td>
        					 <td> <a href="EditUpdateUser.jsp?id=<%=rs3.getString("user_id")%>"><img src="img/edit.png" width="20" height="20" /></a></td>
							<td><a href="delUser.jsp?id=<%=rs3.getString("user_id")%>"><img src="img/delete.png" width="20" height="20"  /></a><td>
        				</tr>
        
        
        	<% 				
        				
        					}	
        				}
        				rs3.close();			
        				
        				
        				}}
        				stmt.close();
        				con.close();
        			
        		} catch(Exception e) {
        			out.print("เกิดข้อผิดพลาดกับการแสดงกระทู้");
        			System.out.println(e);
        		}

        	%>

        	</table></center>

        	
        
        	<p align="center"><a  class="btn btn-success" href="homeLogin.jsp" role="button">กลับไปหน้าแรก</a></p><br>

        	


        	</table></center></td></tr></table></center>


        	 

        	<center><table background="img/bgtb.png"  border="1" bordercolor="white" cellpadding="10" cellspacing="0" style="width: 80%; " >
        		  <tr>
        	           <td> <center> <img src="img/below1.png" width="100%" height="100%" align="middle" /></center></td>
        	      </tr> 

        	</table></center>


        	<script src="js/jquery.js"></script>
        	<script src="js/bootstrap.min.js"></script>
        	</body>
        	</html>