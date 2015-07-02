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
<body background="img/bg2.jpg" style="height: 54px; ">
<br>
<%
if (session.getAttribute("userid") != null) {
			} else if (request.getCookies() != null) {
				String cookieName = "ck_user";
				Cookie cookies[] = request.getCookies();
				Cookie myCookie = null;
		   if (cookies != null) {
				for (int i = 0; i < cookies.length; i++) {
		   if (cookies[i].getName().equals(cookieName)) {
				myCookie = cookies[i];
			break;
		   }
				}
		   }
	 	if (myCookie != null) {
			session.setAttribute("userid", myCookie.getValue());
		}
		}
if (session.getAttribute("userid") == null) {


%>
<form name="form1" action="Login" method="post" onSubmit="JavaScript:return fncSubmit();">
<center><table background="img/bgtb.png"  border="1" bordercolor="white" cellpadding="10" cellspacing="0" style="width: 80%; " >
	  <tr>
           <td> <center> <img src="img/header.png" width="100%" height="100%" align="middle" /></center></td>
      </tr> 
       <tr>
       		<td><ul class="nav nav-tabs">
  			<li role="presentation"><a href="home.jsp">หน้าหลัก</a></li>
  			<li role="presentation"><a href="About.jsp">เกี่ยวกับเรา</a></li>
 			<li role="presentation"><a href="Contact.jsp">ติดต่อเรา</a></li>
 			<p align = "right" ><Font Size=2><a href="register.jsp">&nbsp;&nbsp;สมัครสมาชิก</a>&nbsp;<a href="login.jsp">&nbsp;&nbsp;เข้าสู่ระบบ</a></Font></p> 		
			</ul></td>
       </tr>
        <tr>
           <td>
           <br>    
        
			<P1><center><Font Size=5>Login</Font></center></p1>
			<br><center><table border="1" bordercolor="White" cellpadding="10" cellspacing="0" >
                    
                    <tr>
                             <td>User name :</td>
                             <td><input type="text" name="user" /></td>
                            
                      </tr> 
                     
                      <tr>
                             
                             <td>password :</td>
                             <td><input type="password" name="pwd" /></td>
                      </tr>
                      <tr>
                      		<td colspan="2" align="center">
							<input type="checkbox" name="save" value="1" />จำค่าล็อกอิน<br />	</td>	
						</tr>	
					
  </table> 
	 

<br><input  class="btn btn-success" type="submit" value="Login" /><br>
<p align="right">* หากมีปัญหาในการเข้าระบบให้ติดต่อผู้ดูแลระบบ<a href="Contact.jsp">!!คลิก</a></p>

</center>
           
           
           
		 </td>
        
        </tr>
 <%
}else{
	   response.sendRedirect("homeLogin.jsp");

}
 %>      


</table></center>

<center><table background="img/bgtb.png"  border="1" bordercolor="white" cellpadding="10" cellspacing="0" style="width: 80%; " >
	  <tr>
           <td> <center> <img src="img/below1.png" width="100%" height="100%" align="middle" /></center></td>
      </tr> 

</table></center>
	

</form>

<script language="javascript">
function fncSubmit()
{
	if(document.form1.user.value == "")
	{
		alert('กรุณาใส่ชื่อ');
		document.form1.user.focus();
		return false;
	}	
	if(document.form1.pwd.value == "" )
	{
		alert('กรุณาใส่ Password');
		document.form1.pwd.focus();		
		return false;
	}
	
				
	document.form1.submit();
}

</script>





<script src="js/jquery.js"></script>
<script src="js/bootstrap.min.js"></script>
</body>
</html>