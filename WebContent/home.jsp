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
  			<li role="presentation" class="active"><a href="home.jsp">หน้าหลัก</a></li>
  			<li role="presentation"><a href="About.jsp">เกี่ยวกับเรา</a></li>
 			<li role="presentation"><a href="Contact.jsp">ติดต่อเรา</a></li>
 			<p align = "right" ><Font Size=2><a href="register.jsp">&nbsp;&nbsp;สมัครสมาชิก</a>&nbsp;<a href="login.jsp">&nbsp;&nbsp;เข้าสู่ระบบ</a></Font></p> 		
			</ul></td>
       </tr>
        


	<form name="formSearch" method="get" action="Search.jsp" onSubmit="JavaScript:return fncSubmit();" >
	 
	    <tr>
	      <th>กระทู้ที่สนใจ
	      <input  name="txtKeyword" type="text" id="txtKeyword" >
	      <input  class="btn btn-danger" type="submit" value="ค้นหา"></th>
	    </tr>

	</form>
        
    
                 <%//----------------------------------------------------------------------------------------- %>
        <tr>        
        <td> 
        	<center><table background="img/bgtb1.png"  border="1" bordercolor="white" cellpadding="10" cellspacing="0" style="width: 80%; " >
        	 <tr>        
             <td> 
        		<%
       			
        		//out.println(u);
				request.setCharacterEncoding("UTF-8");
				
			try {
				Class.forName("org.gjt.mm.mysql.Driver").newInstance();			
				Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/"+Config.db_name+"?characterEncoding=utf-8",Config.db_user,Config.db_password);
				//Class.forName("sun.jdbc.odbc.JdbcOdbcDriver").newInstance();
				//Connection con = DriverManager.getConnection("jdbc:odbc:andoird");
				Statement stmt = con.createStatement();
				ResultSet rs = stmt.executeQuery("select * from cat_id order by cat_id asc " );

			if(con != null) {
				if(rs != null) {
	%>
	       
			
				<table class="table  table-hover " style="width: 100%;">
    <thead>
    <center><br><h3>ประเภทกระทู้</h3>	<BR><BR>
        <tr>
           
          
            <th>ชื่อประเภทกระทู้</th>
            <th>วันที่เพิ่ม</th>
            <th><center>จำนวนกระทู้</center></th>  
              
			  </tr>
    </thead>

					
	<%
	while(rs.next()) {
		String id = new String(rs.getString("cat_id").getBytes());
		String url="ShowCatIDNo.jsp?id="+id;
%>
	<tbody>
		<tr  >
		
		<TD>
		<A HREF="<%= url %>">						
		<%= new String(rs.getString("cat_topic").getBytes()) %></A>
		</TD>
		<TD><%= new String(rs.getString("date_time").getBytes()) %></TD>
		<TD>
		 <center><%= rs.getInt("num_reply") %></center>
		</TD>
		
		</tr>
	<%

	}
	%>

	</tbody>					
	</table></center>
				
				<%
				}
					rs.close();
					stmt.close();
					con.close();
				}
				} 
			
			catch(Exception e) {
					out.print("เกิดข้อผิดพลาดกับการแสดงกระทู้ทั้งหมด");
					System.out.println(e);
				}
			
				%> 
	
 				
 				 </td>
 				 </tr></table></center>
  				
       
       
       
        </td>
        
        </tr>
       <%//----------------------------------------------------------------------------------------- %>
          <tr>        
        <td> 
        	<center><table background="img/bgtb1.png"  border="1" bordercolor="white" cellpadding="10" cellspacing="0" style="width: 80%; " >
        	 <tr>        
             <td> 
        			<%
       			
        		//out.println(u);
				request.setCharacterEncoding("UTF-8");
			
    			int row_page = 10; // จำนวนรายการหรือเรคอร์ดที่ต้องการแสดงใน 1 หน้า
    			int total_row=0; // จำนวนรายการหรือเรคอร์ดทั้งหมดที่ดึงมาจากฐานข้อมูลเพื่อนำมาแสดง
    			
    			try{
    			// ขั้นตอนที่ 1 โหลดคลาสไดรเวอร์
    			Class.forName("org.gjt.mm.mysql.Driver");
    			// ขั้นตอนที่ 2 เปิดการเชื่อมต่อไปยังระบบฐานข้อมูล
    			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/"+Config.db_name+"?characterEncoding=utf-8",Config.db_user,Config.db_password);
    			// ขั้นตอนที่ 3 ติดต่อกับฐานข้อมูลโดยใช้คำสั่ง SQL
    			Statement stmt = con.createStatement();
    			// หาจำนวนเรคอร์ดทั้งหมดที่มีอยู่ในตาราง guestbook แลวเก็บค่านี้ไว้ในตัวแปร total_row
    			ResultSet rs = stmt.executeQuery("SELECT count(*) AS num FROM post ");
    			//ResultSet myresult0 = stmt.executeQuery("SELECT count(*) AS num FROM guestbook");
    			
    			while(rs.next())
    			{
    				total_row = rs.getInt("num");
    			}
    			//rs.close();
    			// คำนวณหาตัวเลขจำนวนหน้าที่จะแสดง แล้วเก็บตัวเลขนี้ไว้ในตัวแปร total_page
    			int total_page = (int)Math.ceil((double)total_row/(double)row_page);
    			//out.println("<b>มีผู้เซ็นสมุดเยี่ยมชม "+total_row+" รายการ แสดงออกมาให้ดูหน้าละ "+row_page);
    			//out.println("รายการ จากทั้งหมด "+total_page+" หน้า</b><br><br>");
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
    				String sql = "SELECT * FROM post INNER JOIN cat_id ON post.cat_id = cat_id.cat_id ORDER BY topic_id DESC LIMIT "+start+","+row_page;
    				ResultSet myresult = stmt.executeQuery(sql);
    				// ขั้นตอนที่ 4 จัดการกับผลลัพธ์ที่ได้จากคำสั่ง SQL
    				//out.println("<center><b>สมุดเยี่ยมชม<br>");
    				//out.println("<a href='signguest.jsp'>เซ็นสมุดเยี่ยมชม</a></b></center><br>");SELECT * FROM TABLE_A INNER JOIN TABLE_B ON TABLE_A.id = TABLE_B.id
    				%>
    				
    					<table class="table  table-hover " style="width: 100%;">
    		        <thead>
    		        <center><br><h3>กระทู้ล่าสุด</h3>	<BR><BR>
    		            <tr>
    		               
    		                <th></th>
    		                <th>ชื่อกระทู้</th>
    		                <th>ประเภทกระทู้</th>
    		                <th>ชื่อคนโพส</th>
    		                <th>จำนวนตอบ-วันที่โพส</th>  
    		                  
    		    			  </tr>
    		        </thead>
    				
    				<% 
    				
    				while(myresult.next())
    				{
    					
    					String id = new String(myresult.getString("topic_id").getBytes());
    					String img = new String(myresult.getString("img").getBytes());
    					String top_id = new String(myresult.getString("top_id").getBytes());
    					String url="ShowTopicNo.jsp?id="+id;
    					
    					Integer top = Integer.valueOf(top_id);	
    				if(top < 2){
    				%>	
    					<tbody>
    		    						<tr  >
    		    						
    		    						<TD><%if (img.equals("0")){%>
    		    							 <img src=<%="img/noimage.jpg"%> class="img-responsive" width="70" height="70">
    		    							 
    		    						<% }else{%>  		    						
    		    						
    		    							 <img src=<%="images/"+img%> class="img-responsive" width="70" height="70">
    		    						 <%} %>
    		    						</TD>
    		    						<TD>
    		    						<A HREF="<%= url %>">						
    		    						<%= new String(myresult.getString("topic").getBytes()) %></A>
    		    						</TD>
    		    							<TD><%= new String(myresult.getString("cat_topic").getBytes()) %></TD>
    		    							<TD><%= new String(myresult.getString("owner").getBytes()) %></TD>
    		    						<TD>
    		    						(<%= myresult.getInt("num_reply") %>-<%= myresult.getString("date_time") %>)
    		    						</TD>
    		    						</tr>
    				
    				<%
    				
    				}
    				}
    				%>
    				
    				</tbody>					
    							</table></center>
    						
    			
			

				
				 </td>
				 </tr></table></center>
				
   <center>
   	<%
    				// แสดงลิงค์ของแต่ละหน้าทั้งหมดที่มี
    				if(screen>1) {
    					out.println("<a href='home.jsp?screen="+(screen-1)+"' ><b>ย้อนกลับ</b></a>");
    				}	
    				for(int i=1; i<=total_page; i++)
    				{
    					if(i==screen){
    						out.println(" <b>["+i+"]</b>");
    					}
    					else{
    						out.println(" | <a href='home.jsp?screen="+i+"'>"+i+"</a> | ");
    					}
    				}
    				
    				if(screen<total_page) {
    					out.println("<a href='home.jsp?screen="+(screen+1)+"' ><b>ถัดไป</b></a>");
    				}	
    				myresult.close();
    				stmt.close();
    				con.close();
    				
    			}
    			
    			
    			else{
    				out.println("<center><b>ไม่พบข้อมูล</b></center>");
    			}	
    			}catch(Exception e) {
					out.print("เกิดข้อผิดพลาดกับการแสดงกระทู้ทั้งหมด");
					System.out.println(e);
				}
			
    			
    		%>
   
 </center>

</table></center>
<center><table background="img/bgtb.png"  border="1" bordercolor="white" cellpadding="10" cellspacing="0" style="width: 80%; " >
	  <tr>
           <td> <center> <img src="img/below1.png" width="100%" height="100%" align="middle" /></center></td>
      </tr> 

</table></center>

<script language="javascript">
function fncSubmit()
{
	
	if(document.formSearch.txtKeyword.value == "" )
	{
		alert('กรุณาใส่หัวข้อกระทู้ที่จะค้นหา');
		document.formSearch.cat_topic.focus();		
		return false;
	}
	
	
				
	document.formSearch.submit();
}

</script>


<script src="js/jquery.js"></script>
<script src="js/bootstrap.min.js"></script>
</body>
</html>