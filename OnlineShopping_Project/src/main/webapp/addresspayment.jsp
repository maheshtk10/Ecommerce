<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
        <%@include file="footer.jsp" %>
        <%@page import="com.demo.shop.ConnectionProvider"%>
        <%@page import="java.sql.Connection"%>
        <%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="css/addresspaymentfororder_style.css">
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
<meta charset="ISO-8859-1">
<title>Home</title>
<script type="text/javascript"> 
if(window.history.forward(1)!=null)
	window.history.forward(1)
</script>
</head>
<body>
<br>
<table>
<thead>
<%

String email=session.getAttribute("email").toString();
int total=0;
int sno=0;
try
{
	Connection con=ConnectionProvider.getcon();
	Statement smt=con.createStatement();
	ResultSet rs1=smt.executeQuery("select sum(total)from cart where  email='"+email+"' and address is NULL");
	while(rs1.next())
	{
		total=rs1.getInt(1);
		
	}




%>

          <tr>
          <th scope="col"><a href="mycart.jsp"><i class='fas fa-arrow-circle-left'> Back</i></a></th>
            <th scope="col" style="background-color: yellow;">Total: <i class="fa fa-inr"></i><%out.println(total); %> </th>
          </tr>
        </thead>
        <thead>
          <tr>
          <th scope="col">S.No</th>
            <th scope="col">Product Name</th>
            <th scope="col">Category</th>
            <th scope="col"><i class="fa fa-inr"></i> price</th>
            <th scope="col">Quantity</th>
            <th scope="col">Sub Total</th>
          </tr>
        </thead>
        <tbody>
        <%
        ResultSet rs=smt.executeQuery("select*from product inner join cart on product.id=cart.product_id and cart.email='"+email+"' and cart.address is NULL");
        while(rs.next())
        {%>
        
          <tr>
          <% sno=sno+1; %>
           <td><%out.println(sno); %></td>
            <td><%=rs.getString(2) %></td>
            <td><%=rs.getString(3) %></td>
            <td><i class="fa fa-inr"></i><%=rs.getString(4) %> </td>
            <td> <%=rs.getString(8) %> </td>
            <td><i class="fa fa-inr"></i> <%=rs.getString(10)%></td>
            </tr>
         <%}
        ResultSet rs2=smt.executeQuery("select * from users  where email='"+email+"'");
        while(rs2.next())
        {
        %>
        </tbody>
      </table>
      
<hr style="width: 100%">
<form action="addresspaymentaction.jsp" method="post">

 <div class="left-div">
 <h3>Enter Address</h3>
 <input class="input-style" type="text" name="address" value="<%=rs2.getString(7)%>" placeholder="Enter your Address" required="required">

 </div>

<div class="right-div">
<h3>Enter city</h3>
<input class="input-style" type="text" name="city" value="<%=rs2.getString(8)%>" placeholder="Enter your city" required="required">


</div> 

<div class="left-div">
<h3>Enter State</h3>
<input class="input-style" type="text" name="state" value="<%=rs2.getString(9)%>" placeholder="Enter your State" required="required">


</div>

<div class="right-div">
<h3>Enter country</h3>
<input class="input-style" type="text" name="country" value="<%=rs2.getString(10)%>" placeholder="Enter your Country" required="required">


</div>
<h3 style="color: red">*If there is no address its mean that you did not set you address!</h3>
<h3 style="color: red">*This address will also updated to your profile</h3>
<hr style="width: 100%">
<div class="left-div">
<h3>Select way of Payment</h3>
<select class="input-style" name="paymentmethod">
<option value="cash on delivery">cash on delivery</option>
<option value="online payment">online payment</option>


</select>
 
</div>

<div class="right-div">
<h3>Pay online on this link</h3>
<input class="input-style" type="text" name="transactionid"  placeholder="Enter Transaction id" >


<h3 style="color: red">*If you select online Payment then enter you transaction ID here otherwise leave this blank</h3>
</div>
<hr style="width: 100%">

<div class="left-div">
<h3>Mobile Number</h3>
<input class="input-style" type="text" name="mobilenumber" value="<%=rs2.getString(3)%>" placeholder="Enter Mobile Number" required="required">


<h3 style="color: red">*This mobile number will also updated to your profile</h3>
</div>
<div class="right-div">
<h3 style="color: red">*If you enter wrong transaction id then your order will we can cancel!</h3>
<button class="button" value="submit">proceed to generate bill&save  <i class='far fa-arrow-alt-circle-right'></i></button>
<h3 style="color: red">*Fill form correctly</h3>
</div>
</form>
<%
        }   
}
catch(Exception e)
{
	
}

%>


      <br>
      <br>
      <br>


</body>
</html>