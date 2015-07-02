package com.rmuti.android;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.json.Json;
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
import com.rmuti.Config;
import com.rmuti.db.Conndb;
import com.rmuti.db.DBUtil;
import com.rmuti.db.Utility;


/**
 * Servlet implementation class RegisterAPI
 */
@WebServlet("/RegisterAPI")
public class RegisterAPI extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegisterAPI() {
        super();
        // TODO Auto-generated constructor stub
    }

///////////////////
   

	//////////////////////////////
  
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	//request.setCharacterEncoding("UTF-8");
  	  // response.setContentType("text/html;charset=UTF-8");
//    	String topicid = null;
//  		String catid=null;	
//  		Statement stmt = null;
//  		Connection connect = null;
//  		PrintWriter out = response.getWriter();
//    			String username = request.getParameter("username");
//    			String password =  request.getParameter("password");
//    			String name =  Utility.convertThai( request.getParameter("name").toString());
//    			String tel = request.getParameter("tel");
//    			String email =  request.getParameter("email");
//    			String address =   request.getParameter("address");
//    			System.out.println(name);
//    			JsonObject jsonRet = null;
//    			
//    			// connect database		
//    			DBUtil db = new DBUtil();
//    			
//    			
//    			try {
//    				if (db.isRegister(username, password,address, name, tel, email)) {
//    					JsonObjectBuilder jsonObj = Json.createObjectBuilder().add(
//    							"status", "0");
//    					jsonObj.add("is_register", "yes");
//    					jsonRet = jsonObj.build();
//    				} else {
//    					JsonObjectBuilder jsonObj = Json.createObjectBuilder().add(
//    							"status", "0");
//    					jsonObj.add("is_register", "no");
//    					jsonRet = jsonObj.build();
//    				}
//    			} catch (Exception e) {
//    				
//    			}
//    			out.print(jsonRet.toString());
//    			
    		}

	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		JsonObject jsonRet = null;
		Conndb conndb = new Conndb();	
		HttpSession session = request.getSession();
	    request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		String topicid = null;
  		String catid=null;	
  		Statement stmt = null;
  		Connection connect = null;
  		
    			String username = request.getParameter("username");
    			String password =  request.getParameter("password");
    			String name =request.getParameter("name");
    			String tel = request.getParameter("tel");
    			String email =  request.getParameter("email");
    			String address = request.getParameter("address");
    			
    			
    			System.out.println(name);
    		
    			System.out.println(address);
    			
    			// connect database		
    			try {
    	  			Class.forName("org.gjt.mm.mysql.Driver").newInstance();					
    	  			connect = DriverManager.getConnection("jdbc:mysql://localhost:3306/"+Config.db_name+"?characterEncoding=utf-8",Config.db_user,Config.db_password);
    	  			stmt = (Statement) connect.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_READ_ONLY);
    	  		} catch (SQLException e1) {
    	  			// TODO Auto-generated catch block
    	  			e1.printStackTrace();
    	  		
    	  		} catch (InstantiationException e1) {
    	  		// TODO Auto-generated catch block
    	  			e1.printStackTrace();
    	  		} catch (IllegalAccessException e1) {
    	  		// TODO Auto-generated catch block
    	  		e1.printStackTrace();
    	  		} catch (ClassNotFoundException e) {
    	  		// TODO Auto-generated catch block
    	  			e.printStackTrace();
    	  		}
    			
    						
    			
    			String sql=("insert into tb_user (username,password,userAddress,name,userTel,userEmail,cat_topic,role_id) "
    					+ " values ('"+username+"','"+password+"','"+address+"','"+name+"','"+tel+"','"+email+"',0,3)");
    			//ResultSet rs = stmt.executeQuery(String.format("insert into member (Username,Password,Name,Tel,Email)  values (username= '%s' and password= '%s' and name= '%s' and tel= '%s' and email= '%s')",username,password,name,tel,email)); 
    			
    		        
    		        
    		       try {
					stmt.executeUpdate(sql);
			
    		       
					stmt.close();
						connect.close();
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
