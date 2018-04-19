<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="style.css">
<title>Login</title>
</head>
<body>
	<%@ page import="java.sql.*"%>
	<%@ page import="constants.*"%>
	<%!Connection conn = null;
	Statement stmt = null;%>
	<%
		// Initialise Drivers
		Class.forName(ClubConstants.DRIVER);

		// Connect to Database
		System.out.println("Connecting to database");
		conn = DriverManager.getConnection(ClubConstants.DB_URL, ClubConstants.USER, ClubConstants.PASS);
	%>
	<%
		if (request.getParameter("username") != null) {
			String u = request.getParameter("username");
			String p = request.getParameter("pwd");
			stmt = conn.createStatement();
			//Execute query
			String sql = "SELECT Username, Priviledge FROM Members WHERE Username='"+u+"' AND Password='"+p+"'";
			System.out.println(sql);
			ResultSet rs = stmt.executeQuery(sql);
			if(rs.next())
			{
				String priviledge = rs.getString(2);
				session.setAttribute("user", u);
				session.setAttribute("role", priviledge);
			}
		}
	%>
	<%@include file="navbar.jsp" %>
	<%
		if (session.getAttribute("user") != null && session.getAttribute("role")!= null) {
	%>
	<h2>
		Welcome
		<%=session.getAttribute("role")%>, 
		<%=session.getAttribute("user")%>
	</h2>
	<%
		} else {
	%>
	<div class="container">
		<h2>Club Login</h2>
		<form action="login.jsp" method="post">
			<div class="form-group">
				<label for="email">Username:</label> <input type="username"
					class="form-control" id="username" placeholder="Enter username"
					name="username">
			</div>
			<div class="form-group">
				<label for="pwd">Password:</label> <input type="password"
					class="form-control" id="pwd" placeholder="Enter password"
					name="pwd">
			</div>
			<button type="submit" class="btn btn-default">Submit</button>
		</form>
	</div>
	<%
		}
	%>
</body>
</html>

<%
	if (conn != null) {
		conn.close();
	}
%>