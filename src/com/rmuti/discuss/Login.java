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
	public void performTask(HttpServletRequest request, HttpServletResponse response) throws IOException, ClassNotFoundException, SQLException, ServletException{
		
		
        request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		String userid=request.getParameter("user"); 	
		String pwd=request.getParameter("pwd"); 
		
		Class.forName("com.mysql.jdbc.Driver"); 
		java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/andoird","root","pong084391"); 
		Statement st= con.createStatement(); 
		ResultSet rs=st.executeQuery("select * from test where user_id='"+userid+"'"); 	
		
			
		
		if(rs.next()) 
		{ 
			if(rs.getString(2).equals(pwd)) 
			{ 
				
					response.sendRedirect("AllTopic.jsp");
				

			} 
			else 
			{ 
				out.print("ชื่อหรือรหัสไม่ถูกต้อง !!!<br>");
				out.print("<A HREF=\"login.jsp\">กลับไป Login</A>");
			} 
		} 
		else
		{	
			out.print("ชื่อหรือรหัสไม่ถูกต้อง !!! !!!<br>");
			out.print("<A HREF=\"login.jsp\">กลับไป  login</A>");
		}
		
		
		
		
		st.close();
		con.close();
		
		
	}

}


