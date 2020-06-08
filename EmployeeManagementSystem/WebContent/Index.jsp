<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<%@page import = "java.sql.*"%>
<html>
<head>
<meta charset="ISO-8859-1">
<title>EMS Home</title>
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
<body >
<h2>Welcome to the home page of the EMS!</h2>
<a href="EmployeeTable.jsp" > Show Full Employee Table</a><br>
<a href="DepartmentTable.jsp"> Show Full Department Table</a>
<h3>What would you like to work with?</h3>
<section style="margin-left: 30px">
<p>Work with Employees</p>
<ul>
	<li><a href="CreateEmployeeInfo.jsp?actionChoice=CreateEmployee">Create an Employee</a> </li>
	<li><a href="ChooseEmployee.jsp?actionChoice=ListEmployee" >List Employee Information</a> </li>
	<li><a href="ChooseEmployee.jsp?actionChoice=DeleteEmployee">Delete an Employee</a> </li>
	<li><a href="ChooseEmployee.jsp?actionChoice=UpdateEmployee" >Update Employee Information</a> </li><!-- When doing this do a fill in thing with the og values already in the text -->
</ul>
<p>Work with Departments</p>
<ul>
	<li><a href="CreateDepartmentInfo.jsp">Create a Department</a> </li>
	<li><a href ="ChooseDepartment.jsp?actionChoice=ListDepartment">List Department Information</a> </li>
	<li><a href ="ChooseDepartment.jsp?actionChoice=DeleteDepartment" >Delete a Department</a> </li>
	<li><a href ="ChooseDepartment.jsp?actionChoice=UpdateDepartment" >Update Department Information</a> </li>	
</ul>
</section>

</body>
</html>