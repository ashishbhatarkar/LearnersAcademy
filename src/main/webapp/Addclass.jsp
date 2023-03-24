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
<title>ADD CLASS</title>

<style>
* {
  box-sizing: border-box;
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
</style>

<jsp:include page="Links.jsp"/>
</head>
<body>

<form name="frmcls" method="post" action="ClassFun.jsp">
<div class="row">
  <div class="column">
<table width="75%" border="1">
	<tr>
		<td>Class Id : </td>
		<td><input type="text" name="clsid" required/></td>
	</tr>
	<tr>
		<td>Class Name : </td>
		<td><input type="text" name="clsname" required/></td>
	</tr>
	
	<tr>
		<td><input type="submit" value="Add Class" class="button"></td>
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
	<th>Class ID</th>
	<th>Class Name</th>
	<th>Operations</th>
	</tr>
<%
 	ClassOperation clsop = new ClassOperation();
	List<Classes> clsinfo = clsop.ShowAllcls();
	
	for(Classes cls : clsinfo)
	{
		%>
		<tr>
		<td><%=cls.getClassid() %></td>
		<td><%=cls.getClassname() %></td>
		<td><a href="DeleteClass.jsp?classid=<%=cls.getClassid() %>"  >Delete</a></td>
		</tr>
		
		<%
	}


%>
  </table>
  </div>
</div>
  
</form>

</body>
</html>