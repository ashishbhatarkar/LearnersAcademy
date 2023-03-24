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
  width: 100%;
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

<form name="frmcls" method="post" action="ClassFun.jsp">
<div class="row">

    <div class="column">
  <table width="100%" border="1">
  
  	<tr>
	<th>Student RollNumber</th>
	<th>Student Name</th>
	<th>Student Classname</th>
	<th>Student Subject</th>
	<th>Student Assign Teacher</th>
	
	</tr>
<%
	AssignOperation AssOp = new AssignOperation();
	List<ClassReport> clsrp = AssOp.ClsReport();
	
	for(ClassReport clsRT : clsrp)
	{
		%>
		<tr>
		<td><%=clsRT.getStdroll() %></td>
		<td><%=clsRT.getStdname() %></td>
		<td><%=clsRT.getClassname() %></td>
		<td><%=clsRT.getSubname() %></td>
		<td><%=clsRT.getTeaname() %></td>
		
	
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