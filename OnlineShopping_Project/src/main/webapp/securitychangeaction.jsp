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
<title>Insert title here</title>
</head>
<body>
<%
	String  email=session.getAttribute("email").toString();
	String securityquestion=request.getParameter("securityquestion");
	String newanswer=request.getParameter("newanswer");
	String password=request.getParameter("password");
	int check=0;
	  try {
	        Connection con = ConnectionProvider.getcon();
	        Statement smt = con.createStatement();
	        ResultSet rs = smt.executeQuery("SELECT * FROM users WHERE email='" + email + "' AND password='" + password + "'");
	        while(rs.next())
	        {
	        	check=1;
	        	 smt.executeUpdate("UPDATE users SET securityquestion='" + securityquestion + "',answer='" + newanswer + "'WHERE email='" + email + "'");
	             response.sendRedirect("changesecurityquestion.jsp?msg=done");

	        }
	        if(check==0)
	             response.sendRedirect("changesecurityquestion.jsp?msg=wrong");

	        	
	  }
	        catch(Exception e)
	        {
	        	
	        }


%>

</body>
</html>