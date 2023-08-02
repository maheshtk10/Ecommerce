<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="com.demo.shop.ConnectionProvider"%>
<%@page import="java.sql.Connection"%>
<%@include file="adminheader.jsp" %>
<%@include file="../footer.jsp" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="../css/ordersreceived_style.css">
<style>
.th-style
{ width: 25%;}
</style>
<meta charset="ISO-8859-1">
<title>Home</title>
</head>
<body>
<div style="color: white; text-align: center; font-size: 30px;">Orders Received <i class="fas fa-archive"></i></div>

<%
String msg=request.getParameter("msg");
if("cancel".equals(msg))
{%>

<h3 class="alert">Order Cancel Successfully!</h3>
<%} %>

<%
if("delivered".equals(msg))
{%>

<h3 class="alert">Successfully Updated!</h3>
<%} %>

<%
if("wrong".equals(msg))
{%>

<h3 class="alert">Some thing went wrong! Try Again!</h3>
<%} %>



<table id="customers">
          <tr>
          <th>Mobile Number</th>
            <th scope="col">Product Name</th>
            <th scope="col">Quantity</th>
            <th scope="col"><i class="fa fa-inr"></i> Sub Total</th>
            <th>Address</th>
            <th>City</th>
            <th>State</th>
            <th>Country</th>
            <th scope="col">Order Date</th>
             <th scope="col">Expected Delivery Date</th>
             <th scope="col">Payment Method</th>
              <th scope="col">T-ID</th>
              <th scope="col">Status</th>
              <th scope="col">Cancel order <i class='fas fa-window-close'></i></th>
              <th scope="col">Order Delivered <i class='fas fa-dolly'></i></i></th>
          </tr>
          <%
         
          try
          {
        	  Connection con=ConnectionProvider.getcon();
      		Statement smt=con.createStatement();
        	ResultSet rs=smt.executeQuery("select*from cart inner join product where cart.product_id=product.id  and cart.orderdate is not NULL and cart.status='processing'");
      		while(rs.next())
      		{
      			
      		
      		
        	  
          
          
          
          
          
          %>
        
       
          <tr>
          <td><%=rs.getString(10) %></td>
            <td><%=rs.getString(17) %></td>
            <td><%=rs.getString(3) %></td>
            <td><i class="fa fa-inr"></i> <%=rs.getString(5) %> </td>
                <td><%=rs.getString(6) %></td>
               <td><%=rs.getString(7) %></td>
                <td><%=rs.getString(8) %></td>
                 <td><%=rs.getString(9) %></td>
             <td><%=rs.getString(11) %></td>
              <td><%=rs.getString(12) %></td>
               <td><%=rs.getString(13) %></td>
               <td><%=rs.getString(14) %></td>
               <td><%=rs.getString(15) %></td>
               <td><a href="cancelorderaction.jsp?id=<%=rs.getString(2) %>&email=<%=rs.getString(1) %>">Cancel <i class='fas fa-window-close'></i></a></td>
                <td><a href="deliveryaction.jsp?id=<%=rs.getString(2) %>&email=<%=rs.getString(1) %>">Delivered <i class='fas fa-dolly'></i></i></a></td>
            </tr>
            <%}
          }
          catch(Exception e)
          {
        	  
          }
            
            
            %>
         
        </table>
      <br>
      <br>
      <br>

</body>
</html>