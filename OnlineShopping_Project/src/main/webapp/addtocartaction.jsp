<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="com.demo.shop.ConnectionProvider"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@include file="header.jsp" %>
    <%@include file="footer.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
	String  emailid=session.getAttribute("email").toString();
	String product_id=request.getParameter("id");
	int quantity=1;
	int product_price=0;
	int product_total=0;
	int cart_total=0;
	
	int z=0;
	try
	{
		Connection con=ConnectionProvider.getcon();
		Statement smt=con.createStatement();
		ResultSet  rs=smt.executeQuery("select*from product where id='"+product_id+"'");
		while(rs.next())
		{
			product_price=rs.getInt(4);
			product_total=product_price;
		}
		ResultSet rs1=smt.executeQuery("select*from cart where product_id='"+product_id+"' and email='"+emailid+"'and address is NULL");
		while(rs1.next())
		{
			cart_total=rs1.getInt(5);
			cart_total=cart_total+product_total;
			quantity=rs1.getInt(3);
			quantity=quantity+1;
			z=1;
		}
		if(z==1)
		{
			smt.executeUpdate("update cart set total='"+cart_total+"',quantity='"+quantity+"' where product_id='"+product_id+"'and email='"+emailid+"'and address is NULL");
			response.sendRedirect("home.jsp?msg=exist");
		}
		if(z==0)
		{
			
			PreparedStatement stmt=con.prepareStatement("insert into cart(email,product_id,quantity,price,total) values(?,?,?,?,?)");
			stmt.setString(1, emailid);
			stmt.setString(2, product_id);
			stmt.setInt(3, quantity);
			stmt.setInt(4, product_price);
			stmt.setInt(5, product_total);
			stmt.executeUpdate();
			response.sendRedirect("home.jsp?msg=added");
		}
	}
	catch(Exception e)
	{
		
	}



%>


</body>
</html>