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

	<%	String id=request.getParameter("id");
		String name=request.getParameter("name");
		String category=request.getParameter("category");
		String price=request.getParameter("price");
		String active=request.getParameter("active");
		
		
		
		try
		{
			Connection con=ConnectionProvider.getcon();
			PreparedStatement smt=con.prepareStatement("insert into product values(?,?,?,?,?)");
			smt.setString(1, id);
			smt.setString(2, name);
			smt.setString(3, category);
			smt.setString(4, price);
			smt.setString(5, active);
			
			smt.executeUpdate();
			
			
			response.sendRedirect("addnewproduct.jsp?msg=done");
			
		}
		catch(Exception e)
		{
			
			
			response.sendRedirect("addnewproduct.jsp?msg=wrong");
		}

%>


</body>
</html>