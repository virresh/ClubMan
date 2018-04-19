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
<title>Events</title>
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
		if (request.getParameter("eid") == null) {
	%>

	<div class="container">
		<h1>All Events @ Our Club !</h1>
		<div class="container">
			<%
				stmt = conn.createStatement();
					String sql = "SELECT EventName, SDate, EDate, EventID FROM Events;";
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
					<td><a href="event.jsp?eid=<%=levents.getString(4)%>"><%=levents.getString(1)%></a></td>
					<td><%=levents.getString(2)%></td>
					<td><%=levents.getString(3)%></td>
				</tr>
				<%
					}
				%>
			</table>
		</div>
	</div>
	<%
		} else {
			String eid = request.getParameter("eid");
			stmt = conn.createStatement();
			String sql = "SELECT EventName, SDate, EDate, EventID FROM Events WHERE EventID=" + eid + ";";
			ResultSet levents2 = stmt.executeQuery(sql);
			String sql2 = "SELECT uname FROM Attended WHERE eid=" + eid + ";";
			System.out.println(sql);
			System.out.println(sql2);
			stmt = conn.createStatement();
			ResultSet lpeople = stmt.executeQuery(sql2);
			String ename = "", sdate = "", edate = "";
			if (levents2.next()) {
				ename = levents2.getString(1);
				sdate = levents2.getString(2);
				edate = levents2.getString(3);
			} else {
				String redirectURL = "event.jsp";
				response.sendRedirect(redirectURL);
			}
	%>
	<div class="container">
		<h3><%=ename%>
			lasted from
			<%=sdate%>
			to
			<%=edate%>
			and attended by
		</h3>
		<table class="table">
			<tr>
				<td>Handles:</td>
			</tr>
			<%
				while (lpeople.next()) {
			%>
			<tr>
				<td><a href="member.jsp?uname=<%=lpeople.getString(1)%>"><%=lpeople.getString(1)%></a></td>
			</tr>
			<%
				}
			%>
		</table>
		<%
			}
		%>

	</div>
</body>
</html>