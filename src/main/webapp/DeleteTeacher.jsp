<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="com.Dbconnection.*" %>
<%@ page import="com.Elements.*" %>
<%@ page import="com.Element.Operation.*" %>


<%
		String eno = request.getParameter("teaid");

		TeacherOperation TeaOp = new TeacherOperation();
		
		
		String res = TeaOp.DeleteTea(Integer.parseInt(eno));
		
		if(res.equals("Success"))
			response.sendRedirect("AddTeacher.jsp");
		

%>