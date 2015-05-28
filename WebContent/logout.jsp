<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head link href="css/bootstrap.min.css" rel="stylesheet">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" name="viewport" content="width=device-width, initial-scale=1.0">
<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/bootstrap-responsive.min.css" rel="stylesheet">
<title>DiscussAppWeb</title>
</head>
<body>
<%

	if (session.getAttribute("userid") != null) {
		
		session.removeAttribute("userid");//เคลียร์session
	if (request.getCookies() != null) {//เคลียร์Cookie
		Cookie cookies[] = request.getCookies();
	   
	if (cookies != null) {
		for (int i = 0; i < cookies.length; i++) {
			if (cookies[i].getName().equals("ck_user")) {
				cookies[i].setMaxAge(0);
				response.addCookie(cookies[i]);
		break;
			}
		}
	}
	}
   response.sendRedirect("login.jsp");
	}

%>



</body>
</html>