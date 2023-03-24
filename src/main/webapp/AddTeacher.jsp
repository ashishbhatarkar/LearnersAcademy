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


<title>Teacher's</title>
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
  background-color: #21C1E8;
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

<form name="frmteacher" method="post" action="TeacherFun.jsp">
<div class="row">
  <div class="column">


<table width="75%" border="1">
	<tr>
		<td>Teacher ID : </td>
		<td><input type="text" name="teaid" required/></td>
	</tr>
	<tr>
		<td>Teacher Name : </td>
		<td><input type="text" name="teaname" required/></td>
	</tr>
	
		<tr>
		<td>Teacher Email : </td>
		<td><input type="email" name="teaemail" required/></td>
	</tr>
	
			<tr>
		<td>Teacher PhoneNo : </td>
		<td><input type="text" name="teaphone" required/></td>
	</tr>
	
	<tr>
		<td><input type="submit" value="Add Teacher" class="button"></td>
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
	<th>Teacher Email</th>
	<th>Teacher Phone</th>
	<th>Operations</th>
	</tr>
	
<%
	TeacherOperation teaop = new TeacherOperation();
	List<Teachers> teainfo = teaop.ShowAllTea();
	
	for(Teachers tea : teainfo)
	{
		%>
		<tr>
		<td><%=tea.getTeaid() %></td>
		<td><%=tea.getTeaname() %></td>
		<td><%=tea.getTeaemail() %></td>
		<td><%=tea.getTeaphone() %></td>
		<td><a href="DeleteTeacher.jsp?teaid=<%=tea.getTeaid() %>" >Delete</a></td>

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