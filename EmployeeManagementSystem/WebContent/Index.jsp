<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<%@page import = "java.sql.*"%>
<html>
<head>
<meta charset="ISO-8859-1">
<title>EMS Home</title>
<link rel="stylesheet" href="EMSStyles.css">
</head>
<body>
<h2>Welcome to the home page of the EMS!</h2>
<div>
<a href="EmployeeTable.jsp" > Show Full Employee Table</a><br>
<a href="DepartmentTable.jsp"> Show Full Department Table</a>
</div>
<section>
<h2>What would you like to work with?</h2>
<div>
<p>Work with Employees</p>
<ul class= "a">
	<li><a href="CreateEmployeeInfo.jsp?actionChoice=CreateEmployee">Create an Employee</a> </li>
	<li><a href="ChooseEmployee.jsp?actionChoice=ListEmployee" >List Employee Information</a> </li>
	<li><a href="ChooseEmployee.jsp?actionChoice=DeleteEmployee">Delete an Employee</a> </li>
	<li><a href="ChooseEmployee.jsp?actionChoice=UpdateEmployee" >Update Employee Information</a> </li><!-- When doing this do a fill in thing with the og values already in the text -->
</ul>
<p>Work with Departments</p>
<ul class="a">
	<li><a href="CreateDepartmentInfo.jsp">Create a Department</a> </li>
	<li><a href ="ChooseDepartment.jsp?actionChoice=ListDepartment">List Department Information</a> </li>
	<li><a href ="ChooseDepartment.jsp?actionChoice=DeleteDepartment" >Delete a Department</a> </li>
	<li><a href ="ChooseDepartment.jsp?actionChoice=UpdateDepartment" >Update Department Information</a> </li>	
</ul>
</div>
</section>
</body>
</html>