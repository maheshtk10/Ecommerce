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
<title>Insert title here</title>
</head>
<body>

<%

String msg=request.getParameter("msg");
if("done".equals(msg))
{%>
<h3 class="alert">Your security Question successfully changed !</h3>

<%} %>
<%
			if("wrong".equals(msg))
					{%>
						<h3 class="alert">Your Password is wrong!</h3>
					<%} %>



<form action="securitychangeaction.jsp" method="post">

<h3>Select Your New Securtiy Question</h3>
<select class="input-style" name="securityquestion">
<option value="What was your first car?">What was your first car?</option>
<option value="What is the name of your pet?">What is the name of your pet?</option>
<option value="What elementary school did you attend?">What elementary school did you attend?</option>

<option value="What is the name of the town where you are born?">What is the name of the town where you are born?</option>




</select>
  
 <hr>
 <h3>Enter Your New Answer</h3>
 <input class="input-style" type="text" name="newanswer"  placeholder="Enter Your answer" required="required">
 
 
<hr>
<h3>Enter Password (For Security)</h3>
 <input class="input-style" type="password" name="password"  placeholder="Enter password(for security)" required="required">


<hr>
 <button class="button" type="submit"> save <i class='far fa-arrow-alt-circle-right'></i></button>
 </form>

</body>
<br><br><br>

</body>
</html>