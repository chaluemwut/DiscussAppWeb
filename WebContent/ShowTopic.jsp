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
<% String u = (String) request.getSession().getAttribute("userid");
if(u == null){
	response.sendRedirect("login.jsp");
}
%>
<%//--------------------------------facebook.com/share/  --------https://www.addthis.com/dashboard#gallery/ra-5563689270a6e4f5%>
<!-- Go to www.addthis.com/dashboard to customize your tools -->
<script type="text/javascript" src="//s7.addthis.com/js/300/addthis_widget.js#pubid=ra-5563689270a6e4f5" async="async"></script>
<% //------------------------------------------------------%>

<FORM  name="form1" ACTION="PostReply" METHOD="post" onSubmit="JavaScript:return fncSubmit();">

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
         
       
        <tr>
        <td>		
        			<%
	
	request.setCharacterEncoding("UTF-8");
	String topic="";
	String topic_id="";
	String img="";
	try {
		
		Class.forName("org.gjt.mm.mysql.Driver").newInstance();			
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/"+Config.db_name+"?characterEncoding=utf-8",Config.db_user,Config.db_password);
		//Class.forName("sun.jdbc.odbc.JdbcOdbcDriver").newInstance();
		//Connection con = DriverManager.getConnection("jdbc:odbc:andoird");
		Statement stmt = con.createStatement();
		String sql = "select * from post where topic_id='"+request.getParameter("id")+"'";
		String sql2 = "select * from post_reply where topic_id='"+request.getParameter("id")+"'order by id asc";
		ResultSet rs = stmt.executeQuery(sql);
		if(con != null) {
			if(rs != null) {
				while(rs.next()) {
					topic_id = new String(rs.getString("topic_id").getBytes()); 
					topic = new String(rs.getString("topic").getBytes());
					img = new String(rs.getString("img").getBytes());
%>
					<html lang="en">
					<head link href="css/bootstrap.min.css" rel="stylesheet">
					<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" name="viewport" content="width=device-width, initial-scale=1.0">
					<link href="css/bootstrap.min.css" rel="stylesheet">
					<link href="css/bootstrap-responsive.min.css" rel="stylesheet">
					<meta http-equiv="Content-Type" content="text/html; charset=TIS-620">
					<title><%=topic_id%> <%=topic %></title>
					</head>
					<body>
					 <br>
	               
					
					<br><center><H3>หัวข้อเรื่อง <%=topic %></H3></center><br>
					
							<%if (img.equals("0")){%>
    		    							<center> <img src=<%="img/noimage.jpg"%> width="500" height="500"></center><br>
    		    							 
    		    						<% }else{%>  		    						
    		    						
    		    							<center><img src=<%="images/"+img%> width="500" height="500" ></center> <br>	
    		    						 <%} %>
					
										
					
					<br><br>&nbsp;รายละเอียด : <font size=4>		<%= new String(rs.getString("description").getBytes()) %></font><br><br>					
					&nbsp;จากคุณ : <%= new String(rs.getString("owner").getBytes()) %><br>
					&nbsp;วันที่ : <%= new String(rs.getString("date_time").getBytes()) %><hr><br>
					<p align="right"><a  class="btn btn-danger" href="ShowCatID.jsp?id=<%=rs.getString("cat_id")%>" role="button">ดูกระทู้ทั้งหมด</a><br></p>
				
					<h4>&nbsp;ตอบ</h4>
					
<%
				}
			}
			rs.close();

			ResultSet rs2 = stmt.executeQuery(sql2);
			if(rs2 != null) {
				while(rs2.next()) {
%>
					<br>&nbsp;รายละเอียด : <%= new String(rs2.getString("description").getBytes()) %><br><br>
					&nbsp;จากคุณ : <%= new String(rs2.getString("name").getBytes()) %><br>
					&nbsp;วันที่ : <%= new String(rs2.getString("date_time").getBytes()) %><HR>
					
					
<%
				}
			}
			rs2.close();
			stmt.close();
			con.close();
		}
	} catch(Exception e) {
		out.print("เกิดข้อผิดพลาดกับการแสดงกระทู้");
		System.out.println(e);
	}
	
	
%>


	
		
		<center><TABLE>
		<h3>ตอบกระทู้</h3>
		<TR><TD><p  class="lead">ชื่อ</p></TD>
					<TD><p><Font Size=4><%out.println(u);%></Font></p></TD></TR> 
		<TR><TD><p  class="lead">รายละเอียด</p></TD>
					<TD><TEXTAREA NAME="param_desc" COLS="20" ROWS="5"></TEXTAREA></TD></TR>
		<TR><TD></TD>
				  <TD COLSPAN=2>
				  <input class="btn btn-primary" type="submit" value="ส่งข้อมูล">
				  <input class="btn btn-info" type="reset" value="เคลียร์">
		          </TD></TR>
	</TABLE></center>
	<INPUT TYPE="hidden" NAME="id" VALUE="<%=request.getParameter("id")%>">

      

        
        
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