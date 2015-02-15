package com.rmuti.discuss;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.sql.*;

/**
 * Servlet implementation class NewPostBoard
 */
@WebServlet("/NewPostBoard")
public class NewPostBoard extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NewPostBoard() {
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
		String owner = request.getParameter("param_name");
		String topic = request.getParameter("param_topic");
		String desc = request.getParameter("param_desc");
		
		
		try {
			Class.forName("org.gjt.mm.mysql.Driver").newInstance();
			//Class.forName("sun.jdbc.odbc.JdbcOdbcDriver").newInstance();
			//Connection con = DriverManager.getConnection("jdbc:odbc:andoird");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/andoird", "root", "pong084391");
			Statement stmt = con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_READ_ONLY);
			ResultSet rs = stmt.executeQuery("select * from post");
			String id;

			if(con != null) {
				if(rs != null) {
					if(rs.next()) {
						rs.last();
						id = rs.getString("topic_id");
						id = Integer.toString(Integer.parseInt(id)+1);
					} 
					else {
						id = "1000000000";
					}
					rs.close();

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

					String datetime = day+" "+month+" "+year+" "+time;

					String sql = "insert into post values('"+id+"','"+topic+"','"+desc+"','"+owner+"','"+datetime+"',0)";
					int return_val = stmt.executeUpdate(sql);
					if(return_val==1) {
						out.print("สร้างกระทู้เรียบร้อยแล้ว !!!<BR>");
						out.print("<A HREF=\"AllTopic.jsp\">ดูกระทู้ทั้งหมด</A>");
					}
					else {
						out.print("ไม่สามารถสร้างกระทู้ได้ กรุณาลองใหม่!!!<BR>");
						out.print("<A HREF=\"NewPost.jsp\">กลับไปสร้างกระทู้ใหม่</A>");
					}
				}
				stmt.close();
				con.close();
			}
		} catch(Exception e) {
			out.print("ไม่สามารถสร้างกระทู้ได้ กรุณาลองใหม่ !!!<BR>");
			out.print("<A HREF=\"NewPost.jsp\">กลับไปสร้างกระทู้ใหม่</A>");
			System.out.println(e);
		}
	}

}
