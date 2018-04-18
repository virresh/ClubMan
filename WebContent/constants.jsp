<%@ page import ="java.sql.*" %>
<%!
Connection conn = null;
Statement stmt = null;
%>
<%
// Initialise Drivers
Class.forName("com.mysql.jdbc.Driver");

// Connect to Database
System.out.println("Connecting to database");
conn = DriverManager.getConnection("jdbc:mysql://localhost/test","testUser","testPassword");
%>