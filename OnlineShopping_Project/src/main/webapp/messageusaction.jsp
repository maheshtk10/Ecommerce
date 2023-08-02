<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@page import="com.demo.shop.ConnectionProvider"%>
        <%@page import="java.sql.Connection"%>
        <%@page import="java.sql.PreparedStatement"%>
        <%@page import="java.sql.ResultSet"%>
        <%@page import="java.sql.Statement"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Message</title>
</head>
<body>
<%
String  email=session.getAttribute("email").toString();
String subject=request.getParameter("subject");
String body=request.getParameter("body");



try {
    Connection con = ConnectionProvider.getcon();
    Statement smt = con.createStatement();
	PreparedStatement stmt=con.prepareStatement("insert into message(email,subject,body) values(?,?,?)");
	stmt.setString(1, email);
	stmt.setString(2, subject);
	stmt.setString(3, body);
	stmt.executeUpdate();
	response.sendRedirect("messageus.jsp?msg=valid");


}
catch(Exception e)
{
	response.sendRedirect("messageus.jsp?msg=invalid");
}





%>

</body>
</html>