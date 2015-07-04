
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
import javax.servlet.http.HttpSession;

import com.rmuti.db.Conndb;

import java.sql.*;

/**
 * Servlet implementation class PostReply
 */
@WebServlet("/EditPostAPI")
public class EditPostAPI extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EditPostAPI() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		performTask(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		performTask(request, response);
	}
	public void performTask(HttpServletRequest request, HttpServletResponse response) throws IOException{
		Conndb conndb = new Conndb();	
		HttpSession session = request.getSession();
	    request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		String owner = request.getParameter("owner");
		//request.getSession().putValue("user_id","user");
		conndb.Username=owner;
		
		JsonObject jsonObj;
		try {
			jsonObj = conndb.EditPost();
		
		
		out.print(jsonObj);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}	 finally {
				conndb.closeConn();
			}
		}
			}

		
	


