<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="com.demo.shop.ConnectionProvider"%>
        <%@page import="java.sql.Connection"%>
           <%@include file="changedetailsheader.jsp" %>
                <%@include file="footer.jsp" %>
                  <%@page import="java.sql.Statement"%>
     <%@page import="java.sql.ResultSet"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="css/changedetails_style.css">
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
<meta charset="ISO-8859-1">
<title>Change Address</title>
</head>
<body>
<%
String msg=request.getParameter("msg");
if("valid".equals(msg))
{%>
<h3 class="alert">Address Successfully Updated !</h3>
<%} %>
<%
			if("invalid".equals(msg))
					{%>
						<h3 class="alert">Some thing Went Wrong! Try Again!</h3>

					<%} %>



<%
try
{
	Connection con=ConnectionProvider.getcon();
	Statement smt=con.createStatement();
	ResultSet  rs=smt.executeQuery("select*from users where email='"+email+"'");
	while(rs.next())
	{

%>


<form action="addresschangeaction.jsp" me>
<h3>Enter Address</h3>
<input class="input-style" type="text" name="address" value="<%=rs.getString(7) %>" placeholder="Enter address" required="required">

 
 <hr>
 <h3>Enter city</h3>
 <input class="input-style" type="text" name="city" value="<%=rs.getString(8) %>" placeholder="Enter city" required="required">
 
 
<hr>
<h3>Enter State</h3>
<input class="input-style" type="text" name="state" value="<%=rs.getString(9) %>" placeholder="Enter state" required="required">


<hr>
<h3>Enter country</h3>
<input class="input-style" type="text" name="country" value="<%=rs.getString(10) %>" placeholder="Enter country" required="required">


<hr>
 <button class="button" type="submit"> save <i class='far fa-arrow-alt-circle-right'></i></button>
 </form>
 <%}
	
}
catch(Exception e)
{
}



%>

</body>
<br><br><br>

</body>
</html>