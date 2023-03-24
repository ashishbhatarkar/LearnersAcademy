<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="com.Dbconnection.*" %>
<%@ page import="com.Elements.*" %>
<%@ page import="com.Element.Operation.*" %>


<%
		String eno = request.getParameter("subid");

		SubOperation SubOp = new SubOperation();
		
		
		String res = SubOp.DeleteSub(Integer.parseInt(eno));
		
		if(res.equals("Success"))
			response.sendRedirect("AddSub.jsp");
		

%>