<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
      <%@page import="com.demo.shop.ConnectionProvider"%>
        <%@page import="java.sql.Connection"%>
           <%@include file="changedetailsheader.jsp" %>
                <%@include file="footer.jsp" %>
                  <%@page import="java.sql.Statement"%>
     <%@page import="java.sql.ResultSet"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="css/changedetails_style.css">
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
<meta charset="ISO-8859-1">
<title>Chnage Mobile Number</title>
</head>
<body>


<%
String msg=request.getParameter("msg");
if("done".equals(msg))
{%>
<h3 class="alert">Your Mobile Number successfully changed!</h3>
<%} %>

<%
if("wrong".equals(msg))
{%>
<h3 class="alert">Your Password is wrong!</h3>
<%} %>


<form action="mobilenumberaction.jsp" method="post">

 <h3>Enter Your New Mobile Number</h3>
 <input class="input-style" type="text" name="mobilenumber" placeholder="Enter Your New Mobile Number" required="required">
 
 
 <hr>
<h3>Enter Password (For Security)</h3>
 <input class="input-style" type="password" name="password" placeholder="Enter password(for security)" required="required">


<hr>
 <button class="button" type="submit"> save <i class='far fa-arrow-alt-circle-right'></i></button>
<br><br><br>
</form>


</body>

</html>