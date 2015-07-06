package com.rmuti.android;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.DriverManager;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mysql.jdbc.Connection;
import com.mysql.jdbc.Statement;
import com.rmuti.Config;
import com.rmuti.db.Conndb;

/**
 * Servlet implementation class UpdateCategory
 */
@WebServlet("/UpdateCategory")
public class UpdateCategory extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateCategory() {
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
		 
		 Conndb conndb = new Conndb();	
			HttpSession session = request.getSession();
		    request.setCharacterEncoding("UTF-8");
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			 String cat_topic = request.getParameter("cat_topic");
			 String username = request.getParameter("username");
			 String cat_id = request.getParameter("cat_id");
			 String password = request.getParameter("password");
		     
								System.out.println("UpdateCategory");
					   			System.out.println(username);
					   			System.out.println(cat_topic);
					   			System.out.println("============");
			Connection con = null;	
			Statement  stmt= null; 
					try {
						Class.forName("org.gjt.mm.mysql.Driver").newInstance();			
						 con = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/"+Config.db_name+"?characterEncoding=utf-8",Config.db_user,Config.db_password);
						 stmt = (Statement) con.createStatement();
						
				    	
				       	String username2 ="NoUser";
				       	
							
						 String sql = "UPDATE cat_id " +
						 			"SET cat_topic = '"+ cat_topic + "' " +
						 			", username= '"+ username + "' " +	
						 			" WHERE cat_id = '" + cat_id + "' ";
						 		    
						 String sql2 = "UPDATE tb_user " +
						 		"SET username = '"+ username+ "' " +
						 		", 	password = '"+ password+ "' " +			
						 		", name = '"+ username + "' " +	
						 		", cat_topic = '"+ cat_topic + "' " +	
						 		" WHERE username = '" + username2+ "'AND  cat_topic = '" + cat_topic + "' ";		    
						 			
						      stmt.execute(sql);
						      stmt.execute(sql2);
						     
						      out.println("แก้ไขเรียบร้อยแร้ว");
							} catch (Exception e) {
							// TODO Auto-generated catch block
							out.println(e.getMessage());
								e.printStackTrace();
							}
				
				try {
					if(stmt!=null){
						stmt.close();
						con.close();
						con.close();
					}
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					out.println(e.getMessage());
					e.printStackTrace();
				}

	}

}
