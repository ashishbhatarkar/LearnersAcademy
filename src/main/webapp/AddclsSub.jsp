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
<title>Assign Subject Class</title>
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
  padding: 10px 25px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  font-size: 16px;
  margin: 4px 2px;
  cursor: pointer;
}

</style>


<jsp:include page="Sublink.jsp"/>
</head>
<body>
<form name="frmass" method="post" action="AssignclsSubFun.jsp">
<div class="row">
  <div class="column">
<table width="75%" border="1">

	<tr>
		<td>Class ID : </td>
		<td><input type="text" name="clsid" required/></td>
	</tr>
	
	<tr>
		<td>Subject ID : </td>
		<td><input type="text" name="subid" required/></td>
	</tr>
	
	<tr>
		<td><input type="submit" value="Assign Sub" class="button"></td>
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
	<th>SubjectID</th>
	<th>Operations</th>
	</tr>
	
<%
	AssignOperation assop = new AssignOperation();
	List<Assign> assinfo = assop.ShowAllAssignClsSub();
	
	for(Assign ass : assinfo)
	{
		%>
		<tr>
	
		<td><%=ass.getClassid() %></td>
		<td><%=ass.getSubid() %></td>
		<td><a href="DeleteAssignSubCls.jsp?clsid=<%=ass.getClassid() %>"  >Delete</a></td>
		
		<%
	}

%>
</table>
  </div>
</div>
</form>

</body>
</html>