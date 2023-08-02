<%@page import="java.sql.PreparedStatement"%>
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

	<%	String name=request.getParameter("name");
		String email=request.getParameter("email");
		String mobilenumber=request.getParameter("mobilenumber");
		String securityQuestion=request.getParameter("securityQuestion");
		String answer=request.getParameter("answer");
		String password=request.getParameter("password");
		String address="";
		String city="";
		String state="";
		String country="";
		
		try
		{
			Connection con=ConnectionProvider.getcon();
			PreparedStatement smt=con.prepareStatement("insert into users values(?,?,?,?,?,?,?,?,?,?)");
			smt.setString(1, name);
			smt.setString(2, email);
			smt.setString(3, mobilenumber);
			smt.setString(4, securityQuestion);
			smt.setString(5, answer);
			smt.setString(6, password);
			smt.setString(7, address);
			smt.setString(8, city);
			smt.setString(9, state);
			smt.setString(10, country);
			smt.executeUpdate();
			
			
			response.sendRedirect("signup.jsp?msg=valid");
			
		}
		catch(Exception e)
		{
			
			
			response.sendRedirect("signup.jsp?msg=invalid");
		}

%>

</body>
</html>