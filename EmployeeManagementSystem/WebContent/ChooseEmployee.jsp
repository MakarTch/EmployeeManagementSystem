<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<%@page import = "java.sql.*"%>
<html>
<head>
<meta charset="ISO-8859-1">
<title>ChooseEmployee</title>
</head>
<body>
<h3> Select which employee you would like to work with:</h3>
<%
							//Making a list of all entries in our mysql table. User inputs what employee to work with. 
							//If updating, go to UpdateEmployee jsp, if deleting or reading, go straight to RUDEmployee
							
String actionChoice = request.getParameter("actionChoice");
session.setAttribute("actionChoice", actionChoice);
 try {
 	String connectionURL = "jdbc:mysql://host/db";
 	Class.forName("com.mysql.cj.jdbc.Driver");
 	Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/jumpdba", "root", "root");
 	Statement st = connection.createStatement();
 	ResultSet rs = st.executeQuery("select * from employees");//Maybe make this sort alphabetically in the future?
 	if (actionChoice.equals("UpdateEmployee")){
 	 	out.println("<form action=\"UpdateEmployeeInfo.jsp\">");
 	}else{
 	out.println("<form action=\"ReadDeleteEmployee.jsp\">");
 	}
 	while (rs.next()) {
 		out.println("<input type=\"radio\" name=\"nameChoice\" value = \"" + rs.getString(1) + "\"required>" + rs.getString(3)+ " " + rs.getString(2) + "<br>");
 	}
 	out.println("<input type=\"submit\" value=\"Go!\">");
 	out.println("</form>");
 } catch (ClassNotFoundException e) {
 	e.printStackTrace();
 } catch (SQLException e) {
 	e.printStackTrace();
 }
 %>
</body>
</html>