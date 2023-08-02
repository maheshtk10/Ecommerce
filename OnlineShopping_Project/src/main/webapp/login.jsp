<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="css/signup_style.css">
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<div id="container">

	<div class="signup">
	
		<form action="loginaction.jsp" method="post">
		
		<input type="email" name="email" placeholder="Enter Email" required="required">
		<input type="password" name="password" placeholder="Enter password" required="required">
		<input type="submit" value="Login">
	
		</form>
		<h2><a href="signup.jsp">SignUp</a></h2>
		<h2><a href="forgotpassword.jsp">Forgot Password</a></h2>
	
	
	</div>
	
	<div class="whysignlogin">
	
	<%
	String msg=request.getParameter("msg");
	if("notexist".equals(msg))
	{%>
	<h1>Incorrect username or password</h1>
	<%} %>
	<%if("invalid".equals(msg))
	{
		%>
		<h1>Something went wrong try again!</h1>
	<% }%>
	<h2>Online Shopping</h2>
	<p>The Online Shopping is the application that allows the users to shop online without going to the shops to buy them.</p>
	
	

	</div>


</div>

</body>
</html>