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

	<div class='signup'>
		<form action="forgotpasswordaction.jsp" method="post">
			<input type="text" name="name" placeholder="Enter Name" required="required">
			<input type="email" name="email" placeholder="Enter Email" required="required">
			<input type="text" name="mobilenumber" placeholder="Enter Mobile Number" required="required">
		
			<select name="securityQuestion">
		
				<option value="What was your first car?">What was your first car?</option>
				<option value="What is the name of your pet?">What is the name of your pet?</option>
				<option value="What elementary school did you attend?">What elementary school did you attend?</option>
				<option value="What is the name of the town where you are born?">What is the name of the town where you are born?</option>
		
			</select>
	
			<input type="text" name="answer" placeholder="Enter Answer" required="required">
			<input type="password" name="newpassword" placeholder="Enter your Password to set" required="required">
			<input type="submit" value="save">
	
		</form>
	
			<h2 ><a href="login.jsp">Login</a></h2>

	</div>
	
		<div class="whyforgotpassword">
			<%
				String msg=request.getParameter("msg");
			
				if("done".equals(msg))
					{%>
						<h1>password changed successfully!</h1>
					<%} %>
	
			<%
			if("invalid".equals(msg))
					{%>
						<h1>something went wrong! try again</h1>
					<%} %>
						<h2>Online Shopping</h2>
						<p>The Online Shopping is the application that allows the users to shop online without going to the shops to buy them.</p>
	
		</div>


</div>

</body>
</html>