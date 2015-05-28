package com.rmuti.db;

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

public class Conndb {
	Connection Conn;
	Statement Stmt;

	public Statement getConn() {
		try {// ดักจับข้อผิดพลาดจากการเรียกไดร์เวอร์
			Class.forName("com.mysql.jdbc.Driver");// เรียกDriver MySQL
			try {// ดักจับข้อผิดพลาดจากการเชื่อมต่อกับฐานข้อมูล
				Conn = DriverManager.getConnection(
						"jdbc:mysql://localhost:3306/andoird", "root","pong084391"); // เชื่อมต่อกับฐานข้อมูล
				Stmt = Conn.createStatement();// สร้างอ๊อบเจ็ค "สเตทเมนท์"
												// เพื่อสามารถเรียกใช้คำสั่งจัดการฐานข้อมูล
			} catch (SQLException ex) {// หากเชื่อมต่อมีปัญหา
				Logger.getLogger(Conndb.class.getName()).log(Level.SEVERE,
						null, ex);
			}
		} catch (ClassNotFoundException ex) {// หากมีข้อผิดพลาดจากการเรียกไดร์เวอร์
			Logger.getLogger(Conndb.class.getName())
					.log(Level.SEVERE, null, ex);
		}
		return Stmt;
	}

	public void closeConn() {// เมธอด ยกเลิกการเชื่อมต่อฐานข้อมูล
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
//----------------------------------AllCat--------------------------------
	public JsonObject isUser() throws SQLException {
		JsonObject jsonRet = null;
		Statement stmt = getConn();
		ResultSet rs = stmt.executeQuery("select * from cat_id ");
		JsonObjectBuilder jsonObj = Json.createObjectBuilder().add("status", "0");
		JsonArrayBuilder jsonArray = Json.createArrayBuilder();
		while (rs.next()) {
			String catId = rs.getString("cat_id");
			String catTopic = rs.getString("cat_topic");
			String UserName = rs.getString("username");
			String dateTime = rs.getString("date_time");
			jsonArray.add(Json.createObjectBuilder().add("cat_id", catId).add("cat_topic", catTopic).add("userName", UserName).add("date", dateTime));
		}
		jsonObj.add("data", jsonArray);
		jsonRet = jsonObj.build();
		return jsonRet;
	}
//----------------------------------ShowCatID---------------------------------------------------------------	
	public JsonObject isUser2() throws SQLException {
		JsonObject jsonRet2 = null;
		Statement stmt2 = getConn();
		ResultSet rs2 = stmt2.executeQuery("select * from post ORDER BY topic_id DESC");
		JsonObjectBuilder jsonObj2 = Json.createObjectBuilder().add("status", "0");
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
			jsonArray2.add(Json.createObjectBuilder().add("topic_id", topicId).add("cat_id", catId).add("topic", topic)
													.add("description", des ).add("owner", owner).add("dateTime", dateTime)
													.add("img", img).add("top_id", top).add("CountNum", num));
		}
		jsonObj2.add("data", jsonArray2);
		jsonRet2 = jsonObj2.build();
		return jsonRet2;
	}
	
//-----------------------------------------login API ----------------
	public boolean isUser3(String username, String password) throws SQLException {
		Statement stmt = Conn.createStatement();
		ResultSet rs = stmt.executeQuery(String.format("select 1 from tb_user where username = '%s' and password = '%s'",
								        username, password));
		while (rs.next()) {
			return true;
		}
		return false;
	}
	
	
//--------------------------------------------------------------------------------
	public static void main(String[] args) {
		Conndb Conndb = new Conndb();
		boolean b;
		try {
			JsonObject jsonObj = Conndb.isUser();
			JsonObject jsonObj2 = Conndb.isUser2();
			b = Conndb.isUser3("test1","test1");	
			System.out.println(jsonObj);
			System.out.println(jsonObj2);
			System.out.println(b);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}



