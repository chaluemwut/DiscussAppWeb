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
<style type="text/css">
body {
background-image: img/bg2.jpg ;
background-attachment:fixed;
background-repeat: no-repeat; }
</style>
</head>
<body background="img/bg2.jpg" >
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
  			<li role="presentation" class="active"><a href="home.jsp">หน้าหลัก</a></li>
  			<li role="presentation" ><a href="About.jsp">เกี่ยวกับเรา</a></li>
 			<li role="presentation"><a href="Contact.jsp">ติดต่อเรา</a></li>
 			<p align = "right" ><Font Size=2>สวัสดี คุณ &nbsp;&nbsp;<%out.println(u);%>&nbsp;<a href="logout.jsp">&nbsp;&nbsp;ออกจากระบบ</a></Font></p> 	
			</ul></td>
       </tr>
        <tr>
           <td><h3><center> ไม่สามารถสร้างกระทู้ได้ กรุณาลองใหม่ !!! </center></h3></td>
        
        </tr>
         <tr>
          <td> <p align="center"><a  class="btn btn-success" href="NewPost.jsp?id=<%=request.getParameter("id")%>" role="button">กลับไปสร้างกระทู้ใหม่</a></p><br></td>
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