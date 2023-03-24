<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="com.Dbconnection.*" %>
<%@ page import="com.Elements.*" %>
<%@ page import="com.Element.Operation.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Learner's Academy</title>
 <link rel="stylesheet" href="./Style.css">
</head>
<body>


<div id="bg"></div>

<form style="text-align:center;" action="LoginCheck.jsp" method="post">
	<h1>Lerner's Academy</h1>
      <br>
        <h1 >Admin Login</h1>
    
        <div class="form-field" > 
            <input type="text" name="Username" placeholder="Username"/>
         </div>
         
       <div class="form-field" >
  
            <input type="password" name="password" placeholder="Password"/>
        </div>
        <div class="form-field">
            <input type="submit" name="Login" value="Submit" class="btn" />
            <input type="reset" name="Reset" value="Reset" class="btn"/>
        </div>
        



</form>
</body>
</html>


