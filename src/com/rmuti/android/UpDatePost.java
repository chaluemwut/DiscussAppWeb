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

import java.sql.*;

/**
 * Servlet implementation class PostReply
 */
@WebServlet("/UpDatePost")
public class UpDatePost extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpDatePost() {
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
		String topicid = null;
		String catid=null;	
		Statement stmt = null;
		Connection connect = null;
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		try {
			Class.forName("org.gjt.mm.mysql.Driver").newInstance();					
			connect = DriverManager.getConnection("jdbc:mysql://localhost:3306/"+Config.db_name,Config.db_user,Config.db_password);
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
		
		  String topic = request.getParameter("topic");
		  String desc = request.getParameter("desc");
		  catid = request.getParameter("cat_id");		
		  topicid = request.getParameter("topic_id");	
		  System.out.println(desc);
		  System.out.println(topic);
		try {
			
	
			
			String sql = "UPDATE post set topic='"+ topic + "' ,description='"+desc+"'"+" WHERE topic_id = '" + topicid + "'And cat_id = '"+catid+"' ";
		        
				int return_val = stmt.executeUpdate(sql);
			
				  stmt.executeUpdate(sql);
				
			
				stmt.close();
				connect.close();
			

		} catch(Exception e) {
			System.out.println(e);
		}
	}
}
	