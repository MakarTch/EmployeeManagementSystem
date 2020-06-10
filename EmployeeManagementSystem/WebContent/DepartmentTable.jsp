<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<%@page import = "java.sql.*"%>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Department Table</title>
<link rel="stylesheet" href="EMSStyles.css">
</head>
<body>
<%
try {
	Class.forName("com.mysql.cj.jdbc.Driver");
	Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/jumpdba","root","root");
	Statement st=conn.createStatement();
	ResultSet rs = st.executeQuery("select * from department_info");
%>
<table>
<tr>
	<th>Department Name</th>
	<th>Department Description</th>
	<th>Current Projects</th>
</tr>
<% 
	while(rs.next()) {
		out.println("<tr>");
		for(int i=1;i<4;i++){
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
<a href="Index.jsp">Back to Home</a><br>
</body>
</html>