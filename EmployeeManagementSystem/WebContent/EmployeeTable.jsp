<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<%@page import = "java.sql.*"%>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Employee Table</title>
<link rel="stylesheet" href="EMSStyles.css">
<link href='https://fonts.googleapis.com/css?family=Adamina' rel='stylesheet'>
<link rel="icon" href="https://i1.wp.com/www.techjunkie.com/wp-content/uploads/2017/09/letter_a_small.png?ssl=1">
</head>
<body>
<%
try {
	Class.forName("com.mysql.cj.jdbc.Driver");
	Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/jumpdba","root","root");
	Statement st=conn.createStatement();
	ResultSet rs = st.executeQuery("select * from employees");
%>
<table>
<tr>
	<th>Emp ID</th>
	<th>Last Name</th>
	<th>First Name</th>
	<th>Department</th>
	<th>$/Hour</th>
	<th>Date Joined</th>
</tr>
<%
	while(rs.next()) {
		out.println("<tr>");
		for(int i=1;i<7;i++){
			out.println("<td>"+rs.getString(i)+"</td>");
		}
		out.println("</tr>");
	}		
}catch(ClassNotFoundException e) {
	e.printStackTrace();
}catch (SQLException e) {
	e.printStackTrace();
}
%>
</table>
<br>
<a href="Index.jsp" >Back to Home</a><br>
</body>
</html>