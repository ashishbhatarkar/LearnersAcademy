<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="com.Dbconnection.*" %>
<%@ page import="com.Elements.*" %>
<%@ page import="com.Element.Operation.*" %>


<%
		String eno = request.getParameter("stdroll");

		StudentOperation StdOp = new StudentOperation();
		
		
		String res = StdOp.Deletestd(Integer.parseInt(eno));
		
		if(res.equals("Success"))
			response.sendRedirect("AddStudent.jsp");
		

%>