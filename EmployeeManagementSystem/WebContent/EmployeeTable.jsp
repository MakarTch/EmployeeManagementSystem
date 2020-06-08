<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<%@page import = "java.sql.*"%>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Employee Table</title>
<style>
a:link{
	color:rgb(0,153,77);
}
a:visited{
	color:rgb(0,153,77);
}
a:hover{
	color:rgb(0,255,128);
}
a:active{
	color:rgb(0,0,0);
}</style>
</head>
<body>
<%
try {
	Class.forName("com.mysql.cj.jdbc.Driver");
	Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/jumpdba","root","root");
	Statement st=conn.createStatement();
	ResultSet rs = st.executeQuery("select * from employees");
	out.println("<table border =\"1\">");
%>
<tr>
	<th>Employee ID</th>
	<th>Last Name</th>
	<th>First Name</th>
	<th>Department</th>
	<th>Hourly Wage ($)</th>
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
	out.println("</table>");
}catch(ClassNotFoundException e) {
	e.printStackTrace();
}catch (SQLException e) {
	e.printStackTrace();
}
%>
<br>
<a href="Index.jsp">Back to Home</a><br>
</body>
</html>