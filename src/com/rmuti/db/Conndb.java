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
						"jdbc:mysql://localhost:3306/andoird", "root",
						"pong084391"); // เชื่อมต่อกับฐานข้อมูล
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

	public JsonObject isUser() throws SQLException {
		JsonObject jsonRet = null;
		Statement stmt = getConn();
		ResultSet rs = stmt.executeQuery("select * from cat_id ");
		JsonObjectBuilder jsonObj = Json.createObjectBuilder().add(
				"status", "0");
		JsonArrayBuilder jsonArray = Json.createArrayBuilder();
		while (rs.next()) {
			String catId = rs.getString("cat_id");
			String catTopic = rs.getString("cat_topic");
			String dateTime = rs.getString("date_time");
			jsonArray.add(Json.createObjectBuilder().add("cat_id", catId).add("cat_topic", catTopic).add("date", dateTime));
		}
		jsonObj.add("data", jsonArray);
		jsonRet = jsonObj.build();
		return jsonRet;
	}

	public static void main(String[] args) {
		Conndb Conndb = new Conndb();
		try {
			JsonObject jsonObj = Conndb.isUser();
			System.out.println(jsonObj);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}
