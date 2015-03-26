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

<FORM name="form1" ACTION="NewPostBoard2" METHOD="post" enctype="multipart/form-data" onSubmit="JavaScript:return fncSubmit();" >

<center><table background="img/bgtb.png"  border="1" bordercolor="white" cellpadding="10" cellspacing="0" style="width: 80%; " >
	  <tr>
           <td> <center> <img src="img/header.png" width="100%" height="100%" align="middle" /></center></td>
      </tr> 
       <tr>
       		<td><ul class="nav nav-tabs">
  			<li role="presentation" class="active"><a href="homeLogin.jsp">หน้าหลัก</a></li>
  			<li role="presentation"><a href="AboutLogin.jsp">เกี่ยวกับเรา</a></li>
 			<li role="presentation"><a href="ContactLogin.jsp">ติดต่อเรา</a></li>
 			<p align = "right" ><Font Size=2>สวัสดี คุณ &nbsp;&nbsp;<%out.println(u);%>&nbsp;<a href="logout.jsp">&nbsp;&nbsp;เข้าสู่ระบบ</a></Font></p> 	

			</ul></td>
       </tr>
        <tr>
          <tr>
           <td><p>เลือกประเภทเว็บบอร์ด :
			    <select name="link" id="link" onchange="redirect(this.value);">
				
					<option value="2AllTopic.jsp">รถยนต์และรถมอเตอร์ไซค์</option>
					<option value="1AllTopic.jsp">อุปกรณ์อิเล็กทรอนิกส์</option>					
					<option value="3AllTopic.jsp">สัตว์เลี้ยง</option>
				</select>
			  </p></td>
        
        </tr>
       
        <tr>
        <td>
      
         <center><TABLE>
		<center><br><h2>ตั้งกระทู้ใหม่</h2><BR><br></center>
		<TR><TD>ชื่อ</TD>
					<TD><p><Font Size=4><%out.println(u);%></Font></p></TD></TR> 
		<TR><TD>หัวข้อ</TD>
					<TD><INPUT TYPE="text" NAME="param_topic"></TD></TR>
		
		<TR><TD>รายละเอียด</TD>
					<TD><TEXTAREA NAME="param_desc" COLS="20" ROWS="5"></TEXTAREA></TD></TR>
		
		<TR><TD>เลือกรูปภาพ</TD>		
					<TD><INPUT TYPE="file" NAME="img_pd"></TD></TR>
		<TR><td></td>
					<TD COLSPAN=2>
					 <input class="btn btn-primary" type="submit" value="ตกลง">
				     <input class="btn btn-info" type="reset" value="เคลียร์">
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
	
	if(document.form1.param_topic.value == "" )
	{
		alert('กรุณาใส่หัวข้อกระทู้');
		document.form1.param_topic.focus();		
		return false;
	}
	if(document.form1.param_desc.value == "")
	{
		alert('ใส่รายละเอียดด้วยนะ');
		document.form1.param_desc.focus();
		return false;
	}	
	if(document.form1.img_pd.value == "")
	{
		alert('กรุณาใส่รูปภาพด้วยนะ');
		document.form1.img_pd.focus();
		return false;
	}	
				
	document.form1.submit();
}

</script>


         


<script src="js/jquery.js"></script>
<script src="js/bootstrap.min.js"></script>
</body>
</html>