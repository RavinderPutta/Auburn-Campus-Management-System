<%@ page import="java.io.*" %>
<%@ page import = "java.sql.*"%>
<HTML>
<HEAD>
<TITLE>Registration Form</TITLE>
</HEAD>
<BODY>

<%
try {
	String cname=request.getParameter("coursename");
	String dpt=request.getParameter("department"); 
	String instructor=request.getParameter("instructor_selected");
	String susername=(String)session.getAttribute("user_name");
	 
Class.forName("com.mysql.jdbc.Driver").newInstance(); 
String url = "jdbc:mysql://localhost:3306/acms";
String db_pwd = "";
String db_uname = "root";
java.sql.Connection con = DriverManager.getConnection(url,db_uname,db_pwd);
int instructorid=0;
int stuid=0; 
Statement st= con.createStatement(); 
ResultSet rs; 
String firstQuery="select freg_id from fregistration where fuser_name='"+instructor+"'";
rs=st.executeQuery(firstQuery);

if(rs.next())
{
	instructorid=rs.getInt(1);
}
String secondQuery="select sreg_id from sregistration where suser_name='"+susername+"'";
rs=st.executeQuery(secondQuery);
if(rs.next())
{
	stuid=rs.getInt(1);
}
int i=st.executeUpdate("insert into courses (course_name, department, instructor, instructor_id, stu_id) values ('"+cname+"','"+dpt+"','"+instructor+"','"+instructorid+"','"+stuid+"')");
if(i!=0)
{
	response.sendRedirect("student1.jsp");
}
else
{
	response.sendRedirect("courseregistration.jsp");
}
con.close();
}
catch (IOException e) {
	out.println("Exception"+e);
}
%>


</BODY>
</HTML>
