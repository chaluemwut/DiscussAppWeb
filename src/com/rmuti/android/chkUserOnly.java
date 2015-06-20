package com.rmuti.android;

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

import com.rmuti.db.DBUtil;

/**
 * Servlet implementation class chkUserOnly
 */
@WebServlet("/chkUserOnly")
public class chkUserOnly extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public chkUserOnly() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String username = request.getParameter("username");
		
		JsonObject jsonRet = null;
		ServletOutputStream out = response.getOutputStream();
		// connect database		
		DBUtil db = new DBUtil();
		try {
			if (db.chkUser2(username)) {
				JsonObjectBuilder jsonObj = Json.createObjectBuilder().add(
						"status", "0");
				jsonObj.add("chk_user", "yes");
				jsonRet = jsonObj.build();
			} else {
				JsonObjectBuilder jsonObj = Json.createObjectBuilder().add(
						"status", "0");
				jsonObj.add("chk_user", "no");
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
