<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@page import="com.demo.shop.ConnectionProvider"%>
        <%@page import="java.sql.Connection"%>
        <%@page import="java.sql.Statement"%>
        <%@page import="java.sql.ResultSet"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
String  email=session.getAttribute("email").toString();
String oldpassword=request.getParameter("oldpassword");
String newpassword=request.getParameter("newpassword");
String confirmpassword=request.getParameter("confirmpassword");

if (!confirmpassword.equals(newpassword)) {
    response.sendRedirect("changepassword.jsp?msg=notmatch");
} else {
    int check = 0;
    try {
        Connection con = ConnectionProvider.getcon();
        Statement smt = con.createStatement();
        ResultSet rs = smt.executeQuery("SELECT * FROM users WHERE email='" + email + "' AND password='" + oldpassword + "'");
        if (rs.next()) {
            check = 1;
            smt.executeUpdate("UPDATE users SET password='" + newpassword + "' WHERE email='" + email + "'");
            response.sendRedirect("changepassword.jsp?msg=done");
        } else {
            response.sendRedirect("changepassword.jsp?msg=wrong");
        }
    } catch (Exception e) {
        // Proper exception handling should be done here, e.g., logging or displaying an error message.
    }
}

%>

</body>
</html>