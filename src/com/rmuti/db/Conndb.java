package com.rmuti.db;

import java.io.UnsupportedEncodingException;
import java.sql.*;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;

import javax.json.Json;
import javax.json.JsonArray;
import javax.json.JsonArrayBuilder;
import javax.json.JsonBuilderFactory;
import javax.json.JsonObject;
import javax.json.JsonObjectBuilder;

import com.rmuti.Config;

public class Conndb {
	Connection Conn;
	Statement Stmt;

	public Statement getConn() {
		try {
			Class.forName("com.mysql.jdbc.Driver");
													
			try {
				Conn = DriverManager.getConnection(
						"jdbc:mysql://localhost:3306/"+Config.db_name+"?characterEncoding=utf-8", Config.db_user, Config.db_password); 
				Stmt = Conn.createStatement();
												
											
			} catch (SQLException ex) {
				Logger.getLogger(Conndb.class.getName()).log(Level.SEVERE,null, ex);
			}
		} catch (ClassNotFoundException ex) {
			Logger.getLogger(Conndb.class.getName())
					.log(Level.SEVERE, null, ex);
		}
		return Stmt;
	}

	public void closeConn() {
								
		try {
			Conn.close();
		} catch (SQLException ex) {
			Logger.getLogger(Conndb.class.getName())
					.log(Level.SEVERE, null, ex);
		}
	}

