<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<ul>
	<li><a href="index.jsp">Home</a></li>
	<li><a href="resources.jsp">Resources</a></li>
	<li><a href="event.jsp">Events</a></li>
	<li><a href="member.jsp">Members</a></li>
	<%
		if (session.getAttribute("user") == null) {
	%>
	<li><a href="login.jsp">Login</a></li>
	<li><a href="register.jsp">Register</a></li>
	<%
		} else {
	%>
	<li><a href="logout.jsp">Logout</a></li>
	<%
		}
	%>
</ul>