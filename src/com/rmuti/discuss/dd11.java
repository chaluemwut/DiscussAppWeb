package com.rmuti.discuss;

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
import javax.servlet.http.HttpSession;

import com.rmuti.db.Conndb;

/**
 * Servlet implementation class dd11
 */
@WebServlet("/dd11")
public class dd11 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public dd11() {
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
		} catch (InstantiationException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IllegalAccessException e) {
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
		} catch (InstantiationException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IllegalAccessException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}



@SuppressWarnings("deprecation")
public void performTask(HttpServletRequest request, HttpServletResponse response) throws IOException, ClassNotFoundException, SQLException, ServletException, InstantiationException, IllegalAccessException{
	

	
	
	String username;
	String password; 
	Statement stmt=null;
	ResultSet rs=null;
	Connection con=null;

	String driver="com.example.mysql.Driver";
	Class.forName(driver).newInstance();

	try{
	 String url="jdbc:mysql://localhost/log";
	 con = DriverManager.getConnection("jdbc:mysql://localhost:3306/andoird","root","pong084391"); 
	 stmt=con.createStatement();

	}catch(Exception e){
	e.printStackTrace(); 

	}
	if(!con.isClosed()){
	username=request.getParameter("user");
	password=request.getParameter("pass");
	rs=stmt.executeQuery("select * from login");
	while(rs.next()){
	if(rs.getString("user")==username && rs.getString("pass")==password){
	// out.println("vinod");
	 System.out.println("vinod kakad");
	}else{

	// out.println("vinod");
	 System.out.println("vinod kakad else part");
	}
	}
	 // else{
	//  out.println("lost");
	  System.out.println("vinod kakad else lost part");
//	  } 


	  }


	  

	 
	
	
}

}