	// ---------------------------------json----------------------------------
	private void close() {
		try {
			if (Conn != null) {
				Conn.close();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	// ----------------------------------AllCat--------------------------------
	public JsonObject isUser() throws SQLException {
		JsonObject jsonRet = null;
		Statement stmt = getConn();
		ResultSet rs = stmt.executeQuery("select * from cat_id ");
		JsonObjectBuilder jsonObj = Json.createObjectBuilder().add("status",
				"0");
		JsonArrayBuilder jsonArray = Json.createArrayBuilder();
		while (rs.next()) {
			String catId = rs.getString("cat_id");
			String catTopic = rs.getString("cat_topic");
			String UserName = rs.getString("username");
			String dateTime = rs.getString("date_time");
			jsonArray.add(Json.createObjectBuilder().add("cat_id", catId)
					.add("cat_topic", catTopic).add("userName", UserName)
					.add("date", dateTime));
		}
		rs.close();
		stmt.close();
		jsonObj.add("data", jsonArray);
		jsonRet = jsonObj.build();
		return jsonRet;
	}

	// ----------------------------------ShowCatID---------------------------------------------------------------

	public JsonObject isUser2() throws SQLException {

		JsonObject jsonRet2 = null;
		Statement stmt2 = getConn();
		ResultSet rs2 = stmt2
				.executeQuery("select * from post  Where top_id between 0 And 1 ORDER BY top_id DESC,topic_id DESC");
		JsonObjectBuilder jsonObj2 = Json.createObjectBuilder().add("status",
				"0");
		JsonArrayBuilder jsonArray2 = Json.createArrayBuilder();
		while (rs2.next()) {

			String topicId = rs2.getString("topic_id");
			String catId = rs2.getString("cat_id");
			String topic = rs2.getString("topic");
			String des = rs2.getString("description");
			String owner = rs2.getString("owner");
			String dateTime = rs2.getString("date_time");
			String img = rs2.getString("img");
			String top = rs2.getString("top_id");
			String num = rs2.getString("num_reply");
			jsonArray2.add(Json.createObjectBuilder().add("topic_id", topicId)
					.add("cat_id", catId).add("topic", topic)
					.add("description", des).add("owner", owner)
					.add("dateTime", dateTime).add("img", img)
					.add("top_id", top).add("CountNum", num));
		}
		rs2.close();
		stmt2.close();
		jsonObj2.add("data", jsonArray2);
		jsonRet2 = jsonObj2.build();
		return jsonRet2;
	}

	// ----------------------------------padePost
	// ---------------------------------------------------------------
	// show all comment of post
	public String toppicId;

	public JsonObject PostAPI() throws SQLException {
		JsonObject jsonRet = null;
		Statement stmt = getConn();
		ResultSet rs = stmt
				.executeQuery("select * from post_reply where topic_id ='"
						+ toppicId + "' ORDER BY id DESC");
		JsonObjectBuilder jsonObj3 = Json.createObjectBuilder().add("status",
				"0");
		JsonArrayBuilder jsonArray3 = Json.createArrayBuilder();
		while (rs.next()) {
			String id = rs.getString("id");
			String topicid = rs.getString("topic_id");
			String name = rs.getString("name");
			String descpReply = rs.getString("description");
			String datetime = rs.getString("date_time");

			jsonArray3.add(Json.createObjectBuilder().add("id", id)
					.add("topic_id", topicid).add("name", name)
					.add("description", descpReply).add("date_time", datetime));
		}
		rs.close();
		stmt.close();
		jsonObj3.add("data", jsonArray3);
		jsonRet = jsonObj3.build();
		return jsonRet;
	}

	// ----------------------------------padePost2
	// ---------------------------------------------------------------
	// show all category
	public String catID;

	public JsonObject PostAPI2() throws SQLException {

		JsonObject jsonRet2 = null;
		Statement stmt2 = getConn();
		ResultSet rs2 = stmt2.executeQuery("Select * from post Where cat_id='"+catID+"'and top_id between 0 and 1 order by top_id desc ,topic_id desc");
		JsonObjectBuilder jsonObj2 = Json.createObjectBuilder().add("status",
				"0");
		JsonArrayBuilder jsonArray2 = Json.createArrayBuilder();
		while (rs2.next()) {

			String topicId = rs2.getString("topic_id");
			String catId = rs2.getString("cat_id");
			String topic = rs2.getString("topic");
			String des = rs2.getString("description");
			String owner = rs2.getString("owner");
			String dateTime = rs2.getString("date_time");
			String img = rs2.getString("img");
			String top = rs2.getString("top_id");
			String num = rs2.getString("num_reply");
			jsonArray2.add(Json.createObjectBuilder().add("topic_id", topicId)
					.add("cat_id", catId).add("topic", topic)
					.add("description", des).add("owner", owner)
					.add("dateTime", dateTime).add("img", img)
					.add("top_id", top).add("CountNum", num));
			rs2.close();
			stmt2.close();
		}
		jsonObj2.add("data", jsonArray2);
		jsonRet2 = jsonObj2.build();
		return jsonRet2;
		
	}

	// ----------------------------------------- ----------------
	// show one topic
	public String catID2;
	public String toppicId2;

	public JsonObject PostAPI3() throws SQLException {

		JsonObject jsonRet2 = null;
		Statement stmt2 = getConn();
		JsonObjectBuilder jsonObj2 = Json.createObjectBuilder().add("status",
				"0");
		JsonArrayBuilder jsonArray2 = Json.createArrayBuilder();
		ResultSet rs2 = stmt2
				.executeQuery("select * from post where  topic_id='"
						+ toppicId2 + "'and cat_id ='" + catID2
						+ "'   ORDER BY topic_id DESC ");

		if (rs2.next()) {

			String topicId = rs2.getString("topic_id");
			String catId = rs2.getString("cat_id");
			String topic = rs2.getString("topic");
			String des = rs2.getString("description");
			String owner = rs2.getString("owner");
			String dateTime = rs2.getString("date_time");
			String img = rs2.getString("img");
			String top = rs2.getString("top_id");
			String num = rs2.getString("num_reply");
			jsonArray2.add(Json.createObjectBuilder().add("topic_id", topicId)
					.add("cat_id", catId).add("topic", topic)
					.add("description", des).add("owner", owner)
					.add("dateTime", dateTime).add("img", img)
					.add("top_id", top).add("CountNum", num));
		}
		rs2.close();
		stmt2.close();
		jsonObj2.add("data", jsonArray2);
		jsonRet2 = jsonObj2.build();
		return jsonRet2;

	}

	// ----------------------------------------- ----------------

	public String Username;

	public JsonObject EditPost() throws SQLException {

		JsonObject jsonRet2 = null;
		Statement stmt2 = getConn();
		JsonObjectBuilder jsonObj2 = Json.createObjectBuilder().add("status",
				"0");
		JsonArrayBuilder jsonArray2 = Json.createArrayBuilder();
		ResultSet rs2 = stmt2.executeQuery("SELECT * FROM post WHERE owner='"
				+ Username + "' ORDER BY top_id DESC , topic_id DESC");

		while (rs2.next()) {

			String topicId = rs2.getString("topic_id");
			String catId = rs2.getString("cat_id");
			String topic = rs2.getString("topic");
			String des = rs2.getString("description");
			String owner = rs2.getString("owner");
			String dateTime = rs2.getString("date_time");
			String img = rs2.getString("img");
			String top = rs2.getString("top_id");
			String num = rs2.getString("num_reply");
			jsonArray2.add(Json.createObjectBuilder().add("topic_id", topicId)
					.add("cat_id", catId).add("topic", topic)
					.add("description", des).add("owner", owner)
					.add("dateTime", dateTime).add("img", img)
					.add("top_id", top).add("CountNum", num));
		}
		rs2.close();
		stmt2.close();
		closeConn();
		jsonObj2.add("data", jsonArray2);
		jsonRet2 = jsonObj2.build();
		return jsonRet2;

	}

	// ////////////////////////////////////////////---------------------------///////////////////////////////////

	public JsonObject ShowCatlist() throws SQLException {

		JsonObject jsonRet2 = null;
		Statement stmt2 = getConn();
		JsonObjectBuilder jsonObj2 = Json.createObjectBuilder().add("status",
				"0");
		JsonArrayBuilder jsonArray2 = Json.createArrayBuilder();
		ResultSet rs2 = stmt2
				.executeQuery("SELECT * FROM cat_id WHERE cat_id='" + catID	+ "' ");

		if (rs2.next()) {

			String catId = rs2.getString("cat_id");
			String cat_topic = rs2.getString("cat_topic");
			String username = rs2.getString("username");
			String dateTime = rs2.getString("date_time");
			String num = rs2.getString("num_reply");
			jsonArray2.add(Json.createObjectBuilder().add("cat_id", catId)
					.add("cat_id", catId).add("cat_topic", cat_topic)
					.add("username", username).add("date_time", dateTime)
					.add("num_reply", num));
		}
		rs2.close();
		stmt2.close();
		jsonObj2.add("data", jsonArray2);
		jsonRet2 = jsonObj2.build();
		return jsonRet2;

	}
/////////////////////////Search/////////////////////////////////////////////
	public JsonObject SearchAPI(String catid, String txt) throws SQLException {

		JsonObject jsonRet2 = null;
		Statement stmt2 = getConn();
		JsonObjectBuilder jsonObj2 = Json.createObjectBuilder().add("status",
				"0");
		JsonArrayBuilder jsonArray2 = Json.createArrayBuilder();
		ResultSet rs2 = stmt2.executeQuery("SELECT * FROM post WHERE cat_id = '"+catid+"' AND topic LIKE '%"+txt+"%'");
try {
	

		while (rs2.next()) {

			String topicId = rs2.getString("topic_id");
			String catId = rs2.getString("cat_id");
			String topic = rs2.getString("topic");
			String des = rs2.getString("description");
			String owner = rs2.getString("owner");
			String dateTime = rs2.getString("date_time");
			String img = rs2.getString("img");
			String top = rs2.getString("top_id");
			String num = rs2.getString("num_reply");
			jsonArray2.add(Json.createObjectBuilder().add("topic_id", topicId)
					.add("cat_id", catId).add("topic", topic)
					.add("description", des).add("owner", owner)
					.add("dateTime", dateTime).add("img", img)
					.add("top_id", top).add("CountNum", num));
		}
		rs2.close();
		stmt2.close();
		jsonObj2.add("data", jsonArray2);
		jsonRet2 = jsonObj2.build();
		return jsonRet2;
		} catch (Exception e) {
	// TODO: handle exception
		}return null;

	}
//////////////////////////////////////////////Search ALL////////////////////
	public JsonObject SearchAllAPI( String txt) throws SQLException {

		JsonObject jsonRet2 = null;
		Statement stmt2 = getConn();
		JsonObjectBuilder jsonObj2 = Json.createObjectBuilder().add("status",
				"0");
		JsonArrayBuilder jsonArray2 = Json.createArrayBuilder();
		ResultSet rs2 = stmt2.executeQuery("SELECT * FROM post WHERE topic LIKE '%"+txt+"%'");
try {
	

		while (rs2.next()) {

			String topicId = rs2.getString("topic_id");
			String catId = rs2.getString("cat_id");
			String topic = rs2.getString("topic");
			String des = rs2.getString("description");
			String owner = rs2.getString("owner");
			String dateTime = rs2.getString("date_time");
			String img = rs2.getString("img");
			String top = rs2.getString("top_id");
			String num = rs2.getString("num_reply");
			jsonArray2.add(Json.createObjectBuilder().add("topic_id", topicId)
					.add("cat_id", catId).add("topic", topic)
					.add("description", des).add("owner", owner)
					.add("dateTime", dateTime).add("img", img)
					.add("top_id", top).add("CountNum", num));
		}
		rs2.close();
		stmt2.close();
		jsonObj2.add("data", jsonArray2);
		jsonRet2 = jsonObj2.build();
		return jsonRet2;
		} catch (Exception e) {
	// TODO: handle exception
		}return null;

	}
	// -----------------------------------------login API ----------------
	public boolean isUser3(String username, String password)
			throws SQLException {
		Statement stmt = Conn.createStatement();
		ResultSet rs = stmt
				.executeQuery(String
						.format("select 1 from tb_user where username = '%s' and password = '%s'",
								username, password));
		while (rs.next()) {
			 try {
				String role_id = new String(rs.getString("role_id").getBytes(),"TIS-620");		
			   String cat_topic= new String(rs.getString("cat_topic").getBytes(),"TIS-620");	
				} catch (UnsupportedEncodingException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}	
			 
			 rs.close();
				stmt.close();
			return true;
		}
		return false;
	}

	// --------------------------------------------------------------------------------

	public JsonObject jsonLoginStaffAPI(String username) throws SQLException {
		JsonObject jsonRet = null;
	
		Statement stmt = getConn();	
		ResultSet rs = stmt.executeQuery(String.format("select * from tb_user where username = '%s'",
								        username));
		JsonObjectBuilder jsonObj2 = Json.createObjectBuilder().add("status",
				"0");
		JsonArrayBuilder jsonArray = Json.createArrayBuilder();
		try {
			
		
		while (rs.next()) {

			String name = rs.getString("name");
			String userAddress = rs.getString("userAddress");
			String userTel = rs.getString("userTel");
			String userEmail = rs.getString("userEmail");
			String cat_topic = rs.getString("cat_topic");
			String role_id = rs.getString("role_id");
			
			jsonArray.add(Json.createObjectBuilder()
					.add("name", name)
					.add("userAddress", userAddress)
					.add("userTel", userTel)									
					.add("userEmail", userEmail)
					.add("cat_topic", cat_topic)
					.add("role_id", role_id)
					);
		}
		
		Conn.close();
		jsonObj2.add("data", jsonArray);
		jsonRet = jsonObj2.build();
		return jsonRet;
		}
		catch (Exception e) {
	// TODO: handle exception
		}return null;
		
		}
		
	///////////=============================================////////////////////////////
	public JsonObject jsonCatStaff(String username) throws SQLException {
		JsonObject jsonRet = null;
		Statement stmt = getConn();
		ResultSet rs = stmt.executeQuery("select * from cat_id where username ='"+username+"' ");
		JsonObjectBuilder jsonObj = Json.createObjectBuilder().add("status",
				"0");
		JsonArrayBuilder jsonArray = Json.createArrayBuilder();
		if (rs.next()) {
			String catId = rs.getString("cat_id");
			String catTopic = rs.getString("cat_topic");
			String UserName = rs.getString("username");
			String dateTime = rs.getString("date_time");
			String num_reply = rs.getString("num_reply");
			
			jsonArray.add(Json.createObjectBuilder().add("cat_id", catId)
					.add("cat_topic", catTopic).add("username", UserName)
					.add("date", dateTime).add("num_reply", num_reply));
		}
		jsonObj.add("data", jsonArray);
		jsonRet = jsonObj.build();
		return jsonRet;
	}
		
	//======================================================================================//
	public static void main(String[] args) {
		Conndb Conndb = new Conndb();
		boolean b;
		JsonObject s;
		try {
			// JsonObject jsonObj = Conndb.isUser();
			// JsonObject jsonObj2 = Conndb.isUser2();
			JsonObject jsonObj3 = Conndb.PostAPI();
			s = Conndb.SearchAllAPI("f");
			
			// System.out.println(jsonObj2);
			System.out.println(s);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}


}
