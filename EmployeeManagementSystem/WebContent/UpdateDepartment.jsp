<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<%@page import = "java.sql.*"%>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Updating Department</title>
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
						//Update Department	 DONE just wanna put some message to say thats its done, maybe print out a table and highlight the entry that was edited
String department = request.getParameter("department");
String deptDescription= request.getParameter("deptDescription");
String currentProjects= request.getParameter("currentProjects");
String departmentChoice= (String)session.getAttribute("nameChoice");

	try {
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/jumpdba","root","root");
		Statement st=conn.createStatement();
		String query = "update department_info set department= '" + department + "',dept_description= '" + deptDescription + "',current_projects= '" 
						+ currentProjects  + "' where department = '" + departmentChoice + "';";
		int rs = st.executeUpdate(query);	
		if(rs==1){
			out.println("<h2>Department has been succesfully updated</h2>");
		}else{
			//Not sure this code is reachable, how can I make an error message?
			out.println("<h2>Department has not been successfully updated, please start again from home.</h2>");
		}
	}catch(ClassNotFoundException e) {
		e.printStackTrace();
	}catch (SQLException e) {
		e.printStackTrace();
	}

%>
<a href="Index.jsp">Back to Home</a><br>
<a href="DepartmentTable.jsp">Department Table</a>
</body>
</html>