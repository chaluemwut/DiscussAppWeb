package com.rmuti.android;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.rmuti.db.Conndb;

/**
 * Servlet implementation class UpdateTopComment
 */
@WebServlet("/UpdateTopComment")
public class UpdateTopComment extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public UpdateTopComment() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		Conndb conndb = new Conndb();
		HttpSession session = request.getSession();
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		String topicId = request.getParameter("topic_id");
		String status = request.getParameter("status");
		Connection con = null;
		Statement stmt = null;
		System.out.println("Top Comment");
		System.out.println(topicId);
		System.out.println(status);
		System.out.println("==========");
		try {
			Class.forName("org.gjt.mm.mysql.Driver").newInstance();
			con = DriverManager.getConnection(
					"jdbc:mysql://localhost:3306/andoird", "root", "pong084391");
			stmt = con.createStatement();

			
			if (status.equals("1")) {
				int top = 1;
				String sql = "UPDATE post " + "SET top_id = '" + top + "' "
						+ " WHERE topic_id = '" + topicId + "' ";

				stmt.execute(sql);

				out.println("������º�������� 1");
			}
			else if (status.equals("0")) {
				int top = 0;
				String sql = "UPDATE post " + "SET top_id = '" + top + "' "
						+ " WHERE topic_id = '" + topicId + "' ";

				stmt.execute(sql);

				out.println("������º�������� 0");
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			out.println(e.getMessage());
			e.printStackTrace();
		}

		try {
			if (stmt != null) {
				stmt.close();
				con.close();
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			out.println(e.getMessage());
			e.printStackTrace();
		}
	}

}
