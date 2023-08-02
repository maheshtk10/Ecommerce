<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="com.demo.shop.ConnectionProvider"%>
<%@page import="java.sql.Connection"%>
<%@include file="header.jsp" %>
    <%@include file="footer.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Home</title>
</head>
<body>
<div style="color: white; text-align: center; font-size: 30px;">Home <i class="fa fa-institution"></i></div>
<table>
        <thead>
          <tr>
            <th scope="col">ID</th>
            <th scope="col">Name</th>
            <th scope="col">Category</th>
            <th scope="col"><i class="fa fa-inr"></i> Price</th>
            <th scope="col">Add to cart <i class='fas fa-cart-plus'></i></th>
          </tr>
        </thead>
        <tbody>
         <%
         int z=0;
        try
        {
        	String search=request.getParameter("search");
        	
        
        	Connection con=ConnectionProvider.getcon();
        	Statement smt=con.createStatement();
        	ResultSet rs=smt.executeQuery("select*from product where name like '%"+search+"%' or category like '%"+search+"%'  and active='yes'");
        	while(rs.next())
        	{
        		z=1;
        	
        		%>

          <tr>
                <td><%=rs.getString(1) %></td>
                <td><%=rs.getString(2) %></td>
                <td><%=rs.getString(3) %></td>
                <td><i class="fa fa-inr"></i><%=rs.getString(4) %></td>
                <td><a href="addtocartaction.jsp?id=<%=rs.getString(1) %>">Add to cart <i class='fas fa-cart-plus'></i></a></td>
              </tr>
                      <% }
        	
        	
        }
        catch(Exception e)
        {
        	
        }
        
        
    %>
     
        </tbody>
        
      </table>
      <%if(z==0)
      { %>
      	
	<h1 style="color:white; text-align: center;">Nothing to show</h1>
	<%} %>
      <br>
      <br>
      <br>
      <div class="footer">
          <p>All right reserved</p>
      </div>


</body>
</html>