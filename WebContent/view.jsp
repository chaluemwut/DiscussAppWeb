<%@ page language="java" contentType="text/html; charset=TIS-620"
    pageEncoding="TIS-620"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import ="java.sql.*" %>
<%@ page import ="javax.sql.*" %>
<html>
<meta http-equiv="Content-Type" content="text/html; charset=TIS-620">
<title>Homepage</title>
<head>
<!-- ��˹�����շ������ -->
<style type="text/css">
	#color1 {background-color:#5971AF; font-weight:bold; Color:#FFFFFF; }
	#color2 {background-color:#E1E9FC; Color:#000000;}
</style>
</head>
<body>
<%
	// �������ա���觤�Ңͧ id ����� redirect ��ѧ��� boardlist.jsp
	if(request.getParameter("id")==null)
		response.sendRedirect("boardlist.jsp");
	// ��鹵͹��� 1 ��Ŵ�����������
	Class.forName("org.gjt.mm.mysql.Driver");
	// ��鹵͹��� 2 �Դ�������������ѧ�к��ҹ������
	Connection mycon = DriverManager.getConnection("jdbc:mysql://localhost:3306/andoird","root","pong084391");
	// ��鹵͹��� 3 �Դ��͡Ѻ�ҹ�������������� SQL
	Statement stmt = mycon.createStatement();
	String submit = request.getParameter("submit"),name="",email="",comment="",ip="",sql="";
	int error=0, myresult=0;
	ResultSet result=null;
	// ������ԡ submit �����ʴ������Դ����������
	if(submit!=null)
	{
		// �Ѻ�����ŷ�����ҨҡẺ�����		
		
		ip = request.getRemoteAddr();
		// ��Ǩ�ͺ�����ŷ�����ҨҡẺ�����
		if(name.equals(""))
		{
			error = 1;
			out.println("<center><font color=red>��Ǩ�ͺ�������١��ͧ</font></center>");
		}
		if(comment.equals(""))
		{
			error = 1;
			out.println("<center><font color=red>��Ǩ�ͺ�ӵͺ���١��ͧ</font></center>");
		}
		// ��Ң����Ŷ١��ͧ������������ŧ㹰ҹ������
		if(error==0)
		{
			// �����ӵͺ����ŧ㹰ҹ������
			sql = "INSERT INTO board_ans VALUES('','"+request.getParameter("id")+"','"+name+"','"+email+"','"+comment+"','"+ip+"',NOW())";
			myresult = stmt.executeUpdate(sql);
			if(myresult!=0)
			{
				// ��������ӵͺŧ㹰ҹ�������� ��� update �ӹǹ���ͺ����
				sql = "UPDATE board_ques SET ans=ans+1,lastpost=NOW(), lastname='"+name+"' WHERE id="+request.getParameter("id");
				stmt.executeUpdate(sql);
				// ���������������㹰ҹ���������� �� redirect ��ѧ������������觤�� id 仴���
				response.sendRedirect("view.jsp?id="+request.getParameter("id"));
				return;
			}
			else
				out.println("�������ö����������ŧ㹰ҹ��������");
		}
	}
	//update �ӹǹ������Դ����Ǣ�͹��
	sql = "UPDATE board_ques SET view=view+1 WHERE id="+request.getParameter("id");
	stmt.executeUpdate(sql);
	// �ʴ���Ǣ�ͤӶ�������Ңͧ id ����Ѻ�����
	sql = "SELECT topic,name,email,detail,ip,DATE_FORMAT(datepost,'%e %b %Y, %T') AS datepost FROM board_ques WHERE id="+ request.getParameter("id");
	result = stmt.executeQuery(sql);
	while(result.next())
		{
%>
	<table border=0 cellpadding=2 cellspacing=1 width=98%> 
		<tr id=color1><td>&nbsp;Post by</td><td><%=result.getString("topic")%></td></tr>
		<tr id=color2>
			<td width=30% valign=top>
					<font face='MS Sans Serif' size='2'>
					<B>&nbsp;Name</B> : <%=result.getString("name")%><br>
					<B>&nbsp;Email </B>: <%=result.getString("email")%><br>
					<B>&nbsp;IP</B> : <%=result.getString("ip")%><br>
					<B>&nbsp;Time</B> : <%=result.getString("datepost")%><br><br>
					</font>
			</td>			
			<td width=70%>
					<table border=0 cellpadding=0 cellspacing=0 width=100%>
					<tr><td width=1>&nbsp;</td><td><br>
						<%=(result.getString("detail"))%>
					</td></tr></table>
			</td>
		</tr>		
<%
		}
	//�ʴ��ӵͺ�������ͧ�Ӷ��	�����Ңͧ id ����Ѻ�����
	sql = "SELECT name,email,detail,ip,DATE_FORMAT(datepost,'%e %b %Y, %T') AS datepost  FROM board_ans WHERE id_ques="+ request.getParameter("id");
	result = stmt.executeQuery(sql);
	while(result.next())
		{
%>
			<tr id=color2>
				<td> 
						<font face='MS Sans Serif' size='2'>
						<B>&nbsp;Name</B> : <%=result.getString("name")%><br>
						<B>&nbsp;Email</B> : <%=result.getString("email")%><br>
						<B>&nbsp;IP</B> : <%=result.getString("ip")%><br>
						<B>&nbsp;Time</B> <%=result.getString("datepost")%><br><br>
						</font>
				</td>
				<td>
						<table border=0 cellpadding=0 cellspacing=0 width=100%>
						<tr><td width=1>&nbsp;</td><td><br>
							<%=(result.getString("detail"))%>
						</td></tr></table>
				</td>
			</tr>
<%
		}
		result.close();
		stmt.close();
		mycon.close();
%>
	</table>
	<p>
			<!-- Ẻ���������Ѻ�ʴ������Դ���������� -->
			<form action="view.jsp?id=<%=request.getParameter("id")%>" method="post">
			<table border=0 cellpadding=2 cellspacing=1 width=75% align=center>
			<tr id=color1><td colspan=2 align=center>�����ʴ������Դ���</td></tr>
			<tr ID=color2><td>&nbsp;���ͼ��ͺ </td><td><input type=text name="name" size=30 value="<%=new String(name.getBytes("ISO8859_1"),"TIS-620")%>"></td></tr>
			<tr ID=color2><td>&nbsp;����� </td><td><input type=text name="email" size=30 value="<%=new String(email.getBytes("ISO8859_1"),"TIS-620")%>"></td></tr>
			<tr ID=color2><td>&nbsp;�ӵͺ </td><td><textarea name="comment" cols=60 rows=7><%=new String(comment.getBytes("ISO8859_1"),"TIS-620")%></textarea></td></tr>
			<tr ID=color2><td colspan=2 align=center><input type=submit name="submit" value="Reply">&nbsp;
				 <input type=Reset value="Cancel"></td></tr>								
			</table>
			</form>
</body>
</html>