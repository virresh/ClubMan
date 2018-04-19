<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="constants.*"%>
<%!Connection conn = null;
	Statement stmt = null;%>
<%
	Class.forName(ClubConstants.DRIVER);
	System.out.println("Connecting to database");
	conn = DriverManager.getConnection(ClubConstants.DB_URL, ClubConstants.USER, ClubConstants.PASS);
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Club Home Page</title>
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
		<h1>Welcome to the Club Page !</h1>
		<div class="container">
			<h3>Latest Event:</h3>
			<%
				stmt = conn.createStatement();
				String sql = "SELECT EventName, SDate, EDate, EventID FROM Events WHERE EventID in (SELECT MAX(EventID) FROM Events);";
				System.out.println(sql);
				ResultSet levents = stmt.executeQuery(sql);
			%>
			<table class="table">
				<tr>
					<td>Event Name</td>
					<td>Start Date</td>
					<td>End Date</td>
				</tr>
				<%
					while (levents.next()) {
				%>
				<tr>
					<td><%=levents.getString(1)%></td>
					<td><%=levents.getString(2)%></td>
					<td><%=levents.getString(3)%></td>
				</tr>
				<%
					}
				%>
			</table>
		</div>
		<div class="container">
			<h3>Latest Resource:</h3>
			<%
				stmt = conn.createStatement();
				String sql2 = "SELECT RName, Link, PostedBy, ResID FROM Resources WHERE ResID in (SELECT MAX(ResID) FROM Resources);";
				System.out.println(sql2);
				ResultSet lres = stmt.executeQuery(sql2);
			%>
			<table class="table">
				<tr>
					<td>Name</td>
					<td>Link</td>
					<td>Poster</td>
				</tr>
				<%
					while (lres.next()) {
				%>
				<tr>
					<td><%=lres.getString(1)%></td>
					<td><a href="<%=lres.getString(2)%>"><%=lres.getString(2)%></a></td>
					<td><%=lres.getString(3)%></td>
				</tr>
				<%
					}
				%>
			</table>
		</div>
		<div class="container">
			<h3>Latest Achievements:</h3>
			<%
				stmt = conn.createStatement();
				String sql3 = "SELECT Descr, Aid FROM Achievement WHERE Aid in (SELECT MAX(Aid) FROM Achievement);";
				System.out.println(sql3);
				ResultSet lac = stmt.executeQuery(sql3);
			%>
			<table class="table">
				<tr>
					<td>Achievement !!!</td>
				</tr>
				<%
					while (lac.next()) {
				%>
				<tr>
					<td><%=lac.getString(1)%></td>
				</tr>
				<%
					}
				%>
			</table>
		</div>
		
	</div>
</body>
</html>