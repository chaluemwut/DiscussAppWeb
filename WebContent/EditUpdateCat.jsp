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
 			<p align = "right" ><Font Size=2>สวัสดี คุณ &nbsp;&nbsp;<%out.println(u);%>&nbsp;<a href="logout.jsp">&nbsp;&nbsp;ออกจากระบบ</a></Font></p> 	

			</ul></td>
       </tr>
        
          
       
        <tr>
        <td>
           <center><TABLE>
        
<%
String user = (String) request.getSession().getAttribute("UserDel"); 
Connection con = null;	
Statement  stmt= null; 
		try {
			Class.forName("org.gjt.mm.mysql.Driver").newInstance();			
			 con = DriverManager.getConnection("jdbc:mysql://localhost:3306/andoird", "root", "pong084391");
			 stmt = con.createStatement();
			 
			    String stmtid = com.rmuti.db.Utility.convertThai(request.getParameter("id"));
				String[] parts = stmtid.split("-");
				String partID = parts[0]; // ID
		     	String partTopic = parts[1];// topicp
		    	String partName = parts[2]; // Name
			       	
		
			    
				String sql = "SELECT * FROM  cat_id WHERE cat_id = '" + partID + "'  ";
				String sql2 = "SELECT * FROM  tb_user WHERE username = '" + partName + "'AND  cat_topic = '" + partTopic + "'  ";
	
			ResultSet rec = stmt.executeQuery(sql);
			
		if(rec != null) {			
				rec.next();
				
		%>
<FORM name="form1" ACTION="EditSaveCat.jsp?id=<%=rec.getString("cat_id")%>-<%=rec.getString("cat_topic")%>-<%=rec.getString("username")%>" METHOD="post"  onSubmit="JavaScript:return fncSubmit();" >	
		
         <center><TABLE>
		<center><br><h2>แก้ไข</h2><BR><br></center>
		
					<TR><TD>หัวข้อ  &nbsp; &nbsp;<INPUT TYPE="text" NAME="cat_topic" value="<%=rec.getString("cat_topic")%>"></TD></TR>
		                    
		            
		
				
		
	<%}
		rec.close();
	
		ResultSet rec2 = stmt.executeQuery(sql2);
		if(rec2 != null) {			
			rec2.next();
			
			
	
	%>	
		
		 <tr><td>ชื่อผู้ดูแล  &nbsp;<input type="text" name="username" value="<%=rec2.getString("username")%>"></td>	</tr>	           
		  <tr><td>รหัสผ่าน <input type="text" name="password" value="<%=rec2.getString("password")%>"></td></tr>           
		
		</table> 
		<br>
		
		
		
	<input class="btn btn-danger"  type="submit" value="แก้ไข"> <a class="btn btn-danger" href="Allcat.jsp" role="button">ยกเลิก</a>

</FORM>

	
	<% }
		rec2.close();
  		
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
      	
      
		
		
		
		
		
					
		</TABLE>
	</center>

        
        
        </td>
        </tr>

</table></center>

<center><table background="img/bgtb.png"  border="1" bordercolor="white" cellpadding="10" cellspacing="0" style="width: 80%; " >
	  
	  <tr>
           <td> <center> <img src="img/below1.png" width="100%" height="100%" align="middle" /></center></td>
      </tr> 

</table></center>
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