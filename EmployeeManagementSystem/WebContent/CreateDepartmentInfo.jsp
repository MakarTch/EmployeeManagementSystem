<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>New Department Information</title>
<style>
input, select{
margin:5px 0;
}
input:focus{
  background-color: rgb(213, 245, 213);
}
</style>
</head>
<body>
<h3>Please input the new department name:</h3>
<form action="CreateDepartment.jsp">
	<label for="department">New Department:</label>
	<input type="text" name="department" maxlength="29" required><br>
	<label for="deptDescription" >Department Description:</label><br>
	<input type="text" name="deptDescription" size="100px" maxlength="49" required><br>
	<label for="currentProjects">Current Projects:</label><br>
	<input type="text" name="currentProjects" size ="100px" maxlength="49" required><br>
	<input type="submit" value="Go!">
</form>
</body>
</html>