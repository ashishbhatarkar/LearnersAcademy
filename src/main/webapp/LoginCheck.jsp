<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>


<%

	String uname = request.getParameter("Username");
	String pwd = request.getParameter("password");
	
	if(uname.equals("Ashish")&& pwd.equals("Admin"))
	{
		response.sendRedirect("AdminDashboard.jsp");
		
	}
	else
	{
		response.sendRedirect("Welcome.jsp");
		
	}
			
%>