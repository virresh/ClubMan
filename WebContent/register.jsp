<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	if (session.getAttribute("user") != null) {
		String redirectURL = "login.jsp";
		response.sendRedirect(redirectURL);
	}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Register for Club</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="style.css">
</head>
<body>
	<%@include file="navbar.jsp"%>
	<%
		if (request.getParameter("regemail") == null) {
	%>
	<div class="container">
		<h2>Member Registration form</h2>
		<form action="register.jsp" method="post">
			<div class="form-group">
				<label for="regname">Full Name:</label> <input type="text"
					class="form-control" id="regname" placeholder="Enter Full Name"
					name="regname">
			</div>
			<div class="form-group">
				<label for="reguname">User Name:</label> <input type="text"
					class="form-control" id="reguname"
					placeholder="Enter Github Handle" name="reguname">
			</div>
			<div class="form-group">
				<label for="regemail">Email:</label> <input type="email"
					class="form-control" id="regemail" placeholder="Enter email"
					name="regemail">
			</div>
			<div class="form-group">
				<label for="regpwd">Password:</label> <input type="password"
					class="form-control" id="regpwd" placeholder="Enter password"
					name="regpwd">
			</div>
			<button type="submit" class="btn btn-default">Submit</button>
		</form>
	</div>
	<%
		} else {
	%>
	<%@ page import="java.sql.*"%>
	<%@ page import="constants.*"%>
	<%!
	Connection conn = null;
	Statement stmt = null;%>
	<%
		// Initialise Drivers
			Class.forName(ClubConstants.DRIVER);

			// Connect to Database
			System.out.println("Connecting to database");
			conn = DriverManager.getConnection(ClubConstants.DB_URL, ClubConstants.USER, ClubConstants.PASS);

			if (request.getParameter("regname") != null && request.getParameter("reguname") != null
					&& request.getParameter("regpwd") != null && request.getParameter("regemail") != null) {
				String n = request.getParameter("regname");
				String u = request.getParameter("reguname");
				String p = request.getParameter("regpwd");
				String e = request.getParameter("regemail");
				String r = "member";
				stmt = conn.createStatement();
				//Execute query
				String sql = "INSERT INTO Members " + "VALUES (" + "'" + u + "'," + "'" + n + "'," + "'" + p + "',"
						+ "'" + e + "'," + "'" + r + "'" + ");";
				System.out.println(sql);
				int err = 0;
				try {
					stmt.executeUpdate(sql);
				} catch (Exception ex) {
					ex.printStackTrace();
					err = 1;
				}
				if (err == 0) {
	%>
	<p>Registration Succeeded !</p>
	<%
		} else {
	%>
	<p>Invalid or Illegal Values !</p>
	<%
		}
			} else {
	%>
	<p>Incomplete Form !</p>
	<%
		}
			if (conn != null) {
				conn.close();
			}
		}
	%>
</body>
</html>