<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="com.demo.shop.ConnectionProvider"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
	String email=request.getParameter("email");
	String mobilenumber=request.getParameter("mobilenumber");
	String securityQuestion=request.getParameter("securityQuestion");
	String answer=request.getParameter("answer");
	String newpassword=request.getParameter("newpassword");
	int  check=0;
	
	try
	{
		Connection con=ConnectionProvider.getcon();
		Statement smt=con.createStatement();
		ResultSet rs=smt.executeQuery("select*from users where email='"+email+"' and mobilenumber='"+mobilenumber+"' and securityQuestion='"+securityQuestion+"' and answer='"+answer+"'");
		while(rs.next())
		{
			check=1;
			smt.executeUpdate("update users set password='"+newpassword+"'where email='"+email+"'");
			response.sendRedirect("forgotpassword.jsp?msg=done");
			
		}
		if(check==0)
		{
			response.sendRedirect("forgotpassword.jsp?msg=invalid");
		}
	}
		catch(Exception e)
		{
			//System.out.println(e);
		}
	






%>

</body>
</html>