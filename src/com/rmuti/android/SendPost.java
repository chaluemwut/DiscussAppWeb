package com.rmuti.android;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.json.JsonObject;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.rmuti.Config;
import com.rmuti.db.Utility;
import com.sun.org.apache.xalan.internal.xsltc.compiler.sym;

import java.sql.*;

/**
 * Servlet implementation class PostReply
 */
@WebServlet("/SendPost")
public class SendPost extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SendPost() {
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
  		String topicid = null;
  		String catid=null;	
  		Statement stmt = null;
  		Connection connect = null;
  		 
  		PrintWriter out = response.getWriter();
  		try {
  			Class.forName("org.gjt.mm.mysql.Driver").newInstance();					
  			connect = DriverManager.getConnection("jdbc:mysql://localhost:3306/"+Config.db_name+"?characterEncoding=utf-8",Config.db_user,Config.db_password);
  			stmt = connect.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_READ_ONLY);
  		} catch (SQLException e1) {
  			// TODO Auto-generated catch block
  			e1.printStackTrace();
  		
  		} catch (InstantiationException e1) {
  		// TODO Auto-generated catch block
  			e1.printStackTrace();
  		} catch (IllegalAccessException e1) {
  		// TODO Auto-generated catch block
  		e1.printStackTrace();
  		} catch (ClassNotFoundException e) {
  		// TODO Auto-generated catch block
  			e.printStackTrace();
  		}
  		 String cat_id = request.getParameter("cat_id");
  		 String topic = request.getParameter("topic");
  		 String desc  =  request.getParameter("desc");
  		 String owner = request.getParameter("owner");
  		 String GetcatID = cat_id;
  	  out.println(topic);
  	  	out.println(desc);
  		try {
  			
  		
  			if(connect != null) {
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


  		        String sql = "insert into post (cat_id,topic,description,owner,date_time,img,top_id,num_reply) values ('"+cat_id+"','"+topic+"','"+desc+"','"+owner+"','"+datetime+"',0,0,0)";	
  				
  				stmt.executeUpdate(sql);
  				String sql2 = "update cat_id set num_reply=num_reply+1 where cat_id='"+GetcatID+"'";
  				  stmt.executeUpdate(sql2);
  				
  			
  				stmt.close();
  				connect.close();
  				out.print("OK");
  				
  			}
  		

  		} catch(Exception e) {
  			System.out.println(e);
  		}
  	}
	
	
}