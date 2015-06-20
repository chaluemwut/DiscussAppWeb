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
import com.sun.corba.se.impl.util.Utility;

import java.sql.*;
import java.util.Vector;

import javazoom.upload.*;

import java.io.*;
/**
 * Servlet implementation class NewPostBoard
 */
@WebServlet("/NewPostBoard")
public class NewPostBoard extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NewPostBoard() {
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
		
		
        //request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		String u = (String) request.getSession().getAttribute("userid");
		if(u == null){
			response.sendRedirect("login.jsp");
		}
		
		if (MultipartFormDataRequest.isMultipartFormData(request)) {

			MultipartFormDataRequest mul=new MultipartFormDataRequest(request);
		//request.setCharacterEncoding("UTF-8");		
		
		String owner = u;	
		//String owner = com.rmuti.db.Utility.convertThai(mul.getParameter("param_name"));
		String cat_id = com.rmuti.db.Utility.convertThai(mul.getParameter("id"));
		String topic = com.rmuti.db.Utility.convertThai(mul.getParameter("param_topic"));
		String desc  = com.rmuti.db.Utility.convertThai(mul.getParameter("param_desc"));
		UploadFile file = (UploadFile) mul.getFiles().get("img_pd") ;
		
		
		
		
		UploadBean up = new UploadBean();
		/*request.setCharacterEncoding("UTF-8");		
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		String owner = request.getParameter("param_name");
		String topic = request.getParameter("param_topic");
		String desc = request.getParameter("param_desc");*/
		
		/*if (MultipartFormDataRequest.isMultipartFormData(request)){
			MultipartFormDataRequest mr;
			mr = new MultipartFormDataRequest(request);
			
			UploadBean u = new UploadBean();
			u.setFolderstore("C:/Users/Administrator/git/DiscussAppWeb/WebContent/img");
			u.store(mr,"upload");
		}*/
		
		
		
		try {		
			
			/* String filetype = "";
			 Vector<String> errors = new Vector<String>();
			 if (file.getData() != null) {
			 String filename = String.valueOf(file.getFileName());
			 filetype = filename.substring(filename.lastIndexOf("."), filename.length());
			 if ((filetype.indexOf("gif") == -1) && (filetype.indexOf("jpeg") == -1) && (filetype.indexOf("jpg") == -1)) {
			 errors.add("ตรวจสอบชนิดไฟล์รูปภาพ");
			 }
			 } else {
			 errors.add("ตรวจสอบไฟล์รูปภาพ");
			 }*/
			
			
String id="";			
				
			
			Class.forName("org.gjt.mm.mysql.Driver").newInstance();			
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/andoird", "root", "pong084391");
			Statement stmt = con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_READ_ONLY);
			ResultSet rs = stmt.executeQuery("select * from post order by cat_id asc");
			
			
			
			
			if(con != null) {
				if(rs != null) {
				
					if(rs.next()) {
						rs.last();
						
					} 
					else {
						
					
					}
					
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
					
					int top = 0;
					
				
					file.setFileName(String.valueOf(d.getTime()+".png" ));
				//	String sql = "insert into post values('"+id+"','"+topic+"','"+desc+"','"+owner+"','"+datetime+"','" + String.valueOf(file.getFileName()) + "',0)";						
				//	int return_val = stmt.executeUpdate(sql);				
					
					
					String sql = "insert into post (cat_id,topic,description,owner,date_time,img,top_id,num_reply) values ('"+cat_id+"','"+topic+"','"+desc+"','"+owner+"','"+datetime+"','" + String.valueOf(file.getFileName()) + "','"+top+"',0)";	
					String sql2 = "update cat_id set num_reply=num_reply+1 where cat_id='"+cat_id+"'";
					int return_val = stmt.executeUpdate(sql);
					int return_val2 = stmt.executeUpdate(sql2);
					
				
					up.setFolderstore("C:\\Users\\Administrator\\git\\DiscussAppWeb\\WebContent\\images");
					up.store(mul);
					
					
			    	if(return_val==1&&return_val2==1) {
					
			    	response.sendRedirect("ShowPostOk.jsp?id="+cat_id+"");	
			    	//out.print("สร้างกระทู้ของคุณเรียบร้อย !!!<BR>");
					//out.print("<A HREF=\"ShowCatID.jsp?id="+cat_id+"\">ดูกระทู้ทั้งหมด</A><BR>");
					
			    	} else {
			    		
			    			response.sendRedirect("ShowPostNo.jsp?id="+cat_id+"");	
			    			//out.print("ไม่สามารถสร้างกระทู้ได้ กรุณาลองใหม่!!!<BR>");
			    			//out.print("<A HREF=\"ShowCatID.jsp?id="+cat_id+"\">กลับไปตอบกระทู้ใหม่</A>");
			    	}
			    	stmt.close();
			    	con.close();
				}	
					
					

					//UploadBean upBean = new UploadBean();
					//pic.setFileName(id.getBytes() +".gif");					
					//upBean.setFolderstore(getServletContext().getRealPath("/images"));
					//upBean.store(mrequest);
					

					
					
					
			}
		} catch(Exception e) {
			response.sendRedirect("ShowPostNo.jsp?id="+cat_id+"");	
			//out.print("ไม่สามารถสร้างกระทู้ได้ กรุณาลองใหม่ !!!<BR>"); 
			//out.print("<A HREF=\"ShowCatID.jsp?id="+cat_id+"\">กลับไปสร้างกระทู้ใหม่</A>");
			System.out.println(e);
		}
		}
	}

	@SuppressWarnings("unused")
	private String request(String parameter) {
		// TODO Auto-generated method stub
		return null;
	}

}