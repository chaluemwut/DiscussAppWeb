package com.rmuti.android;

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

import com.rmuti.db.Utility;

import java.sql.*;

/**
 * Servlet implementation class PostReply
 */
@WebServlet("/PostReplyAPI")
public class PostReplyAPI extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PostReplyAPI() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
    	
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");		
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();	
		String name=null,desc=null,topid=null;
		
			
		 name =  request.getParameter("name");
		 desc = request.getParameter("desc");
		 topid = request.getParameter("top_id");
		 System.out.println(name);
		 System.out.println(desc);
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
				else if(month.equals("Nov")) month = "พฤศจิกายน�";
				else if(month.equals("Dec")) month = "ธันวาคม";
				year = Integer.toString(Integer.parseInt(year)+543);
				System.out.println(day);
				System.out.println(month);
				System.out.println(year);
				System.out.println(time);
				String datetime = day+" "+month+" "+year+" "+time;

				String sql = "insert into post_reply (topic_id,name,description,date_time)"+
				                     "values('"+topid+"','"+name+"','"+desc+"','"+datetime+"')";
				String sql2 = "update post set num_reply=num_reply+1 where topic_id='"+topid+"'";
				int return_val = stmt.executeUpdate(sql);
				int return_val2 = stmt.executeUpdate(sql2);
			
				stmt.close();
				con.close();
				out.print("OK");
			}

		} catch(Exception e) {
			System.out.println(e);
		}
	}
	

}