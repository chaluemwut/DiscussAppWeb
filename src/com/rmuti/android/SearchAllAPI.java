package com.rmuti.android;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.json.JsonObject;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.rmuti.db.Conndb;

/**
 * Servlet implementation class SearchAllAPI
 */
@WebServlet("/SearchAllAPI")
public class SearchAllAPI extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SearchAllAPI() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
try {
			
			JsonObject jsonRet = null;
			Conndb conndb = new Conndb();	
			HttpSession session = request.getSession();
		    request.setCharacterEncoding("UTF-8");
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			
			
			String txt = request.getParameter("txt");
		
			JsonObject jsonObj = conndb.SearchAllAPI(txt);
			
			out.print(jsonObj);
			System.out.println(txt);
			
			conndb.closeConn();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			
			
		}
	}
	}


