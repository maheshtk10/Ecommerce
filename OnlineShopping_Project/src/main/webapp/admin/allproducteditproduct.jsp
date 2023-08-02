<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="com.demo.shop.ConnectionProvider"%>
<%@page import="java.sql.Connection"%>
<%@include file="adminheader.jsp" %>
<%@include file="../footer.jsp" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<style>
h3
{
	color: yellow;
	text-align: center;
}
</style>
<meta charset="ISO-8859-1">
<title>Home</title>
</head>
<body>
<div style="color: white; text-align: center; font-size: 30px;">All Products & Edit Products <i class='fab fa-elementor'></i></div>
<%
	String msg=request.getParameter("msg");
	if("done".equals(msg))
	{%>
	<h3 class="alert">Product Successfully Updated!</h3>
	<%} %>
	<%if("invalid".equals(msg))
	{
		%>
		<h3 class="alert">Some thing went wrong! Try Again!</h3>
	<% }%>


<table>
        <thead>
          <tr>
            <th scope="col">ID</th>
            <th scope="col">Name</th>
            <th scope="col">Category</th>
            <th scope="col"><i class="fa fa-inr"></i> Price</th>
            <th>Status</th>
            <th scope="col">Edit <i class='fas fa-pen-fancy'></i></th>
          </tr>
        </thead>
        <tbody>
       
          <tr>
          <%
          try
          {
          	Connection con=ConnectionProvider.getcon();
          	Statement smt=con.createStatement();
          	ResultSet rs=smt.executeQuery("select * from product");
          	while(rs.next())
          	{
          		  %>
            		<td><%=rs.getString(1) %></td>
            		<td><%=rs.getString(2) %></td>
           			 <td><%=rs.getString(3) %></td>
           			 <td><i class="fa fa-inr"></i><%=rs.getString(4) %> </i></td>
          			  <td><%=rs.getString(5) %></td>
          			  <td><a href="editproduct.jsp?id=<%=rs.getString(1)%>">Edit <i class='fas fa-pen-fancy'></i></a></td>
          		</tr>
          			<%
          }
          
          }
          catch(Exception e)
          {
        	  
          }
           %>
          </tbody>
      </table>
      <br>
      <br>
      <br>


</body>
</html>