package com.rmuti.discuss;

import java.io.IOException;

import javax.json.Json;
import javax.json.JsonObject;
import javax.json.JsonObjectBuilder;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.rmuti.db.Conndb;


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
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		JsonObject jsonRet = null;
		ServletOutputStream out = response.getOutputStream();
		// connect database		
		Conndb db = new Conndb();
		
		
		try {
			if (db.isUser3(username, password)) {
				JsonObjectBuilder jsonObj = Json.createObjectBuilder().add(
						"status", "0");
				jsonObj.add("is_user", "yes");
				jsonRet = jsonObj.build();
			} else {
				JsonObjectBuilder jsonObj = Json.createObjectBuilder().add(
						"status", "0");
				jsonObj.add("is_user", "no");
				jsonRet = jsonObj.build();
			}
		} catch (Exception e) {
			
		}
		out.print(jsonRet.toString());
	}

	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
