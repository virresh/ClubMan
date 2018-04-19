<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ="java.sql.*" %>
<%@ page import ="constants.*" %>
<%!
Connection conn = null;
Statement stmt = null;
%>
<%
	// Initialise Drivers
Class.forName(ClubConstants.DRIVER);

// Connect to Database
System.out.println("Connecting to database");
conn = DriverManager.getConnection(ClubConstants.DB_URL,ClubConstants.USER,ClubConstants.PASS);
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>YolO</title>
</head>
<body>
<h2>Hello JSP !!!</h2>
<% 
stmt = conn.createStatement();
//Execute query
String sql = "SELECT Username, Email, Priviledge FROM Members";
ResultSet rs = stmt.executeQuery(sql);
%>
<table>
	<tr>
		<td>Github Username</td>
		<td>Email</td>
		<td>Status</td>
	</tr>
<% while(rs.next()){  %>
	<tr>
		<td><%=rs.getString(1) %></td>
		<td><%=rs.getString(2) %></td>
		<td><%=rs.getString(3) %></td>
	</tr>
<%}%>
</table>
</body>
</html>
<%
if(conn != null)
{
	conn.close();
}
%>