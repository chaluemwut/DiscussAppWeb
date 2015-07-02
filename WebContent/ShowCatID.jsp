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

<%String u = (String) request.getSession().getAttribute("userid");
Integer roleid = (Integer) request.getSession().getAttribute("role_id");
Integer catid = (Integer) request.getSession().getAttribute("cat_id");
if(u == null){
	response.sendRedirect("login.jsp");
}
%>
<%//--------------------------------facebook.com/share/  --------https://www.addthis.com/dashboard#gallery/ra-5563689270a6e4f5%>
<!-- Go to www.addthis.com/dashboard to customize your tools -->
<script type="text/javascript" src="//s7.addthis.com/js/300/addthis_widget.js#pubid=ra-5563689270a6e4f5" async="async"></script>
<% //------------------------------------------------------%>

<center><table background="img/bgtb.png"  border="1" bordercolor="white" cellpadding="10" cellspacing="0" style="width: 80%; " >
	  <tr>
           <td> <center> <img src="img/header.png" width="100%" height="100%" align="middle" /></center></td>
      </tr> 
       <tr>
       		<td><ul class="nav nav-tabs">
  			<li role="presentation"><a href="homeLogin.jsp">หน้าหลัก</a></li>
  			<li role="presentation"><a href="AboutLogin.jsp">เกี่ยวกับเรา</a></li>
 			<li role="presentation"><a href="ContactLogin.jsp">ติดต่อเรา</a></li>
 			<p align = "right" ><Font Size=2>สวัสดี คุณ &nbsp;&nbsp;<%out.println(u);%><a href="logout.jsp">&nbsp;&nbsp;ออกจากระบบ</a></Font></p> 	
			</ul></td>
       </tr>
        
     
       
        
        
                 <%//----------------------------------------------------------------------------------------- %>
        <tr>        
        <td> 
