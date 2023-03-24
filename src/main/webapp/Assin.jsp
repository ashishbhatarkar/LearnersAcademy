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
<title>Assign</title>


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


<jsp:include page="Sublink.jsp"/>
</head>
<body>

<form name="frmass" method="post" action="AssignFun.jsp">
<div class="row">
  <div class="column">
<table width="75%" border="1">
	<tr>
		<td>Teacher ID : </td>
		<td><input type="text" name="teaid" required/></td>
	</tr>
		<tr>
		<td>Class ID : </td>
		<td><input type="text" name="classid" required/></td>
	</tr>
	
	<tr>
		<td>Subject ID : </td>
		<td><input type="text" name="subid" required/></td>
	</tr>
	
	<tr>
		<td><input type="submit" value="Assign" class="button"></td>
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
	<th>Teacher ID</th>
	<th>Teacher Name</th>
	<th>Class ID</th>
	<th>Operations</th>
	</tr>
	
<%
	AssignOperation assop = new AssignOperation();
	List<Assign> assinfo = assop.ShowAllAssign();

	
	
	
	for(Assign ass : assinfo)
	{
		%>
		<tr>
		<td><%=ass.getTeaid() %></td>
		<td><%=ass.getClassid() %></td>
		<td><%=ass.getSubid() %></td>
		<td><a href="DeleteAssignTeacher.jsp?teaid=<%=ass.getTeaid() %>"  >Delete</a></td>
		
		<%
	}

%>
</table>
  </div>
</div>
</form>

</body>
</html>