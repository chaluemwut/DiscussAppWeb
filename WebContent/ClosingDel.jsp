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

<%String u = (String) request.getSession().getAttribute("userid");
Integer roleid = (Integer) request.getSession().getAttribute("role_id");
Integer catid = (Integer) request.getSession().getAttribute("cat_id");
if(u == null){
	response.sendRedirect("login.jsp");
}
if(roleid != 1){
	response.sendRedirect("login.jsp");
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
 			<p align = "right" ><Font Size=2>สวัสดี คุณ &nbsp;&nbsp;<%out.println(u);%><a href="logout.jsp">&nbsp;&nbsp;ออกจากระบบ</a></Font></p> 	
			</ul></td>
       </tr>
        
     
       
        
        
                 <%//----------------------------------------------------------------------------------------- %>
        <tr>        
        <td> 
<%
	
request.setCharacterEncoding("UTF-8");

Connection connect = null;
Statement s = null;


try {
	Class.forName("com.mysql.jdbc.Driver");
	
	connect = DriverManager.getConnection("jdbc:mysql://localhost:3306/"+Config.db_name,Config.db_user,Config.db_password);
	s = connect.createStatement();	
 
	
	String sql = "select * from post where top_id = 2 order by topic_id DESC;" ;
	
	System.out.println(sql);
	
	ResultSet rec = s.executeQuery(sql);
	
	
	
    
	%>
	<center><table class="table  table-hover " style="width: 80%;">
    		        <thead>
    		        <center><br><h3>กระทู้ที่แจ้งลบ</h3>	<BR><BR>
    		            <tr>
    		               
    		                <th></th>
    		                <th>ชื่อกระทู้</th>
    		                <th>ชื่อคนโพส</th>
    		                <th>จำนวนตอบ-วันที่โพส</th>
    		                 <th>แก้ไข</th>       
                             <th>ลบ</th>   
    		                  
    		    			  </tr>
    		        </thead>
    		 
    		 
    		        
		<%while((rec!=null) && (rec.next())) { 
			
			          
			
    		    		String id = new String(rec.getString("topic_id").getBytes());
    					String img = new String(rec.getString("img").getBytes());
    					String url="ShowTopic.jsp?id="+id;

    					
    					
    					%>	
    				
    					<tbody>
    		    						<tr  >
    		    						
    		    						<TD>
    		    						 <img src=<%="images/"+img%> class="img-responsive" width="70" height="70">
    		    						</TD>
    		    						<TD>
    		    						<A HREF="<%= url %>">						
    		    						<%= new String(rec.getString("topic").getBytes()) %></A>
    		    						</TD>
    		    							<TD><%= new String(rec.getString("owner").getBytes()) %></TD>
    		    						<TD>
    		    						(<%= rec.getInt("num_reply") %>-<%= rec.getString("date_time") %>)
    		    						</TD>
    		    						<% 		  
					if(roleid ==1){	
			%>		
					<td> <a href="EditUpdateTopic.jsp?id=<%=rec.getString("topic_id")%>"><img src="img/edit.png" width="20" height="20" /></a></td>
					<td><a href="delTopic.jsp?id=<%=rec.getString("topic_id")%>"><img src="img/delete.png" width="20" height="20"  /></a><td>
			
					
			<%
					}
					
			%>		
    		    						</tr>
    		    	
    				
    				<%
    				}		
	
    				%>
      
 </center> 	</table>
  	     
  	 
    <%	
  	} catch (Exception e) {
		// TODO Auto-generated catch block
		out.print("เกิดข้อผิดพลาดกับการโหลดไดรเวอร์");
		e.printStackTrace();
	}

	try {
		if(s!=null){
			s.close();
			connect.close();
		}
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		out.print("เกิดข้อผิดพลาดกับการโหลดไดรเวอร์");
		e.printStackTrace();
	}
%>
   
   
   
 <p align="center"><a  class="btn btn-danger" href="homeLogin.jsp" role="button">กลับไปยังหมวดกระทู้</a></p><br>   
   
   
          </td></tr></table></center>
   
   
   
   
   
   </td></tr>
   
   
   
   
   
   
  
   
   
   
</table></center>
<center><table background="img/bgtb.png"  border="1" bordercolor="white" cellpadding="10" cellspacing="0" style="width: 80%; " >
  <tr>
       <td> <center> <img src="img/below1.png" width="100%" height="100%" align="middle" /></center></td>
  </tr> 

</table></center>

<script language="javascript">
function fncSubmit()
{

if(document.formSearch.txtKeyword.value == "" )
{
	alert('กรุณาใส่หัวข้อกระทู้ที่จะค้นหา');
	document.formSearch.cat_topic.focus();		
	return false;
}


			
document.formSearch.submit();
}

</script>


<script src="js/jquery.js"></script>
<script src="js/bootstrap.min.js"></script>
</body>
</html>       