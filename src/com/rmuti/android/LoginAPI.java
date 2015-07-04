package com.rmuti.android;


import java.io.IOException;

import javax.json.Json;
import javax.json.JsonArrayBuilder;
import javax.json.JsonObject;
import javax.json.JsonObjectBuilder;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.rmuti.db.Conndb;
import com.rmuti.db.DBUtil;

import java.sql.*;


/**
 * Servlet implementation class LoginAPI
 */
@WebServlet("/LoginAPI")
public class LoginAPI extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public LoginAPI() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String role_id = null;
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		JsonObject jsonRet = null;
		ServletOutputStream out = response.getOutputStream();
		// connect database	
		
		Statement stmt = new Conndb().getConn();
			
		ResultSet rs;
		try {
			rs = stmt.executeQuery("select role_id   from tb_user where username='"+username+"' AND password='"+password+"'");
		
		//JsonObjectBuilder jsonObj = Json.createObjectBuilder().add("status", "0");
		JsonArrayBuilder jsonArray = Json.createArrayBuilder();
		while (rs.next()) {
			
			 role_id = new String(rs.getString("role_id").getBytes());		
				
			
		}
		rs.close();
		//jsonObj.add("data", jsonArray);
		//jsonRet = jsonObj.build();
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		
		DBUtil db = new DBUtil();
		
		
		try {
			if (db.isUser(username, password)) {
				JsonObjectBuilder jsonObj = Json.createObjectBuilder().add(
						"status", "0");
				jsonObj.add("is_user", "yes");
				jsonObj.add("role_id", role_id );
				jsonObj.add("username", username );
				jsonRet = jsonObj.build();
			} else {
				JsonObjectBuilder jsonObj = Json.createObjectBuilder().add(
						"status", "0");
				jsonObj.add("is_user", "no");
				jsonObj.add("role_id", "null" );
				jsonObj.add("username", "null" );
				jsonRet = jsonObj.build();
			}
			
		
			stmt.close();
			
		} catch (Exception e) {
			
			
		}
		out.print(jsonRet.toString());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
