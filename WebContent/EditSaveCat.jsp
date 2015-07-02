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

if(u == null){
	response.sendRedirect("login.jsp");
}
%>



<FORM name="form1" ACTION="" METHOD="post" enctype="multipart/form-data" onSubmit="JavaScript:return fncSubmit();" >

<center><table background="img/bgtb.png"  border="1" bordercolor="white" cellpadding="10" cellspacing="0" style="width: 80%; " >
	  <tr>
           <td> <center> <img src="img/header.png" width="100%" height="100%" align="middle" /></center></td>
      </tr> 
       <tr>
       		<td><ul class="nav nav-tabs">
  			<li role="presentation"><a href="homeLogin.jsp">หน้าหลัก</a></li>
  			<li role="presentation"><a href="AboutLogin.jsp">เกี่ยวกับเรา</a></li>
 			<li role="presentation"><a href="ContactLogin.jsp">ติดต่อเรา</a></li>
 			<p align = "right" ><Font Size=2>สวัสดี คุณ &nbsp;&nbsp;<%out.println(u);%>&nbsp;<a href="logout.jsp">&nbsp;&nbsp;ออกจากระบบ</a></Font></p> 	

			</ul></td>
       </tr>
        
          
       
        <tr>
        <td>
           <center><TABLE>
        
<%


Connection con = null;	
Statement  stmt= null; 
		try {
			Class.forName("org.gjt.mm.mysql.Driver").newInstance();			
			 con = DriverManager.getConnection("jdbc:mysql://localhost:3306/"+Config.db_name+"?characterEncoding=utf-8",Config.db_user,Config.db_password);
			 stmt = con.createStatement();
			
			// String stmtcat_id = com.rmuti.db.Utility.convertThai(request.getParameter("id"));
			 String stmttopic =com.rmuti.db.Utility.convertThai(request.getParameter("cat_topic"));
			 String username =com.rmuti.db.Utility.convertThai(request.getParameter("username"));
			 String password =com.rmuti.db.Utility.convertThai(request.getParameter("password"));
			 
			 String stmtcat_id =request.getParameter("id");
			// String stmttopic =request.getParameter("cat_topic");
			// String username =request.getParameter("username");
			// String password =request.getParameter("password");
			 
			String[] parts = stmtcat_id.split("-");
			String partID = parts[0]; // ID
	     	String partTopic = parts[1];// topicp
	    	String partName = parts[2]; // Name
		       	
	
		       	
	
String sql = "UPDATE cat_id " +
			"SET cat_topic = '"+ stmttopic + "' " +
			", username= '"+ username + "' " +	
			" WHERE cat_id = '" + partID + "' ";
		    
String sql2 = "UPDATE tb_user " +
		"SET username = '"+ username+ "' " +
		", 	password = '"+ password+ "' " +			
		", name = '"+ username + "' " +	
		", cat_topic = '"+ stmttopic + "' " +	
		" WHERE username = '" + partName+ "'AND  cat_topic = '" + partTopic + "' ";		    
			
     stmt.execute(sql);
     stmt.execute(sql2);
    
     out.println("แก้ไขเรียบร้อยแร้ว");
  		
	} catch (Exception e) {
		// TODO Auto-generated catch block
		out.println(e.getMessage());
		e.printStackTrace();
	}

	try {
		if(stmt!=null){
			stmt.close();
			con.close();
		}
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		out.println(e.getMessage());
		e.printStackTrace();
	}
%>        
      	
      
		
		
		<br><br><br>
		
		<TR><td></td>
					<TD >
					 <a class="btn btn-danger" href="Allcat.jsp" role="button">กลับ</a>
				  
					</TD></TR>
					
		</TABLE>
	</center>

        
        
        </td>
        </tr>

</table></center>

<center><table background="img/bgtb.png"  border="1" bordercolor="white" cellpadding="10" cellspacing="0" style="width: 80%; " >
	  
	  <tr>
           <td> <center> <img src="img/below1.png" width="100%" height="100%" align="middle" /></center></td>
      </tr> 

</table></center></FORM>

<script language="javascript">
function fncSubmit()
{
	
	if(document.form1.cat_topic.value == "" )
	{
		alert('กรุณาใส่หัวข้อกระทู้');
		document.form1.cat_topic.focus();		
		return false;
	}
	
				
	document.form1.submit();
}


</script>
         


<script src="js/jquery.js"></script>
<script src="js/bootstrap.min.js"></script>
</body>
</html>