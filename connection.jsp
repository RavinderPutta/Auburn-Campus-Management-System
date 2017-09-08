<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Untitled Document</title>
</head>

<body>

<%
try{
	Class.forName("com.mysql.jdbc.Driver").newInstance(); 
Connection con;
ResultSet rs;
con = DriverManager.getConnection("jdbc:mysql://localhost:8080/stud","root","root");
}
catch(Exception e){
	System.out.println("Error in Connection " + e);
}
%>

</body>
</html>