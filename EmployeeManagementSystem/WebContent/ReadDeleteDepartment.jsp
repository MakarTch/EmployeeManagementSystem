<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<%@page import = "java.sql.*"%>
<html>
<head>
<meta charset="ISO-8859-1">
<% 
String actionChoice = (String)session.getAttribute("actionChoice");
String department = request.getParameter("nameChoice");
%>
<title><% out.println(actionChoice);%></title>
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
if (actionChoice.equals("ListDepartment")){
										//List Employee	DONE make it look pretty, its a wack looking table now
	try {
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/jumpdba","root","root");
		Statement st=conn.createStatement();
		ResultSet rs = st.executeQuery("select * from department_info where department ='" + department + "';");
		out.println("<table border =\"1\">");
%>
<tr>
	<th>Department Name</th>
	<th>Department Description</th>
	<th>Current Projects</th>
</tr>
<% 		
		while(rs.next()) {
			for(int i=1;i<4;i++){
				out.println("<td>"+rs.getString(i)+"</td>");
			}
		}		
		out.println("</table>");
	}catch(ClassNotFoundException e) {
		e.printStackTrace();
	}catch (SQLException e) {
		e.printStackTrace();			//add table that shows all employees in the given department
}
										
	try {
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/jumpdba","root","root");
		Statement st=conn.createStatement();
		ResultSet rs = st.executeQuery("select * from employees where department ='" + department + "';");
		out.println("<table border =\"1\">");
%>
<br>
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

<%
}else if (actionChoice.equals("DeleteDepartment")){
											//Delete Employee	 DONE- I just wanna put in a message or something
String query = "delete from employees where department ='" + department + "' ;";
 try {
 	String connectionURL = "jdbc:mysql://host/db";
 	Class.forName("com.mysql.cj.jdbc.Driver");
 	Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/jumpdba", "root", "root");
 	Statement st = connection.createStatement();
 	int rs = st.executeUpdate(query);
 	if (rs==1){
 		out.println("<h3>Employees of department have been successfully deleted</h3>");
 	}
 	query = "delete from department_info where department ='" + department + "' ;";
 	rs = st.executeUpdate(query);
 	if (rs==1){
 		out.println("<h3>Department has been successfully deleted</h3>");
 	}
 } catch (ClassNotFoundException e) {
 	e.printStackTrace();
 } catch (SQLException e) {
 	e.printStackTrace();
 }
%>


<%
}else{
	out.println("You found something wrong with my program!");
}
%>
<a href="Index.jsp">Back to Home</a><br>
<a href="DepartmentTable.jsp">Employee Table</a>
</body>
</html>