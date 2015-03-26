package com.rmuti.discuss;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.sql.*;
/**
 * Servlet implementation class PostReply1
 */
@WebServlet("/PostReply1")
public class PostReply1 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PostReply1() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		performTask(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		performTask(request, response);
	}
	public void performTask(HttpServletRequest request, HttpServletResponse response) throws IOException{
		
		request.setCharacterEncoding("UTF-8");		
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		String u = (String) request.getSession().getAttribute("userid");
		
		String name = u;
		//String name = request.getParameter("param_name");
		String desc = request.getParameter("param_desc");
		String id = request.getParameter("id");
		try {
			
			Class.forName("org.gjt.mm.mysql.Driver").newInstance();			
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/andoird", "root", "pong084391");
			//Class.forName("sun.jdbc.odbc.JdbcOdbcDriver").newInstance();
			//Connection con = DriverManager.getConnection("jdbc:odbc:andoird");
			Statement stmt = con.createStatement();
		
			if(con != null) {
				java.util.Date d = new java.util.Date();
				String day=d.toString().substring(8,10);
				String month=d.toString().substring(4,7);
				String year=d.toString().substring(d.toString().length()-4,d.toString().length());
				String time=d.toString().substring(11,19);

				if(month.equals("Jan")) month = "มกราคม";
				else if(month.equals("Feb")) month = "กุมภาพันธ์";
				else if(month.equals("Mar")) month = "มีนาคม";
				else if(month.equals("Apr")) month = "เมษายน";
				else if(month.equals("May")) month = "พฤษภาคม";
				else if(month.equals("Jun")) month = "มิถุนายน";
				else if(month.equals("Jul")) month = "กรกฎาคม";
				else if(month.equals("Aug")) month = "สิงหาคม";
				else if(month.equals("Sep")) month = "กันยายน";
				else if(month.equals("Oct")) month = "ตุลาคม";
				else if(month.equals("Nov")) month = "พฤศจิกายน";
				else if(month.equals("Dec")) month = "ธันวาคม";

				year = Integer.toString(Integer.parseInt(year)+543);
				System.out.println(day);
				System.out.println(month);
				System.out.println(year);
				System.out.println(time);
				String datetime = day+" "+month+" "+year+" "+time;

				String sql = "insert into 1post_reply (topic_id,name,description,date_time)"+
				                     "values('"+id+"','"+name+"','"+desc+"','"+datetime+"')";
				String sql2 = "update 1post set num_reply=num_reply+1 where topic_id='"+id+"'";
				int return_val = stmt.executeUpdate(sql);
				int return_val2 = stmt.executeUpdate(sql2);
				if(return_val==1&&return_val2==1) {
					out.print("ได้รับคำตอบของคุณเรียบร้อย !!!<BR>");
					out.print("<A HREF=\"1AllTopic.jsp\">ดูกระทู้ทั้งหมด</A><BR>");
					out.print("<A HREF=\"1ShowTopic.jsp?id="+id+"\">ย้อนกลับไปดูกระทู้ของคุณ</A>");
				} else {
					out.print("ไม่สามารถเก็บคำตอบลงกระทู้ได้ กรุณาลองใหม่!!!<BR>");
					out.print("<A HREF=\"1ShowTopic.jsp?id="+id+"\">กลับไปตอบกระทู้ใหม่</A>");
				}
				stmt.close();
				con.close();
			}

		} catch(Exception e) {
			out.print("ไม่สามารถเก็บคำตอบลงกระทู้ได้ กรุณาลองใหม่ !!!<BR>");
			out.print("<A HREF=\"1ShowTopic.jsp?id="+id+"\">กลับไปตอบกระทู้ใหม่</A>");
			System.out.println(e);
		}
	}

}