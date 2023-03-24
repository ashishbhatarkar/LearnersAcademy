<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="com.Dbconnection.*" %>
<%@ page import="com.Elements.*" %>
<%@ page import="com.Element.Operation.*" %>
<%@ page import="java.util.*" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Subject's</title>

<style>

* {
  box-sizing: border-box;
}

.button {
  background-color: #4CAF50;
  border: none;
  color: white;
  padding: 15px 32px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  font-size: 16px;
  margin: 4px 2px;
  cursor: pointer;
}

.row {
  margin-left:-5px;
  margin-right:-5px;
}
  
.column {
  float: left;
  width: 50%;
  padding: 5px;
}

/* Clearfix (clear floats) */
.row::after {
  content: "";
  clear: both;
  display: table;
}

table {
  border-collapse: collapse;
  border-spacing: 0;
  width: 100%;
  border: 1px solid #ddd;
}

th, td {
  text-align: left;
  padding: 16px;
}

tr:nth-child(even) {
  background-color: #f2f2f2;
}
</style>
<jsp:include page="Links.jsp"/>
</head>
<body>

<form name="frmsub" method="post" action="SubFun.jsp">

<div class="row">
  <div class="column">
<table width="75%" border="1">


	<tr>
		<td>Subject ID : </td>
		<td><input type="text" name="subid" required/></td>
	</tr>
	<tr>
		<td>Subject name : </td>
		<td><input type="text" name="subname" required/></td>
	</tr>
	
	
	<tr>
		<td><input type="submit" value="Add Subject" class="button"></td>
		<td><input type="reset" value="Clear" class="button"/></td>
	</tr>
	<tr>
	<td colspan="2">
	
	<%
	if(session.getAttribute("info")!=null)
	{
		String str = (String)session.getAttribute("info");
		%>
		<p> <%=str %></p>
		<% 
		
	}
	%>
	</td>
	</tr>

</table>
  </div>
   <div class="column">
   <table width="75%" border="1">

	<tr>
	<th>Subject ID</th>
	<th>Subject Name</th>
	<th>Operations</th>

	</tr>
	
<%
	SubOperation subop = new SubOperation();
	List<Subjects> subinfo = subop.ShowAllSub();
	
	for(Subjects sub : subinfo)
	{
		%>
		<tr>
		<td><%=sub.getSubid()%></td>
		<td><%=sub.getSubname()%></td>
		<td><a href="DeleteSubject.jsp?subid=<%=sub.getSubid() %>"  >Delete</a></td>
	
	

		</tr>
		
		<%
		
		
		
	}



%>
</form>
</body>
</html>