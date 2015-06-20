package com.rmuti.android;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mysql.jdbc.Connection;
import com.mysql.jdbc.Statement;
import com.rmuti.db.Conndb;

/**
 * Servlet implementation class AddCategory
 */
@WebServlet("/AddCategory")
public class AddCategory extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddCategory() {
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
		
			 String cat_Topic = request.getParameter("cat_topic");
				out.print(cat_Topic);
			Connection con = null;	
			Statement  stmt= null; 
			try {					
	 			
	 			
				
	 			
	 			try {
					Class.forName("org.gjt.mm.mysql.Driver").newInstance();
	 			} catch (InstantiationException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (IllegalAccessException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (ClassNotFoundException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}	
	 			 con = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/andoird", "root", "pong084391");
	 			 stmt = (Statement) con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_READ_ONLY);
	 			ResultSet rs = stmt.executeQuery("select * from cat_id order by cat_id asc");
	 			
	 			String id;
	 			
	 			
	 			if(con != null) {
	 				if(rs != null) {
	 					
	 				
	 					
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
						else if(month.equals("Nov")) month = "พฤศจิกายน�";
						else if(month.equals("Dec")) month = "ธันวาคม";
	 					year = Integer.toString(Integer.parseInt(year)+543);

	 					String datetime = day+" "+month+" "+year+" "+time;
	 					
	 					String username="NoUser";
	 					String password="null";
	 					String adderess="null";
	 					String tel="null";
	 					String email="null";

	 					String sql = "insert into cat_id (cat_topic,username,date_time,num_reply) values ('"+cat_Topic+"','"+username+"','"+datetime+"',0)";
	 					String sql2 ="insert into tb_user (username,password,name,userAddress,userTel,userEmail,cat_topic,role_id) values ('"+username+"','"+password+"','"+username+"','"+adderess+"','"+tel+"','"+email+"','"+cat_Topic+"',2)";
	 					int return_val = stmt.executeUpdate(sql);				
	 					int return_val2 = stmt.executeUpdate(sql2);
	 				}
	 			}
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					out.println(e.getMessage());
					e.printStackTrace();
				}

	}
	
	

}
