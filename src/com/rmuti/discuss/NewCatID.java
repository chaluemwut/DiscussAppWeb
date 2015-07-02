package com.rmuti.discuss;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.tomcat.util.buf.UDecoder;

import sun.reflect.ReflectionFactory.GetReflectionFactoryAction;

import com.mysql.jdbc.UpdatableResultSet;
import com.rmuti.Config;
import com.sun.corba.se.impl.util.Utility;

import java.sql.*;
import java.util.Vector;

import javazoom.upload.*;

import java.io.*;

/**
 * Servlet implementation class NewCatID
 */
@WebServlet("/NewCatID")
public class NewCatID extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NewCatID() {
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
 		} catch (UploadException e) {
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
 		} catch (UploadException e) {
 			// TODO Auto-generated catch block
 			e.printStackTrace();
 		}
 	}
 	
 	public void performTask(HttpServletRequest request, HttpServletResponse response) throws IOException, UploadException{
 		
 		
 		response.setContentType("text/html;charset=UTF-8");
 		PrintWriter out = response.getWriter();
 		String u = (String) request.getSession().getAttribute("userid");
 		if(u == null){
 			response.sendRedirect("login.jsp");
 		}	
 		
 		

 			MultipartFormDataRequest mul=new MultipartFormDataRequest(request);
 		//request.setCharacterEncoding("UTF-8");		
 		
 		//String owner = com.rmuti.db.Utility.convertThai(mul.getParameter("param_name"));
 		String cat_Topic = com.rmuti.db.Utility.convertThai(mul.getParameter("cat_topic"));
 		//String username = com.rmuti.db.Utility.convertThai(mul.getParameter("username"));
 		//String password = com.rmuti.db.Utility.convertThai(mul.getParameter("password"));
 		
 		
 		try {					
 			
 			
 				
 			
 			Class.forName("org.gjt.mm.mysql.Driver").newInstance();			
 			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/"+Config.db_name+"?characterEncoding=utf-8",Config.db_user,Config.db_password);
 			Statement stmt = con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_READ_ONLY);
 			ResultSet rs = stmt.executeQuery("select * from cat_id order by cat_id asc");
 			
 			String id;
 			
 			
 			if(con != null) {
 				if(rs != null) {
 					
 					/*if(rs.next()) {
						rs.last();
						id = rs.getString("topic_id");
						id = Integer.toString(Integer.parseInt(id)+1);
					} 
					else {
						id = "1";
					} */
					
 					
 					rs.close();

 					java.util.Date d = new java.util.Date();
 					String day=d.toString().substring(8,10);
 					String month=d.toString().substring(4,7);
 					String year=d.toString().substring(d.toString().length()-4,d.toString().length());
 					String time=d.toString().substring(11,19);

 					if(month.equals("Jan")) month = "มกราคม";
 					else if(month.equals("Feb")) month = "กุมภาพันธ์";
 					else if(month.equals("Mar")) month = "มีนาคม";
 					else if(month.equals("Apr")) month = "เมษายน";
 					else if(month.equals("May")) month = "พฤษภาคม";
 					else if(month.equals("Jun")) month = "มิถุนายน";
 					else if(month.equals("Jul")) month = "กรกฎาคม";
 					else if(month.equals("Aug")) month = "สิงหาคม";
 					else if(month.equals("Sep")) month = "กันยายน";
 					else if(month.equals("Oct")) month = "ตุลาคม";
 					else if(month.equals("Nov")) month = "พฤศจิกายน";
 					else if(month.equals("Dec")) month = "ธันวาคม";

 					year = Integer.toString(Integer.parseInt(year)+543);

 					String datetime = day+" "+month+" "+year+" "+time;
 					
 					String username="NoUser";
 					String password="null";
 					String adderess="null";
 					String tel="null";
 					String email="null";

 					String sql = "insert into cat_id (cat_topic,username,date_time,num_reply) values ('"+cat_Topic+"','"+username+"','"+datetime+"',0)";
 					String sql2 ="insert into tb_user (username,password,name,userAddress,userTel,userEmail,cat_topic,role_id) values ('"+username+"','"+password+"','"+username+"','"+adderess+"','"+tel+"','"+email+"','"+cat_Topic+"',2)";
 					int return_val = stmt.executeUpdate(sql);				
 					int return_val2 = stmt.executeUpdate(sql2);
 					

 					

 					
 					
 					if(return_val==1) {
 						response.sendRedirect("ShowCatOK.jsp");
 						//out.print("เพิ่มหมวดกระทู้เรียบร้อยแล้ว !!!<BR>");
 						//out.print("<A HREF=\"Allcat.jsp\">ดูกระทู้ทั้งหมด</A>");
 					}
 					else {
 						response.sendRedirect("ShowCatNoOK.jsp");
 						//out.print("ไม่สามารถเพิ่มกระทู้ได้ กรุณาลองใหม่!!!<BR>");
 						//out.print("<A HREF=\"topic.jsp\">กลับไปสร้างกระทู้ใหม่</A>");
 					}
 				}
 				stmt.close();
 				con.close();
 			}
 		} catch(Exception e) {
 			response.sendRedirect("ShowCatNoOK.jsp");
 			//out.print("ไม่สามารถเพิ่มกระทู้ได้ กรุณาลองใหม่ !!!<BR>"); 
 			//out.print("<A HREF=\"topic.jsp\">กลับไปสร้างกระทู้ใหม่</A>");
 			System.out.println(e);
 		}
 		}
 

 	@SuppressWarnings("unused")
 	private String request(String parameter) {
 		// TODO Auto-generated method stub
 		return null;
 	}

 }