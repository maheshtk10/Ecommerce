<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="com.demo.shop.ConnectionProvider"%>
    <%@page import="java.sql.Connection"%>
    <%@page import="java.sql.Statement"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
String email = session.getAttribute("email").toString();
String product_id = request.getParameter("id");
try
{
    Connection con = ConnectionProvider.getcon();
    Statement smt = con.createStatement();
    smt.executeUpdate("delete from cart where email='"+email+"' and product_id='"+product_id+"'and address is NULL");
    response.sendRedirect("mycart.jsp?msg=removed");

}
catch(Exception e)
{
	
}


%>

</body>
</html>