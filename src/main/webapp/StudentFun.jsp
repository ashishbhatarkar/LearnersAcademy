<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="com.Dbconnection.*" %>
<%@ page import="com.Elements.*" %>
<%@ page import="com.Element.Operation.*" %>

<%
	String stdroll = request.getParameter("stdroll");
	String stdname = request.getParameter("stdname");
	String stdclsid = request.getParameter("sclass");
	
	Student std = new Student();
	
	std.setStdroll(Integer.parseInt(stdroll));
	std.setStdname(stdname);
	std.setStdclsid(Integer.parseInt(stdclsid));

	

	
	StudentOperation StdOp = new StudentOperation();
	
	String str = StdOp.Addstd(std);
	
	if(str.equals("Success"))
	{
		session.setAttribute("info", "Student Added Successfully......");
		response.sendRedirect("AddStudent.jsp");
	}
	
	else
	{
		session.setAttribute("info", "Student Not Added");
		response.sendRedirect("AddStudent.jsp");
	}
	
	%>
	
