<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
        <%@page import="com.demo.shop.ConnectionProvider"%>
        <%@page import="java.sql.Connection"%>
           <%@include file="changedetailsheader.jsp" %>
                <%@include file="footer.jsp" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="css/changedetails_style.css">
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
<meta charset="ISO-8859-1">
<title>Change Password</title>
</head>
<body>
<%


String msg=request.getParameter("msg");
if("notmatch".equals(msg))
{%>
<h3 class="alert">New password and Confirm password does not match!</h3>
<%} %>
	<%
			if("wrong".equals(msg))
					{%>
						<h3 class="alert">Your old Password is wrong!</h3>

					<%} %>
					<%
					if("done".equals(msg))
					{%>
						<h3 class="alert">Password change successfully!</h3>
					<%} %>
					<%
					if("invalid".equals(msg))
					{%>
						<h3 class="alert">Some thing went wrong! Try again!</h3>
					<%} %>
					
					<form action="changepasswordaction.jsp" method="post">






<h3>Enter Old Password</h3>
<input class="input-style" type="password" name="old password" placeholder="Enter old password" required="required">
 
  <hr>
 <h3>Enter New Password</h3>
 <input class="input-style" type="password" name="new password" placeholder="Enter new password" required="required">
 
 
 <hr>
<h3>Enter Confirm Password</h3>
<input class="input-style" type="password" name="confirm password" placeholder="confirm password" required="required">


<hr>
<button class="button" type="submit">Save<i class='far fa-arrow-alt-circle-right'></i></button>
 </form>

</body>
<br><br><br>

</body>
</html>