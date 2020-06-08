<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<%@page import = "java.sql.*"%>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Update Employee</title>
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
					//Here we are displaying the information of the employee currently

int empID = Integer.parseInt(request.getParameter("nameChoice"));
session.setAttribute("nameChoice", empID);
try {
	Class.forName("com.mysql.cj.jdbc.Driver");
	Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/jumpdba","root","root");
	Statement st=conn.createStatement();
	ResultSet rs = st.executeQuery("select * from employees where emp_id =" + empID + ";");
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
		for(int i=1;i<7;i++){
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
<p>Listed above is the current information for the employee you selected.</p>
<p>Input updated information below. </p>
<form action="UpdateEmployee.jsp">
	<label for ="lastName">Last name:</label>
	<input type="text" name="lastName" id = "lastName" maxlength="20" required><br>
	<label for ="firstName">First name:</label>
	<input type="text" name="firstName" id = "firstName" maxlength="20" required><br>
	<label for ="department">Department:</label>

	
	<select id = "department" name="department" >
		<%
		//This create a dropdown menu for the departments
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/jumpdba","root","root");
			Statement st=conn.createStatement();
			ResultSet rs = st.executeQuery("select * from department_info;");
			while(rs.next()) {
				out.println("<option required value=\"" + rs.getString(1) + "\">" + rs.getString(1) + "  </option>");
			}		
		}catch(ClassNotFoundException e) {
			e.printStackTrace();
		}catch (SQLException e) {
			e.printStackTrace();
		}
		%>
	</select><br>
 	<label for ="hourlyWage">Hourly wage:</label> 
	<input type="number" min="0" step = "0.01" name="hourlyWage" id = "hourlyWage" required><br>
	<label for ="">Date Started:</label>
	<input type="date" id="date" name="date" required><br><!-- Make default date today -->
	<input type="submit" value="Update Employee!">
</form>
</body>
</html>