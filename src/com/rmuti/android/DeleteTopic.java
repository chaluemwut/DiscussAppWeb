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
 * Servlet implementation class DeleteTopic
 */
@WebServlet("/DeleteTopic")
public class DeleteTopic extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteTopic() {
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
			 String topicId = request.getParameter("topic_id");
			 String catId = request.getParameter("cat_id");
				System.out.println("Delete Topic");
				System.out.println(topicId);
				System.out.println(catId);
			Connection con = null;	
			Statement  stmt= null; 
					try {
						Class.forName("org.gjt.mm.mysql.Driver").newInstance();			
						 con = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/"+Config.db_name+"?characterEncoding=utf-8",Config.db_user,Config.db_password);
						 stmt = (Statement) con.createStatement();
						
				    	
				       	
				       	
				
						String sql = "DELETE FROM post " +
									" WHERE topic_id = '" + topicId + "' ";
					       
						String sql2 = "update cat_id set num_reply=num_reply-1 where cat_id='"+catId+"'";
						stmt.execute(sql);
						stmt.execute(sql2);
			   			
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
					out.println(e.getMessage());
					e.printStackTrace();
				}

	}

}
