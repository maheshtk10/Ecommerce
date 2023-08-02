<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="com.demo.shop.ConnectionProvider"%>
<%@page import="java.sql.Connection"%>
 <%@include file="header.jsp" %>
    <%@include file="footer.jsp" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="css/messageus_style.css">
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
<meta charset="ISO-8859-1">
<title>Message</title>
</head>
<body>
<div style="color: white; text-align: center; font-size: 30px;">Message Us <i class='fas fa-comment-alt'></i></div>
<%

String msg=request.getParameter("msg");
if("valid".equals(msg))
{%>
<h3 style="text-align:center; color:yellow;">Message successfully sent. Our team will contact you soon!</h3>
<%} %>
<%

if("invalid".equals(msg))
{%>
<h3 style="text-align:center; ">Some thing Went Wrong! Try Again!</h3>
<%} %>

<form action="messageusaction.jsp" method="post">
 <input class="input-style" type="text" name="subject" placeholder="subject" required="required">
 <hr>
 <textarea class="input-style" type="text" name="body" placeholder="Enter your message" required="required" ></textarea>
 <hr>
 <button class="button" type="submit"> send <i class='far fa-arrow-alt-circle-right'></i></button>
 </form>









<br><br><br>

</body>
</html>