<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<%@page import = "java.sql.*"%>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Creating Employee</title>
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
String lastName = request.getParameter("lastName");// maybe print out a table with the entries and highlight the new entry you put in
String firstName= request.getParameter("firstName");
String department= request.getParameter("department");
float hourlyWage= Float.parseFloat(request.getParameter("hourlyWage"));
String date=request.getParameter("date");
String query = "insert into employees (last_name,first_name,department,hourly_wage,date_started) values ('"+lastName+"', '"+firstName+"','"+department+"',"+hourlyWage+" , '"+date+"');";
//out.println(query);
 try {
 	String connectionURL = "jdbc:mysql://host/db";
 	Class.forName("com.mysql.cj.jdbc.Driver");
 	Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/jumpdba", "root", "root");
 	Statement st = connection.createStatement();
 	
 	int rs = st.executeUpdate(query);
 	if(rs==1){
 	 	out.println("<h2> Record created for " + firstName + " " + lastName + ".</h2>");
 	}
 } catch (ClassNotFoundException e) {
 	e.printStackTrace();
 } catch (SQLException e) {
 	e.printStackTrace();
 }
//out.println(session.getAttribute("choice"));

%>
<a href="Index.jsp">Back to Home</a><br>
<a href="EmployeeTable.jsp">Employee Table</a>
</body>
</html>