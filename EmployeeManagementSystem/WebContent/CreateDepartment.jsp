<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<%@page import = "java.sql.*"%>

<html>
<head>
<meta charset="ISO-8859-1">
<title>Create Department</title>
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
}
</style>
</head>
<body>
<%
String department= request.getParameter("department");
String deptDescription=request.getParameter("deptDescription");
String currentProjects=request.getParameter("currentProjects");
String query = ("insert into department_info values('" + department + "','" + deptDescription + "','" + currentProjects + "');");
try {
	Class.forName("com.mysql.cj.jdbc.Driver");
	Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/jumpdba","root","root");
	Statement st=conn.createStatement();
	int rs = st.executeUpdate(query);
	if (rs==1){
		out.println("<h2>"+department+" department has successfully been created!</h2>");
	}
}catch(ClassNotFoundException e) {
	e.printStackTrace();
}catch (SQLException e) {
	e.printStackTrace();
}
%>
<a href="Index.jsp">Back to Home</a><br>
</body>
</html>