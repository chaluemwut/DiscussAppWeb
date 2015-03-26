package com.rmuti.db;
import java.sql.*;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;

public class Conndb {
	Connection Conn;
	Statement Stmt;
	 
	public Statement getConn() {
	try {//ดักจับข้อผิดพลาดจากการเรียกไดร์เวอร์
	Class.forName("com.mysql.jdbc.Driver");//เรียกDriver MySQL
	try {//ดักจับข้อผิดพลาดจากการเชื่อมต่อกับฐานข้อมูล
	Conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/andoird","root","pong084391"); //เชื่อมต่อกับฐานข้อมูล
	Stmt = Conn.createStatement();//สร้างอ๊อบเจ็ค "สเตทเมนท์" เพื่อสามารถเรียกใช้คำสั่งจัดการฐานข้อมูล
	} catch (SQLException ex) {//หากเชื่อมต่อมีปัญหา
	Logger.getLogger(Conndb.class.getName()).log(Level.SEVERE, null, ex);
	}
	} catch (ClassNotFoundException ex) {//หากมีข้อผิดพลาดจากการเรียกไดร์เวอร์
	Logger.getLogger(Conndb.class.getName()).log(Level.SEVERE, null, ex);
	}
	return Stmt;
	}
	 
	public void closeConn() {//เมธอด ยกเลิกการเชื่อมต่อฐานข้อมูล
	try {
	Conn.close();
	} catch (SQLException ex) {
	Logger.getLogger(Conndb.class.getName()).log(Level.SEVERE, null, ex);
	}
	}
	}	


