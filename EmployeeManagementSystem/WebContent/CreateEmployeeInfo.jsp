<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<%@page import = "java.sql.*"%>
<html>
<head>
<meta charset="ISO-8859-1">
<title>CreateEmployee</title>
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
<h3>Please input new employee information:</h3>
<%
String actionChoice = request.getParameter("actionChoice");//pretty sure i dont need to seot any attributes for this fo rcreatingdelete these later
session.setAttribute("actionChoice", actionChoice);

											//Here user inputs all information needed to create an employee, then goes to CEmployee
%>
<form action="CreateEmployee.jsp">
	<label for ="lastName">Last name:</label>
	<input type="text" name="lastName" id = "lastName" maxlength="20" required><br>
	<label for ="firstName">First name:</label>
	<input type="text" name="firstName" id = "firstName" maxlength="20" required><br>
	<label for ="department">Department:</label>

	
	<select id = "department" name="department" >
		<%
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/jumpdba","root","root");
			Statement st=conn.createStatement();
			//ResultSet rs = st.executeQuery("select * from employees");
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
	<input type="submit" value="Create Employee!">
</form>
</body>
</html>