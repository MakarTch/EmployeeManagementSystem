<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<%@page import = "java.sql.*"%>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Update Department</title>
<style>
input, select{
margin:5px 0;
}
input:focus, select:focus {
  background-color: rgb(213, 245, 213);
}
</style>
</head>
<body>
<% 
					//Here we are displaying the information of the department currently

String department = request.getParameter("nameChoice");
session.setAttribute("nameChoice", department);
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
	e.printStackTrace();
}
%>
<p>Listed above is the current information for the department you selected.</p>
<p>Input updated information below. </p>
<form action="UpdateDepartment.jsp">
	<label for="department">Department Name:</label>
	<input type="text" name="department" maxlength="29" required><br>
	<label for="deptDescription" >Department Description:</label><br>
	<input type="text" name="deptDescription" size="100px" maxlength="49" required><br>
	<label for="currentProjects">Current Projects:</label><br>
	<input type="text" name="currentProjects" size ="100px" maxlength="49" required><br>
	<input type="submit" value="Update Department!">
</form>
</body>
</html>