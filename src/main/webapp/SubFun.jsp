<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="com.Dbconnection.*" %>
<%@ page import="com.Elements.*" %>
<%@ page import="com.Element.Operation.*" %>


<%
	String subid = request.getParameter("subid");
	String subname = request.getParameter("subname");
	
	
	Subjects subss = new Subjects();
	
	subss.setSubid(Integer.parseInt(subid));
	subss.setSubname(subname);

	
	SubOperation Subo = new SubOperation();
	
	String str = Subo.Addsub(subss);
	
	if(str.equals("Success"))
	{
		session.setAttribute("info", "Subject Added Successfully......");
		response.sendRedirect("AddSub.jsp");
	}
	else
	{
		session.setAttribute("info", "Subject Not Added");
		response.sendRedirect("AddSub.jsp");
	}

%>
