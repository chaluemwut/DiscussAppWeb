<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head link href="css/bootstrap.min.css" rel="stylesheet">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" name="viewport" content="width=device-width, initial-scale=1.0">
<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/bootstrap-responsive.min.css" rel="stylesheet">
<title>login</title>
</head>
<body style="height: 54px; ">
<br>

	
<form name="form1" action="Login" method="post" onSubmit="JavaScript:return fncSubmit();">
<br><br><center><img src="img/logo2.1.png" width="200" height="200" align="middle"  ></center>


<br><center><table border="1" bordercolor="White" cellpadding="10" cellspacing="0" >
                    
                    <tr>
                             <td>User name :</td>
                             <td><input type="text" name="user" /></td>
                            
                      </tr> 
                     
                      <tr>
                             
                             <td>password :</td>
                             <td><input type="password" name="pwd" /></td>
                      </tr>
  </table> 

<br><input  class="btn btn-success" type="submit" value="Login" />
&nbsp;&nbsp;<input class="btn btn-danger"  type="button" onclick="window.location.href='register.jsp'" value="Register"/>

</center></form>

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