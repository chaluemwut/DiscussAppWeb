package com.rmuti.android;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.rmuti.Config;

import javazoom.upload.MultipartFormDataRequest;
import javazoom.upload.UploadBean;
import javazoom.upload.UploadException;
import javazoom.upload.UploadFile;

/**
 * Servlet implementation class SendImage
 */
@WebServlet("/SendImage")
public class SendImage extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
	private ServletOutputStream out;
	private static final String CACHE_PATH = "./temp/";
    private static final int CACHE_SIZE = 100*(int)Math.pow(10,6);
    private static final int MAX_REQUEST_SIZE = 10*(int)Math.pow(10,6);
    private static final int MAX_FILE_SIZE = 1*(int)Math.pow(10,6);
    String GettopID ;
    /**
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SendImage() {
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
		HttpSession session = request.getSession(true);
		
		
		
		//String u = (String) request.getSession().getAttribute("userid");
		
		
		if (MultipartFormDataRequest.isMultipartFormData(request)) {
			 
			MultipartFormDataRequest mul=new MultipartFormDataRequest(request);
		   request.setCharacterEncoding("UTF-8");		
		 

		String topic_id=mul.getParameter("topic_id");
		UploadFile file = (UploadFile) mul.getFiles().get("filUpload") ;
		
		//out.print(topic_id);
		UploadBean up = new UploadBean();
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
		else if(month.equals("Nov")) month = "พฤศจิกายน�";
		else if(month.equals("Dec")) month = "ธันวาคม";

		year = Integer.toString(Integer.parseInt(year)+543);

		String datetime = day+" "+month+" "+year+" "+time;
		
		int top = 0;
		
		//String Topicid ="5";
	 file.setFileName(String.valueOf(d.getTime()+".png" ));
	 String imgGetName =  String.valueOf(file.getFileName());
	 up.setFolderstore(Config.path_file);
		up.store(mul);
		 
		try {		
			

			
String id="";			
				
			
			Class.forName("org.gjt.mm.mysql.Driver").newInstance();			
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/"+Config.db_name+"?characterEncoding=utf-8",Config.db_user,Config.db_password);
			Statement stmt = con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_READ_ONLY);
			
	
			ResultSet rs = stmt.executeQuery(String.format("select max(topic_id) AS topic_id from post "));
			
			while (rs.next()) {
				try {
					  String topicid = new String(rs.getString("topic_id").getBytes(),"TIS-620");		
					    GettopID = topicid;
					  System.out.println(GettopID);
					String sql1 = "UPDATE post set img='"+ imgGetName + "' " +
				" WHERE topic_id = '" + GettopID + "' ";
					//String sql2 = "update cat_id set num_reply=num_reply+1 where cat_id='"+cat_id+"'";
					int return_val = stmt.executeUpdate(sql1);
					//int return_val2 = stmt.executeUpdate(sql2);
						rs.close();
						stmt.close();
				    	con.close();
							
						} 
				catch (Exception e) {
								
					e.printStackTrace();
	    	
					}	
			
					
}
					
					
					
					}	
		 catch(Exception e) {
			
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
