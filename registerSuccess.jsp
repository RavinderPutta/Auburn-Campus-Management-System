<%@ page import="java.io.*" %>
<%@ page import = "java.sql.*"%>
<HTML>
<HEAD>
<TITLE>Registration Form</TITLE>
</HEAD>
<BODY>

<%
String k=(String)request.getHeader("referer");
if(k.contains("studentregistration.jsp"))
{
	try
	{
		String fname=request.getParameter("regfname");
	String lname=request.getParameter("reglname"); 
	String email=request.getParameter("regemail");	
	String username=request.getParameter("regusername"); 
	session.putValue("username",username); 
	String pwd=request.getParameter("regpassword"); 
	String major=request.getParameter("regmajor");
	String year=request.getParameter("regyear");
	 
Class.forName("com.mysql.jdbc.Driver").newInstance(); 
String url = "jdbc:mysql://localhost:3306/acms";
String db_pwd = "";
String db_uname = "root";
java.sql.Connection con = DriverManager.getConnection(url,db_uname,db_pwd); 
Statement st= con.createStatement(); 
ResultSet rs; 
int i=st.executeUpdate("insert into sregistration (sfirst_name, slast_name, semail, suser_name, spassword, smajor, syear) values ('"+fname+"','"+lname+"','"+email+"','"+username+"', '"+pwd+"', '"+major+"', '"+year+"')");
if(i!=0)
{
	response.sendRedirect("login.jsp");
}
else
{
	response.sendRedirect("sregistration.jsp");
}
con.close();
	}
	catch (IOException e) {
	out.println("Exception"+e);
}
}
else if(k.contains("facultyregistration.jsp"))
{
	try
	{
		String fname=request.getParameter("fregfname");
		String lname=request.getParameter("freglname"); 
		String email=request.getParameter("fregemail");	
		String username=request.getParameter("fregusername"); 
		String pwd=request.getParameter("fregpassword"); 
		String dpt=request.getParameter("fregdpt");
		String project_details=request.getParameter("fregproject");
	 
Class.forName("com.mysql.jdbc.Driver").newInstance(); 
String url = "jdbc:mysql://localhost:3306/acms";
String db_pwd = "";
String db_uname = "root";
java.sql.Connection con = DriverManager.getConnection(url,db_uname,db_pwd); 
Statement st= con.createStatement(); 
ResultSet rs; 
int i=st.executeUpdate("insert into fregistration (ffirst_name, flast_name, f_email, fuser_name, f_password, fdepartment, fproject_details) values ('"+fname+"','"+lname+"','"+email+"','"+username+"', '"+pwd+"', '"+dpt+"', '"+project_details+"')");
if(i!=0)
{
	response.sendRedirect("login.jsp");
}
else
{
	out.println("Registration Failed");
	response.sendRedirect("index.jsp");
}
con.close();
	}
	catch (IOException e) {
	out.println("Exception"+e);
}
}
%>


</BODY>
</HTML>
