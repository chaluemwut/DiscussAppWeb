<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head link href="css/bootstrap.min.css" rel="stylesheet">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" name="viewport" content="width=device-width, initial-scale=1.0">
<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/bootstrap-responsive.min.css" rel="stylesheet">
<title>NewPost</title>
</head>
<body>

<FORM name="form1" ACTION="NewPostBoard" METHOD="post" enctype="multipart/from-data" onSubmit="JavaScript:return fncSubmit();" >
		<center><br><h2>ตั้งกระทู้ใหม่</h2><BR><br></center>
		<center><TABLE>
		<TR><TD>ชื่อ</TD>
					<TD><INPUT TYPE="text" NAME="param_name"></TD></TR>
		<TR><TD>หัวข้อ</TD>
					<TD><INPUT TYPE="text" NAME="param_topic"></TD></TR>
		<TR><TD>เลือกรูปภาพ</TD>		
					<TD><INPUT TYPE="file" NAME="picture"></TD></TR>
		<TR><TD>รายละเอียด</TD>
					<TD><TEXTAREA NAME="param_desc" COLS="20" ROWS="5"></TEXTAREA></TD></TR>
		<TR><TD></TD>
					<TD COLSPAN=2>
					 <input class="btn btn-primary" type="submit" value="ส่งข้อมูล">
				     <input class="btn btn-info" type="reset" value="เคลียร์">
					</TR>
		</TABLE>
	</center></FORM>
<script language="javascript">
function fncSubmit()
{
	if(document.form1.param_name.value == "")
	{
		alert('มีชื่อไหม ถ้ามีก้อใส่ซะ');
		document.form1.param_name.focus();
		return false;
	}	
	if(document.form1.param_topic.value == "" )
	{
		alert('หัวข้อไม่ใส่จะมาตั้งกระทู้ทำเพื่อ');
		document.form1.param_topic.focus();		
		return false;
	}
	if(document.form1.param_desc.value == "")
	{
		alert('ใส่รายละเอียดด้วยนะ');
		document.form1.param_desc.focus();
		return false;
	}	
				
	document.form1.submit();
}

</script>



<script src="js/jquery.js"></script>
<script src="js/bootstrap.min.js"></script>
</body>
</html>