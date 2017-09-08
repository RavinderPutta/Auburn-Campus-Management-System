<%@ page import="java.io.*" %>
<%@ page import="java.lang.*" %>
<%@ page import = "java.sql.*"%>
 <HTML>
<HEAD>
<TITLE>Validate</TITLE>
<SCRIPT type="text/javascript">
</SCRIPT>

</HEAD>
<BODY>

<%
try
{
	boolean flag = false;
	String strusername = request.getParameter("username");
	String strpassword = request.getParameter("password"); 	
	String strradio = request.getParameter("r1");
	Class.forName("com.mysql.jdbc.Driver"); 
	java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/acms","root",""); 
	Statement st= con.createStatement(); 
	ResultSet rs;
	String queryStr="";
	if("student1.jsp".equals(strradio))
	{
		queryStr="select * from sregistration where suser_name='"+strusername+"' and spassword='"+strpassword+"'";
		
	}
	else if("faculty.jsp".equals(strradio))
	{
		queryStr="select * from fregistration where fuser_name='"+strusername+"' and f_password='"+strpassword+"'";
	}
	rs=st.executeQuery(queryStr); 
	if(rs.next())
	{
		out.println("Login Success");
		session.setAttribute("user_name", strusername);
		session.setAttribute("first_name", strusername);
		session.setAttribute("last_name", strusername);
		out.println("welcome"+strusername);
		if("faculty.jsp".equals(strradio))
		{
			response.sendRedirect("faculty.jsp"); 
		}
		else if("student1.jsp".equals(strradio))
		{
			response.sendRedirect("student1.jsp");
		}
	}
	else
	{
		session.setAttribute("user_name",strusername);
		session.setAttribute("regflag","rtrue");
		response.sendRedirect("login.jsp");
	}
	con.close();
}

catch (IOException e)
{
	out.println("Exception"+e);
}            
%>

</BODY>
</HTML>
