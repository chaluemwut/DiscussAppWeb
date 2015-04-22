package com.rmuti.discuss;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.sql.*;

/**
 * Servlet implementation class Login
 */
@WebServlet("/Login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Login() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try {
			performTask(request, response);
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try {
			performTask(request, response);
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	@SuppressWarnings("deprecation")
	public void performTask(HttpServletRequest request, HttpServletResponse response) throws IOException, ClassNotFoundException, SQLException, ServletException{
		
			
		HttpSession session = request.getSession();
        request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		
		//request.getSession().putValue("user_id","user");
		
		String userid=request.getParameter("user"); 	
		String pwd=request.getParameter("pwd"); 
		
//		session.putValue("userid", userid);
		session.setAttribute("userid", userid);
				
		
		Class.forName("com.mysql.jdbc.Driver"); 
		java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/andoird","root","pong084391"); 
		Statement st= con.createStatement(); 
		String sql = "SELECT role_id, cat_id, a.username, a.password"
						+ " FROM tb_user a"
						+ " LEFT JOIN cat_id b ON ( a.username = b.username )"
						+ " where a.username ='" + userid + "' "
						+ " and a.password ='" + pwd + "'";
		ResultSet rs = st.executeQuery(sql);	
			
		
		if(rs.next()) 
		{	
			    String userIdDB = rs.getString(3);
			    String passWordDB = rs.getString(4);
				if(userIdDB.equals(userid) && passWordDB.equals(pwd)) 
				{ 
					int role = rs.getInt(1);
					response.sendRedirect("homeLogin.jsp");
					session.setAttribute("role_id", role);
					session.setAttribute("cat_id", rs.getInt(2));
					
				} 
				else 
				{ 
					out.print("ชื่อหรือรหัสไม่ถูกต้อง !!!<br>");
					out.print("<A HREF=\"login.jsp\">กลับไป Login</A>");
				} 	
		}	 
		else
		{	
			out.print("ชื่อหรือรหัสไม่ถูกต้อง !!! <br>");
			out.print("<A HREF=\"login.jsp\">กลับไป  login</A>");
		}
		
		
		
		
		st.close();
		con.close();
		
		
	}

}


