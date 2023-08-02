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
	String password=request.getParameter("password");
	
	if("admin@mahesh.com".equals(email)&&"admin".equals(password))
	{
		session.setAttribute("email", email);
		response.sendRedirect("admin/adminhome.jsp");
	}
	else
	{
		int z=0;
		try
		{
			Connection con=ConnectionProvider.getcon();
			Statement smt=con.createStatement();
			ResultSet rs=smt.executeQuery("select*from users where email='"+email+"'&&password='"+password+"'");
			while(rs.next())
			{
				z=1;
				session.setAttribute("email", email);
				response.sendRedirect("home.jsp");
			}
			if(z==0)
			{
				response.sendRedirect("login.jsp?msg=notexist");
			}
		}
		catch(Exception e)
		{
			//System.out.print(e);
			response.sendRedirect("login.jsp?msg=invalid");
		}
	}




%>

</body>
</html>