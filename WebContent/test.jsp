<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@ include file="constants.jsp" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>Hello JSP !!!</h2>
<% 
stmt = conn.createStatement();
//Execute query
String sql = "SELECT * FROM Products";
ResultSet rs = stmt.executeQuery(sql);
%>
<table>
	<tr>
		<td>PId</td>
		<td>Name</td>
		<td>Price</td>
		<td>Stock</td>
		<td>Sponsored</td>
	</tr>
<% while(rs.next()){  %>
	<tr>
		<td><%=rs.getInt(1) %></td>
		<td><%=rs.getString(2) %></td>
		<td><%=rs.getInt(3) %></td>
		<td><%=rs.getInt(4) %></td>
		<td><%=rs.getInt(5) %></td>
	</tr>
<%}%>
</table>
</body>
</html>