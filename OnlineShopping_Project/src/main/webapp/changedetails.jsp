<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@include file="changedetailsheader.jsp" %>
     <%@include file="footer.jsp" %>
     <%@page import="com.demo.shop.ConnectionProvider"%>
     <%@page import="java.sql.Statement"%>
     <%@page import="java.sql.ResultSet"%>
     
<%@page import="java.sql.Connection"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="css/changedetails_style.css">
<style>
hr
{width:70%;}</style>
<meta charset="ISO-8859-1">
<title>Change Details</title>
</head>
<body>

<%
try
{
	Connection con=ConnectionProvider.getcon();
	Statement smt=con.createStatement();
	ResultSet  rs=smt.executeQuery("select*from users where email='"+email+"'");
	while(rs.next())
	{




%>
<h3>Name: <%=rs.getString(1) %></h3>
<hr>
 <h3>Email: <%=rs.getString(2) %></h3>
 <hr>
 <h3>Mobile Number: <%=rs.getString(3) %></h3>
 <hr>
<h3>Security Question:<%=rs.getString(4) %> </h3>
<hr>
      <br>
      <br>
      <br>
      <%
}
}
catch(Exception e)
{
	
}
      
      %>

</body>
</html>