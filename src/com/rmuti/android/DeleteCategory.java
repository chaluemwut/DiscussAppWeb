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
 * Servlet implementation class DeleteCategory
 */
@WebServlet("/DeleteCategory")
public class DeleteCategory extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public DeleteCategory() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		// TODO Auto-generated method stub
				Conndb conndb = new Conndb();	
				HttpSession session = request.getSession();
			    request.setCharacterEncoding("UTF-8");
				response.setContentType("text/html;charset=UTF-8");
				PrintWriter out = response.getWriter();
				 String topicName = request.getParameter("cat_topic");
				 String catId = request.getParameter("cat_id");
				 String username = request.getParameter("username");
				 System.out.println("Delete Cate");
				 System.out.println(username);
				 System.out.println(topicName);
				 System.out.println("=============");
				 Connection con = null;	
					Statement  stmt= null; 
							try {
								Class.forName("org.gjt.mm.mysql.Driver").newInstance();			
								 con = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/"+Config.db_name,Config.db_user,Config.db_password);
								 stmt = (Statement) con.createStatement();
								
						    	
						       	 
				String sql = "DELETE FROM cat_id " +
							" WHERE cat_id = '" + catId + "' ";
			       
				String sql2 = "DELETE FROM tb_user " +
						" WHERE username = '" + username + "' AND cat_topic = '" + topicName + "' ";
				
				
				String sql3 = "DELETE FROM post " +	
						" WHERE cat_id = '" + catId + "'";
					
				stmt.execute(sql);
				stmt.execute(sql2);
				stmt.execute(sql3);
					
					 out.println("ลบเรียบร้อยแล้ว");
							} catch (Exception e) {
								// TODO Auto-generated catch block
								out.println(e.getMessage());
									e.printStackTrace();
								}
					
					try {
						if(stmt!=null){
							stmt.close();
							con.close();
						}
					} catch (SQLException e) {
						// TODO Auto-generated catch block
						
						e.printStackTrace();
					}
	}

}
