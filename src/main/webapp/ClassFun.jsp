<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="com.Dbconnection.*" %>
<%@ page import="com.Elements.*" %>
<%@ page import="com.Element.Operation.*" %>

<%

	String clsid = request.getParameter("clsid");
	String clsname = request.getParameter("clsname");
	
	Classes cls = new Classes();
	
	cls.setClassid(Integer.parseInt(clsid));
	cls.setClassname(clsname);
	
	ClassOperation Cops = new ClassOperation();
	
	String str = Cops.Addcls(cls);
	
	if(str.equals("Success"))
	{
		session.setAttribute("info", "Class Added Successfully......");
		response.sendRedirect("Addclass.jsp");
	}
	
	else
	{
		session.setAttribute("info", "Class Not Added");
		response.sendRedirect("Addclass.jsp");
	}

	
	
%>