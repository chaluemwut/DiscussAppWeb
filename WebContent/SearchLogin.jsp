<%@page import="com.rmuti.Config"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %> 
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>      
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
       
       
     <tr>        
        <td> 
        	<center><table background="img/bgtb.png"  border="1" bordercolor="white" cellpadding="10" cellspacing="0" style="width: 80%; " >
        	 <tr>        
             <td>   
       				<%
	String keyword = "";
	if(request.getParameter("txtKeyword") != null) {
		keyword = com.rmuti.db.Utility.convertThai(request.getParameter("txtKeyword"));
		
	}
%>

<form name="formSearch" method="get" action="SearchLogin.jsp" onSubmit="JavaScript:return fncSubmit();">
    <center><table background="img/bgtb.png"  border="1" bordercolor="white" cellpadding="10" cellspacing="0" style="width: 80%; " >
	    <tr>
	      <th>กระทู้ที่สนใจ
	      <input name="txtKeyword" type="text" id="txtKeyword" value="<%=keyword%>">
	       <input  class="btn btn-danger" type="submit" value="ค้นหา"></th>
	       
	       	       
	    </tr>
	  </table></center>
	</form>

	<%
	request.setCharacterEncoding("UTF-8");
	
	Connection connect = null;
	Statement s = null;
	
	
	try {
		Class.forName("com.mysql.jdbc.Driver");
		
		connect = DriverManager.getConnection("jdbc:mysql://localhost:3306/"+Config.db_name,Config.db_user,Config.db_password);
		s = connect.createStatement();
		
		String keyword1 = com.rmuti.db.Utility.convertThai(request.getParameter("txtKeyword"));
		
	  if(keyword1.equals("") ){
			  out.println("กรุณาใส่คำที่จะค้นหา !!");
	  }else{
		
		
		String sql = "SELECT * FROM  post WHERE topic like '%" +keyword1+ "%' OR  topic like '" +keyword1+ "%' " +  
		" ORDER BY topic_id DESC";
		
		System.out.println(sql);
		
		ResultSet rec = s.executeQuery(sql);
		
		
		
        
		%>
		<table class="table  table-hover " style="width: 100%;">
        		        <thead>
        		        <center><br><h3>กระทู้ที่ค้นหา</h3>	<BR><BR>
        		            <tr>
        		               
        		                <th></th>
        		                <th>ชื่อกระทู้</th>
        		                <th>ชื่อคนโพส</th>
        		                <th>จำนวนตอบ-วันที่โพส</th>  
        		                  
        		    			  </tr>
        		        </thead>
        		 
        		 
        		        
			<%while((rec!=null) && (rec.next())) { 
				
				          
				
        		    		String id = new String(rec.getString("topic_id").getBytes(),"TIS-620");
        					String img = new String(rec.getString("img").getBytes(),"TIS-620");
        					String top_id = new String(rec.getString("top_id").getBytes(),"TIS-620");
        					String url="ShowTopic.jsp?id="+id;
    
        					
        					Integer top = Integer.valueOf(top_id);	
            				if(top < 2){
        					%>	
        				
        					<tbody>
        		    						<tr  >
        		    						
        		    						<TD>
        		    						 <img src=<%="images/"+img%> class="img-responsive" width="70" height="70">
        		    						</TD>
        		    						<TD>
        		    						<A HREF="<%= url %>">						
        		    						<%= new String(rec.getString("topic").getBytes(),"TIS-620") %></A>
        		    						</TD>
        		    							<TD><%= new String(rec.getString("owner").getBytes(),"TIS-620") %></TD>
        		    						<TD>
        		    						(<%= rec.getInt("num_reply") %>-<%= rec.getString("date_time") %>)
        		    						</TD>
        		    						</tr>
        		    	
        				
        				<%
        				}		
			}
        				%>
	      
	  	</table>
	  	     
	  	 
	    <%	
	  }
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