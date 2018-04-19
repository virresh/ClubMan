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
<title>Member Page</title>
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
		if (request.getParameter("uname") == null) {
	%>

	<div class="container">
		<h1>All Members @ Our Club !</h1>
		<div class="container">
			<%
				stmt = conn.createStatement();
					String sql = "SELECT Username, Name, Email, Priviledge FROM Members;";
					System.out.println(sql);
					ResultSet lppl = stmt.executeQuery(sql);
			%>
			<table class="table">
				<tr>
					<td>Handle</td>
					<td>Name</td>
					<td>Email</td>
					<td>Role</td>
				</tr>
				<%
					while (lppl.next()) {
				%>
				<tr>
					<td><a href="member.jsp?uname=<%=lppl.getString(1)%>"><%=lppl.getString(1)%></a></td>
					<td><%=lppl.getString(2)%></td>
					<td><%=lppl.getString(3)%></td>
					<td><%=lppl.getString(4)%></td>
				</tr>
				<%
					}
				%>
			</table>
		</div>
	</div>
	<%
		} else {
			String un = request.getParameter("uname");
			stmt = conn.createStatement();
			String sql = "SELECT Username, Name, Email, Priviledge FROM Members WHERE Username='" + un + "';";
			ResultSet levents2 = stmt.executeQuery(sql);
			String sql2 = "SELECT EventID, EventName from Events,Attended WHERE EventID=eid AND uname='" + un + "'";
			
			System.out.println(sql);
			System.out.println(sql2);
			stmt = conn.createStatement();
			ResultSet lpeople = stmt.executeQuery(sql2);
			String Name = "", Email = "", Role = "";
			if (levents2.next()) {
				Name = levents2.getString(2);
				Email = levents2.getString(3);
				Role = levents2.getString(4);
			} else {
				String redirectURL = "member.jsp";
				response.sendRedirect(redirectURL);
			}
	%>
	<div class="container">
		<h3>
			Profile Page of
			<%=Role%>
			<%=Name%>
		</h3>
		<p>
			Contact:
			<%=Email%>, Handle: <%=un %></p>
		<table class="table">
			<tr>
				<td>Event Attended</td>
			</tr>
			<%
				while (lpeople.next()) {
			%>
			<tr>
				<td><a href="event.jsp?eid<%=lpeople.getString(1)%>"><%=lpeople.getString(2)%></a></td>
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