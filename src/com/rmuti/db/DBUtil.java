package com.rmuti.db;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import javax.json.JsonObject;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import javazoom.upload.MultipartFormDataRequest;
import javazoom.upload.UploadBean;
import javazoom.upload.UploadException;
import javazoom.upload.UploadFile;

import org.apache.jasper.tagplugins.jstl.core.Out;

import com.mysql.jdbc.PreparedStatement;
import com.sun.javafx.geom.Area;
import com.sun.xml.internal.bind.v2.schemagen.xmlschema.List;

public class DBUtil {

	Connection connect;
	private String setToppic_id;


	public DBUtil() {
		try {
			Class.forName("com.mysql.jdbc.Driver");
			connect = DriverManager.getConnection("jdbc:mysql://localhost:3306/andoird","root","pong084391");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	private void close() {
		try {
			if (connect != null) {
				connect.close();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public boolean isUser(String username, String password) throws SQLException {
	
		Statement stmt = connect.createStatement();
		ResultSet rs = stmt.executeQuery(String.format("select * from tb_user where username = '%s' and password = '%s'",
								        username, password));
		
		
		while (rs.next()) {
			
				connect.close();
				return true;	
					
		}
		
	
		return false;
	}
	///////////////////////////////////////////////////
	public Boolean chkUser(String username , String email) throws SQLException {
		String user = null;
		String em = null;
		Statement stmt = connect.createStatement();
		ResultSet rs = stmt.executeQuery(String.format("select * from tb_user where username = '%s' or userEmail = '%s'",
								        username,email));
		while (rs.next()) {
			
				
					connect.close();
					return true;		
		}
		return false;
	}
	///////////////////////////////////////////////////
	public Boolean chkUser2(String username ) throws SQLException {
		String user = null;
		String em = null;
		Statement stmt = connect.createStatement();
		ResultSet rs = stmt.executeQuery(String.format("select * from tb_user where username = '"+username+"' "));
		while (rs.next()) {
			
				
					connect.close();
					return true;		
		}
		return false;
	}
	///////////////////////////////////////////////////////
	public boolean isRegister(String username, String password,String address,String name, String tel, String email) throws SQLException {
		String user = null;
		String em = null;
		//DBUtil db = new DBUtil();
		Statement stmt =null;
		//chek USER,Email
		try {
  			Class.forName("org.gjt.mm.mysql.Driver").newInstance();					
  			connect = DriverManager.getConnection("jdbc:mysql://localhost:3306/andoird", "root", "1234");	
  			stmt = connect.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_READ_ONLY);
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
		try{
			ResultSet rs = stmt.executeQuery(String.format("select * from tb_user where username = '%s'",
			        username));
			while (rs.next()) {
				try {
					user=new String(rs.getString("username").getBytes(),"TIS-620");
					em=new String(rs.getString("email").getBytes(),"TIS-620");
					if(username.equals(user)||email.equals(em)){
						
						connect.close();
						stmt.close();
						return false;
						
					}
					
					}catch (UnsupportedEncodingException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
				}
			}
					
		
		String sql=("insert into tb_user (username,password,userAddress,name,userTel,userEmail,cat_topic,role_id) "
				+ " values ('"+username+"','"+password+"','"+address+"','"+name+"','"+tel+"','"+email+"',0,3)");
		//ResultSet rs = stmt.executeQuery(String.format("insert into member (Username,Password,Name,Tel,Email)  values (username= '%s' and password= '%s' and name= '%s' and tel= '%s' and email= '%s')",username,password,name,tel,email)); 
		
	        
	        
	       stmt.executeUpdate(sql);  
	       
	        connect.close();  
	       
			return true;
			
		}catch (SQLException e) {
			e.printStackTrace();
		
		}
		return false;
	}
///////////////////////////	
	
/////////////////////////
	public static void main(String[] args) throws SQLException {
		DBUtil dbUtil = new DBUtil();
		Conndb conn = new Conndb();
		boolean b;
		String a;
		JsonObject aa;
	
		//saa = conn.SearchAPI("42", "1");
		
		
//b= dbUtil.isUpload("23", "aasd", "dasdwdq", "dadasd", C:\\Users\\Administrator\\Pictures\\Beach\\345.jpg);

		b = dbUtil.isRegister("2312", "fesf", "fsdf", "fsdfd", "342", "fsdfs");
		
		System.out.println(b);
		
	}

}
