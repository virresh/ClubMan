<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Resources</title>
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
	<div class="container">
		<h3>Club Resources :</h3>
		<%
			stmt = conn.createStatement();
			//Execute query
			String sql = "SELECT RName, Link, PostedBy FROM Resources;";
			ResultSet rs = stmt.executeQuery(sql);
		%>
		<table class="table">
			<tr>
				<td>Resource Name</td>
				<td>Link</td>
				<td>Posted By</td>
			</tr>
			<%
				while (rs.next()) {
			%>
			<tr>
				<td><%=rs.getString(1)%></td>
				<td><a href="<%=rs.getString(2)%>"><%=rs.getString(2)%></a></td>
				<td><%=rs.getString(3)%></td>
			</tr>
			<%
				}
			%>
		</table>
		<%
			if (session.getAttribute("user") != null) {
		%>
		<h3>Want to add your resource ?</h3>
		<form class="form-inline" method="post" action="resources.jsp">
			<div class="form-group">
				<label for="resname">Resource Name</label> 
				<input type="text" class="form-control" id="resname" name="rname">
			</div>
			<div class="form-group">
				<label for="reslink">Link to Resource:</label> 
				<input type="text" class="form-control" id="reslink" name="rlink">
			</div>
			<button type="submit" class="btn btn-default">Submit</button>
		</form>
		<%
			} else {
		%>
		<h2>Login to add your resource !!!</h2>
		<%
			}
		%>
		
		
		<%
			System.out.println("here");
			if (session.getAttribute("user") != null && request.getParameter("rname") != null
					&& request.getParameter("rlink") != null) {
				String u = session.getAttribute("user").toString();
				String n = request.getParameter("rname");
				String l = request.getParameter("rlink");

				stmt = conn.createStatement();
				String sqlS = "INSERT INTO Resources VALUES (null, '" + n + "','" + l + "','" + u + "');";
				System.out.println(sqlS);
				int err = 0;
				try {
					stmt.executeUpdate(sqlS);
				} catch (Exception ex) {
					err = 1;
				}
				if (err == 0) {
		%>
		<p>
			Thank you
			<%=u%>
			for your contribution !<br>
			Refresh to see.
		</p>
		<%
			} else {
		%>
		<p>Failed Insertion !</p>
		<%
			}
			}
		%>

	</div>
</body>
</html>
<%
	if (conn != null) {
		conn.close();
	}
%>