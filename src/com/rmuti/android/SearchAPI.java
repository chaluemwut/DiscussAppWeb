package com.rmuti.android;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;

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
import javax.servlet.http.HttpSession;
import javax.xml.ws.http.HTTPException;

import javazoom.upload.MultipartFormDataRequest;

import com.mysql.jdbc.Statement;
import com.rmuti.db.Conndb;
import com.rmuti.db.DBUtil;
import com.rmuti.db.Utility;


/**
 * Servlet implementation class RegisterAPI
 */
@WebServlet("/SearchAPI")
public class SearchAPI extends HttpServlet {
	private static final long serialVersionUID = 1L;
	Connection connect;
	private ServletOutputStream out;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SearchAPI() {
        super();
        // TODO Auto-generated constructor stub
    }

///////////////////
   

	//////////////////////////////
  
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try {
			
			JsonObject jsonRet = null;
			Conndb conndb = new Conndb();	
			HttpSession session = request.getSession();
		    request.setCharacterEncoding("UTF-8");
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			
			String cat_id = request.getParameter("cat_id");
			String txt = request.getParameter("txt");
		
			JsonObject jsonObj = conndb.SearchAPI(cat_id, txt);
			
			out.print(jsonObj);
			System.out.println(txt);
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	

 

	@SuppressWarnings("unused")
 	private String request(String parameter) {
 		// TODO Auto-generated method stub
 		return null;
 	}

 }
