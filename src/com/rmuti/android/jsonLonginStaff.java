package com.rmuti.android;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.json.JsonObject;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.rmuti.db.Conndb;

/**
 * Servlet implementation class jsonLonginStaff
 */
@WebServlet("/jsonLonginStaff")
public class jsonLonginStaff extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public jsonLonginStaff() {
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
 	
 	Conndb conndb = new Conndb();	
 	HttpSession session = request.getSession();
     request.setCharacterEncoding("UTF-8");
 	response.setContentType("text/html;charset=UTF-8");
 	PrintWriter out = response.getWriter();

 	String username = request.getParameter("username");
 	//request.getSession().putValue("user_id","user");
 	
 	JsonObject jsonObj2 = conndb.jsonLoginStaffAPI(username);
 	
 	out.print(jsonObj2);
 	
 	conndb.closeConn();

 }

	
 }


	