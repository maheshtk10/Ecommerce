<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
         <%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="com.demo.shop.ConnectionProvider"%>
<%@page import="java.sql.Connection"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
String id=request.getParameter("id");
String email=request.getParameter("email");
String status="delivered";
try
{
	Connection con=ConnectionProvider.getcon();
	Statement smt=con.createStatement();
	smt.executeUpdate("update cart set status='"+status+"' where product_id='"+id+"'and email='"+email+"'and address is not NULL");
	response.sendRedirect("ordersrecieved.jsp?msg=delivered");

}
catch(Exception e)
{
	response.sendRedirect("ordersrecieved.jsp?msg=wrong");

}




%>

</body>
</html>