<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="com.demo.shop.ConnectionProvider"%>
<%@page import="java.sql.Connection"%>
<%@include file="adminheader.jsp" %>
<%@include file="../footer.jsp" %>
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
<div style="color: white; text-align: center; font-size: 30px;">Messages Received <i class='fas fa-comment-alt'></i></div>
<table>
        <thead>
          <tr>
            <th scope="col">ID</th>
            <th scope="col">Email</th>
            <th scope="col">Subject</th>
            <th scope="col">Body</th>
          </tr>
        </thead>
        <tbody>
        
        <%
        try
        {
        	Connection con=ConnectionProvider.getcon();
    		Statement smt=con.createStatement();
    		ResultSet  rs=smt.executeQuery("select*from message");
    		while(rs.next())
    		{
    			
         
        %>
       
          <tr>
            <td><%=rs.getString(1) %></td>
            <td><%=rs.getString(2) %></td>
            <td><%=rs.getString(3) %></td>
            <td><%=rs.getString(4) %></td>
          </tr>
          <%}
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