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
  			<li role="presentation" ><a href="homeLogin.jsp">หน้าหลัก</a></li>
  			<li role="presentation"><a href="AboutLogin.jsp">เกี่ยวกับเรา</a></li>
 			<li role="presentation" class="active"><a href="ContactLogin.jsp">ติดต่อเรา</a></li>
 			<p align = "right" ><Font Size=2>สวัสดี คุณ &nbsp;&nbsp;<%out.println(u);%>&nbsp;<a href="logout.jsp">&nbsp;&nbsp;ออกจากระบบ</a></Font></p> 	
			</ul></td>
       </tr>
        <tr>
                   
                  			<td> <h1><font size=5><p align="left">ผู้ดูแลระบบ</p></font></h1></td>
                   
                   </tr> 
                   
                    <tr>
                             <td><p1><font size=3><dd>1.นายศุภเดช  น้อยใหญ่ รหัสประจำตัว 553333013007-6</dd><br>
                               ดูแลระบบ  Andriod โทร.083-6608454
                             
                            </font> </p1></td>
                            
                            
                      </tr> 
                     
                      <tr>
                             
                             <td><p1><font size=3><dd>2.นายณัฐพล  ผงบุญตา  รหัสประจำตัว 553333013008-4</dd><br>
                             ดูแลระบบ   Web application โทร.084-3915843 <br>
        E-mail: Nut_tapon_12@hotmail.com
                          
                             
                           </font>  </p1></td>
                            
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