<%
	
	request.setCharacterEncoding("UTF-8");
	String cat_topic="";
	String cat_id="";
	     
	int row_page = 10; // จำนวนรายการหรือเรคอร์ดที่ต้องการแสดงใน 1 หน้า
	int total_row=0; // จำนวนรายการหรือเรคอร์ดทั้งหมดที่ดึงมาจากฐานข้อมูลเพื่อนำมาแสดง
	
	
	
		
	
                   
	try {
		
        
	
		
		Class.forName("org.gjt.mm.mysql.Driver").newInstance();			
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/"+Config.db_name+"?characterEncoding=utf-8",Config.db_user,Config.db_password);
		//Class.forName("sun.jdbc.odbc.JdbcOdbcDriver").newInstance();
		//Connection con = DriverManager.getConnection("jdbc:odbc:andoird");
		
		Statement stmt = con.createStatement();
		ResultSet Myrs = stmt.executeQuery("SELECT count(*) AS num FROM post  where cat_id='"+request.getParameter("id")+"' AND top_id = 0 ");
        
		
		while(Myrs.next())
		{
			total_row = Myrs.getInt("num");
		}
		    if(total_row == 0){
		    	
		    	out.print("<center>กระทู้นี้ยังไม่มีข้อมูล !!!</center>");
%>		    	<br>
				<br>
		    	<p align="center"><a   class="btn btn-primary" href="NewPost.jsp?id=<%=request.getParameter("id")%>" role="button">ตั้งหมวดกระทู้</a></p>
		    	<p align="center"><a  class="btn btn-danger" href="homeLogin.jsp" role="button">กลับไปยังหมวดกระทู้</a></p><br>
<%
		    }
		
		Myrs.close();
		

		 
		// คำนวณหาตัวเลขจำนวนหน้าที่จะแสดง แล้วเก็บตัวเลขนี้ไว้ในตัวแปร total_page
		int total_page = (int)Math.ceil((double)total_row/(double)row_page);
		int screen,start;
		// ถ้าไม่มีการส่งตัวแปร screen มา แสดงว่าผู้ชมเปิดดูข้อมูลหน้านี้เป็นหน้าแรก
		if(request.getParameter("screen")==null) {
				screen=1;
		}	
		// ถ้ามีการส่งตัวแปร screen มา แสดงว่าผู้ชมต้องการดูข้อมูลหน้านั้น
		// แปลงค่าตัวแปร screen ที่ส่งมาเป็นสตริง ให้เป็นตัวเลข เพื่อจะนำไปใช้ในการตรวจสอบ
		else{
				screen = Integer.parseInt(request.getParameter("screen"));
		}	
		if(screen>=1 && screen<=total_page)
		{
						// คำนวณหาข้อมูลเริ่มต้นในฐานข้อมูล
		start = (screen-1)*row_page;		
		
		String sql = "select * from cat_id where cat_id='"+request.getParameter("id")+"'";
		String sql2 = "select * from post where cat_id='"+request.getParameter("id")+"' order by topic_id DESC;" ;
		String sql3 = "SELECT topic_id,cat_id,topic,description,owner,date_time,img,top_id,num_reply  FROM post where cat_id='"+request.getParameter("id")+"'AND top_id = 0 ORDER BY topic_id DESC LIMIT "+start+","+row_page;
		ResultSet rs = stmt.executeQuery(sql);
		
		
		if(con != null) {
			if(rs != null) {
				while(rs.next()) {
					cat_id = new String(rs.getString("cat_id").getBytes()); 
					cat_topic = new String(rs.getString("cat_topic").getBytes());
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
					<%if(roleid ==1){ %> 
	                 <p align="right"><a  class="btn btn-success" href="ClosingDel.jsp" role="button">กระทู้ที่แจ้งลบ</a></p>
					
					<%} %>
					<br><center><H3><%=cat_topic %></H3></center><br>	
		   
      

					
<%
				}
			}
			rs.close();

			ResultSet rs2 = stmt.executeQuery(sql2);
			if(rs2 != null) {
%>				
				
		 <center>  <table class="table table-hover" style="width: 90%;">
 
     <thead>          
            <tr >
       
             <th></th>
             <th></th>
            <th>ชื่อกระทู้</th>          
            <th>ชื่อคนโพส</th>    
            <th>จำนวนตอบ</th>       
            <th>วันที่โพส</th> 
             <th>แก้ไข</th>       
            <th>ลบ</th> 
            
           
			</tr>
	</thead>	   		

<% 
			while(rs2.next()) {
					  String id = new String(rs2.getString("topic_id").getBytes());
					  String img = new String(rs2.getString("img").getBytes());
					  String delCat = new String(rs2.getString("cat_id").getBytes());
					  String name = new String(rs2.getString("owner").getBytes());
					  session.setAttribute("Catdel", delCat);
						String url="ShowTopic.jsp?id="+id;
						
					  String top = new String(rs2.getString("top_id").getBytes());
					  Integer topid= Integer.valueOf(top);
					  
			 if(screen == 1){	  
					  
					  if( topid == 1){ 					
					  
%>				
 <tr bgcolor="pink">
                  
                 
			       	        
			        <td><img src=<%="images/"+img%> class="img-responsive" width="70" height="70">&nbsp; Top<td>
					<td><A  HREF="<%= url %>"> <%= new String(rs2.getString("topic").getBytes()) %></A></td>					
				     <td><%= new String(rs2.getString("owner").getBytes()) %></td>					
					 <td><%= new String(rs2.getString("num_reply").getBytes()) %></td>
					  <td><%= new String(rs2.getString("date_time").getBytes()) %></td>
			<% 		  
					if(roleid ==1){	
			%>		
					<td> <a href="EditUpdateTopic.jsp?id=<%=rs2.getString("topic_id")%>"><img src="img/edit.png" width="20" height="20" /></a></td>
					<td><a href="delTopic.jsp?id=<%=rs2.getString("topic_id")%>"><img src="img/delete.png" width="20" height="20"  /></a><td>
					<td> <a href="EditNoTopID.jsp?id=<%=rs2.getString("topic_id")%>">ยกเลิกปักหมุด</a></td>
					
			<%
					}
					if(roleid == 2){	
						String catIdStg= String.valueOf(catid);
						
						
						if(catIdStg.equals(delCat)){
			%>		
						<td> <a href="EditUpdateTopic.jsp?id=<%=rs2.getString("topic_id")%>"><img src="img/edit.png" width="20" height="20" /></a></td>
					<td><a href="delTopic.jsp?id=<%=rs2.getString("topic_id")%>"><img src="img/delete.png" width="20" height="20"  /></a><td>
					<td> <a href="EditNoTopID.jsp?id=<%=rs2.getString("topic_id")%>">ยกเลิกปักหมุด</a></td>
					
					</tr>
			        
			  
			<%          }else if(u.equals(name)){
				
						%>			
			  			 <td> <a href="EditUpdateTopic.jsp?id=<%=rs2.getString("topic_id")%>"><img src="img/edit.png" width="20" height="20" /></a></td>
		       			 <td> <a href="Closing.jsp?id=<%=rs2.getString("topic_id")%>">ปิดการขาย</a></td>
						<% 			
			
						}
					}	
					if(roleid == 3){
						if(u.equals(name)){
							
			%>
					
			        <td> <a href="EditUpdateTopic.jsp?id=<%=rs2.getString("topic_id")%>"><img src="img/edit.png" width="20" height="20" /></a></td>
					<td> <a href="Closing.jsp?id=<%=rs2.getString("topic_id")%>">ปิดการขาย</a></td>
			<%			}
					}
			
			%>
					  
	<%
						
					}
			      }	  
				}
			}
			rs2.close();
			 ResultSet rs3 = stmt.executeQuery(sql3);
				if(rs3 != null) {
					while(rs3.next()) {
						  String id = new String(rs3.getString("topic_id").getBytes());
						  String img = new String(rs3.getString("img").getBytes());
						  String delCat = new String(rs3.getString("cat_id").getBytes());
						  String name = new String(rs3.getString("owner").getBytes());
						  session.setAttribute("Catdel", delCat);
							String url="ShowTopic.jsp?id="+id;
							
						  String top = new String(rs3.getString("top_id").getBytes());
						  Integer topid= Integer.valueOf(top);
						  
						 if(topid == 0){ 	
							 
							 
%>
 <tr >
                  
                 
			       	  
			       	     
			        <td><img src=<%="images/"+img%> class="img-responsive" width="70" height="70"><td>
					<td><A  HREF="<%= url %>"> <%= new String(rs3.getString("topic").getBytes()) %></A></td>					
				     <td><%= new String(rs3.getString("owner").getBytes()) %></td>					
					 <td><%= new String(rs3.getString("num_reply").getBytes()) %></td>
					  <td><%= new String(rs3.getString("date_time").getBytes()) %></td>
					  
				<% 		  
					if(roleid ==1){	
			%>		
					  
					  
					<td> <a href="EditUpdateTopic.jsp?id=<%=rs3.getString("topic_id")%>"><img src="img/edit.png" width="20" height="20" /></a></td>
					<td><a href="delTopic.jsp?id=<%=rs3.getString("topic_id")%>"><img src="img/delete.png" width="20" height="20"  /></a><td>
					<td> <a href="EditTopUpdate.jsp?id=<%=rs3.getString("topic_id")%>">ปักหมุด</a></td>
					
						
			<%
					}
					if(roleid == 2){	
						String catIdStg= String.valueOf(catid);
		
						if(catIdStg.equals(delCat)){
			%>		
						<td> <a href="EditUpdateTopic.jsp?id=<%=rs3.getString("topic_id")%>"><img src="img/edit.png" width="20" height="20" /></a></td>
					<td><a href="delTopic.jsp?id=<%=rs3.getString("topic_id")%>"><img src="img/delete.png" width="20" height="20"  /></a><td>
					<td> <a href="EditTopUpdate.jsp?id=<%=rs3.getString("topic_id")%>">ปักหมุด</a></td>
					
					</tr>
			        
			  
			<%         }else if(u.equals(name)){
				
					%>			
				  		 <td> <a href="EditUpdateTopic.jsp?id=<%=rs3.getString("topic_id")%>"><img src="img/edit.png" width="20" height="20" /></a></td>
			       		 <td> <a href="Closing.jsp?id=<%=rs3.getString("topic_id")%>">ปิดการขาย</a></td>
					<% 			
				
						}
					}
					
					if(roleid == 3){
						if(u.equals(name)){
							
			%>
					
			        <td> <a href="EditUpdateTopic.jsp?id=<%=rs3.getString("topic_id")%>"><img src="img/edit.png" width="20" height="20" /></a></td>
			        <td> <a href="Closing.jsp?id=<%=rs3.getString("topic_id")%>">ปิดการขาย</a></td>
			<%			}
					}
			
			%>	
					
				  	
				
			
         

<% 					
			}
		}
	}
%>
</table></center>				
 <center>  <table class="table table-hover" style="width: 80%;">
<%				
				if(screen>1) {
					out.println("<a href='ShowCatID.jsp?id="+request.getParameter("id")+"&screen="+(screen-1)+"' ><b>ย้อนกลับ</b></a>");
				}	
				for(int i=1; i<=total_page; i++)
				{
					if(i==screen){
						out.println(" <b>["+i+"]</b>");
					}
					else{
						
						out.println(" | <a href='ShowCatID.jsp?id="+request.getParameter("id")+"&screen="+i+"'>"+i+" </a> | ");
					}
				}
				if(screen<total_page) {
					out.println("<a href='ShowCatID.jsp?id="+request.getParameter("id")+"&screen="+(screen+1)+"' ><b>ถัดไป</b></a>");
				}	
							
	rs3.close();
			stmt.close();
			con.close();
		}}
	} catch(Exception e) {
		out.print("เกิดข้อผิดพลาดกับการแสดงกระทู้");
		System.out.println(e);
	}

%>

</table></center>

<% 
	if(total_row > 0){
%>
<p align="center"><a   class="btn btn-primary" href="NewPost.jsp?id=<%=request.getParameter("id")%>" role="button">ตั้งหัวข้อกระทู้</a></p>
<p align="center"><a  class="btn btn-danger" href="homeLogin.jsp" role="button">กลับไปยังหมวดกระทู้</a></p><br>

<%

	}
%>


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
