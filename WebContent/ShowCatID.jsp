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

<%String u = (String) request.getSession().getAttribute("userid");
Integer roleid = (Integer) request.getSession().getAttribute("role_id");
Integer catid = (Integer) request.getSession().getAttribute("cat_id"); 
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
 			<p align = "right" ><Font Size=2>สวัสดี คุณ &nbsp;&nbsp;<%out.println(u);%><%out.println(roleid);%> <a href="logout.jsp">&nbsp;&nbsp;ออกจากระบบ</a></Font></p> 	
			</ul></td>
       </tr>
        
        
       
        
        
                 <%//----------------------------------------------------------------------------------------- %>
        <tr>        
        <td> 
<%
	
	request.setCharacterEncoding("UTF-8");
	String cat_topic="";
	String cat_id="";
	     
  
                   
	try {
		
		Class.forName("org.gjt.mm.mysql.Driver").newInstance();			
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/andoird", "root", "pong084391");
		//Class.forName("sun.jdbc.odbc.JdbcOdbcDriver").newInstance();
		//Connection con = DriverManager.getConnection("jdbc:odbc:andoird");
		Statement stmt = con.createStatement();
		String sql = "select * from cat_id where cat_id='"+request.getParameter("id")+"'";
		String sql2 = "select * from post where cat_id='"+request.getParameter("id")+"' order by topic_id DESC;" ;
		String sql3 = "select * from post where cat_id='"+request.getParameter("id")+"' order by topic_id DESC;" ;
		ResultSet rs = stmt.executeQuery(sql);
		if(con != null) {
			if(rs != null) {
				while(rs.next()) {
					cat_id = new String(rs.getString("cat_id").getBytes(),"TIS-620"); 
					cat_topic = new String(rs.getString("cat_topic").getBytes(),"TIS-620");
%>
					<html lang="en">
					<head link href="css/bootstrap.min.css" rel="stylesheet">
					<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" name="viewport" content="width=device-width, initial-scale=1.0">
					<link href="css/bootstrap.min.css" rel="stylesheet">
					<link href="css/bootstrap-responsive.min.css" rel="stylesheet">
					<meta http-equiv="Content-Type" content="text/html; charset=TIS-620">
					<title><%=cat_id%> <%=cat_topic %></title>
					</head>
					<body>
					 <br>
	              
					
					<br><center><H3><%=cat_topic %></H3></center><br>	
		   
      

					
<%
				}
			}
			rs.close();

			ResultSet rs2 = stmt.executeQuery(sql2);
			if(rs2 != null) {
%>				
				
		 <center>  <table class="table table-hover" style="width: 80%;">
 
     <thead>          
            <tr >
       
             <th></th>
             <th></th>
            <th>ชื่อกระทู้</th>          
            <th>ชื่อคนโพส</th>    
            <th>จำนวนตอบ</th>       
            <th>วันที่โพส</th> 
           
			</tr>
	</thead>	   		

<% 
			while(rs2.next()) {
					  String id = new String(rs2.getString("topic_id").getBytes(),"TIS-620");
					  String img = new String(rs2.getString("img").getBytes(),"TIS-620");
					  String delCat = new String(rs2.getString("cat_id").getBytes(),"TIS-620");
					  String name = new String(rs2.getString("owner").getBytes(),"TIS-620");
					  session.setAttribute("Catdel", delCat);
						String url="ShowTopic.jsp?id="+id;
						
					  String top = new String(rs2.getString("top_id").getBytes(),"TIS-620");
					  Integer topid= Integer.valueOf(top);
					  
			  
					  
					  if( topid == 1){ 					
					  
%>				
 <tr >
                  
                 
			       	        
			        <td><img src=<%="images/"+img%> class="img-responsive" width="70" height="70">&nbsp; Top<td>
					<td><A  HREF="<%= url %>"> <%= new String(rs2.getString("topic").getBytes(),"TIS-620") %></A></td>					
				     <td><%= new String(rs2.getString("owner").getBytes(),"TIS-620") %></td>					
					 <td><%= new String(rs2.getString("num_reply").getBytes(),"TIS-620") %></td>
					  <td><%= new String(rs2.getString("date_time").getBytes(),"TIS-620") %></td>
			<% 		  
					if(roleid ==1){	
			%>		
					<td> <a href="EditUpdateTopic.jsp?id=<%=rs2.getString("topic_id")%>">แก้ไข</a></td>
					<td><a href="delTopic.jsp?id=<%=rs2.getString("topic_id")%>">ลบ</a><td>
					<td> <a href="EditNoTopID.jsp?id=<%=rs2.getString("topic_id")%>">ยกเลิกปักหมุด</a></td>
					
			<%
					}
					if(roleid == 2){	
						String catIdStg= String.valueOf(catid);
						
						
						if(catIdStg.equals(delCat)){
			%>		
						<td> <a href="EditUpdateTopic.jsp?id=<%=rs2.getString("topic_id")%>">แก้ไข</a></td>
					<td><a href="delTopic.jsp?id=<%=rs2.getString("topic_id")%>">ลบ</a><td>
					<td> <a href="EditNoTopID.jsp?id=<%=rs2.getString("topic_id")%>">ยกเลิกปักหมุด</a></td>
					
					</tr>
			        
			  
			<%         }
					}	
					if(roleid == 3){
						if(u.equals(name)){
							
			%>
					
			        <td> <a href="EditUpdateTopic.jsp?id=<%=rs2.getString("topic_id")%>">แก้ไข</a></td>
			
			<%			}
					}
			
			%>
					  
	<%
						
					}
				}
			}
			rs2.close();
			 ResultSet rs3 = stmt.executeQuery(sql3);
				if(rs3 != null) {
					while(rs3.next()) {
						  String id = new String(rs3.getString("topic_id").getBytes(),"TIS-620");
						  String img = new String(rs3.getString("img").getBytes(),"TIS-620");
						  String delCat = new String(rs3.getString("cat_id").getBytes(),"TIS-620");
						  String name = new String(rs3.getString("owner").getBytes(),"TIS-620");
						  session.setAttribute("Catdel", delCat);
							String url="ShowTopic.jsp?id="+id;
							
						  String top = new String(rs3.getString("top_id").getBytes(),"TIS-620");
						  Integer topid= Integer.valueOf(top);
						  
						 if(topid == 0){ 	
							 
							 
%>
 <tr >
                  
                 
			       	  
			       	     
			        <td><img src=<%="images/"+img%> class="img-responsive" width="70" height="70"><td>
					<td><A  HREF="<%= url %>"> <%= new String(rs3.getString("topic").getBytes(),"TIS-620") %></A></td>					
				     <td><%= new String(rs3.getString("owner").getBytes(),"TIS-620") %></td>					
					 <td><%= new String(rs3.getString("num_reply").getBytes(),"TIS-620") %></td>
					  <td><%= new String(rs3.getString("date_time").getBytes(),"TIS-620") %></td>
					  
				<% 		  
					if(roleid ==1){	
			%>		
					  
					  
					<td> <a href="EditUpdateTopic.jsp?id=<%=rs3.getString("topic_id")%>">แก้ไข</a></td>
					<td><a href="delTopic.jsp?id=<%=rs3.getString("topic_id")%>">ลบ</a><td>
					<td> <a href="EditTopUpdate.jsp?id=<%=rs3.getString("topic_id")%>">ปักหมุด</a></td>
					
						
			<%
					}
					if(roleid == 2){	
						String catIdStg= String.valueOf(catid);
						
						
						if(catIdStg.equals(delCat)){
			%>		
						<td> <a href="EditUpdateTopic.jsp?id=<%=rs3.getString("topic_id")%>">แก้ไข</a></td>
					<td><a href="delTopic.jsp?id=<%=rs3.getString("topic_id")%>">ลบ</a><td>
					<td> <a href="EditNoTopID.jsp?id=<%=rs3.getString("topic_id")%>">ยกเลิกปักหมุด</a></td>
					
					</tr>
			        
			  
			<%         }
					}
					
					if(roleid == 3){
						if(u.equals(name)){
							
			%>
					
			        <td> <a href="EditUpdateTopic.jsp?id=<%=rs3.getString("topic_id")%>">แก้ไข</a></td>
			
			<%			}
					}
			
			%>	
					
				  	
				
			
         

<% 					
			}
		}
	}
	rs3.close();
			stmt.close();
			con.close();
		}
	} catch(Exception e) {
		out.print("เกิดข้อผิดพลาดกับการแสดงกระทู้");
		System.out.println(e);
	}
%>
</table></center>

<p align="center"><a  class="btn btn-danger" href="homeLogin.jsp" role="button">กลับไปยังหมวดกระทู้</a></p>

<FORM name="form1" ACTION="NewPostBoard" METHOD="post" enctype="multipart/form-data" onSubmit="JavaScript:return fncSubmit();" >
<br>
 <center><table border="1" bordercolor="white" cellpadding="10" cellspacing="0" style="width: 95%; ">

		
		<center><TABLE>
		<center><br><h4>ตั้งกระทู้ใหม่</h4><BR><br></center>
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
					 <input class="btn btn-primary" type="submit" value="ส่งข้อมูล">
				     <input class="btn btn-info" type="reset" value="เคลียร์">
					</TD></TR>	
	
</table></center>
<INPUT TYPE="hidden" NAME="id" VALUE="<%=request.getParameter("id")%>">
</FORM>
<script language="javascript">
function fncSubmit()
{

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