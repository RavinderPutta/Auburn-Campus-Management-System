<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@include file="DBConnection.jsp" %>
<%@ page import="java.io.*" %>
<%@ page import="java.util.*" %>
<html>
<HEAD>
<TITLE>Course Registration</TITLE>
<link rel="stylesheet" href="Styles/layout.css" type="text/css" />
<%if ((session.getAttribute("user_name") == null) || (session.getAttribute("user_name") == "")) {
	response.sendRedirect("login.jsp");
}%>
	
 		
<SCRIPT> 		
function Validate()
{
    if(document.stureg.regname.value == '')
    {
         alert('Enter a name')
         document.stureg.regname.focus()
    }
    else if(document.stureg.regusername.value == '')
    {
         alert('Enter a Username')
         document.stureg.regusername.focus()
    }
    else if(document.stureg.regpassword.value == '')
    {
        alert('Enter a Password')
        document.stureg.regpassword.focus()
    } 
    else if(document.stureg.regrepassword.value == '')
    {
        alert('Re - Enter a Password')
        document.stureg.regpassword.focus()
    } 
    else if(document.stureg.regpassword.value != document.stureg.regrepassword.value)
    {

        alert('Password and Re-Enter Password does not match');
        
    } 
   
 } 	 		
 		

		
</SCRIPT>

</HEAD>
<BODY id="top">
<div class="wrapper col1">
  <div id="header">
    <ul id="topnav">
      <li><a href="aboutus.jsp">About Us</a></li>
	  <%if ((session.getAttribute("user_name") == null) || (session.getAttribute("user_name") == "")) {%>
      <li><a href="login.jsp">Login</a></li>
	  <%}
	  else{%>
		  <li><a href="logout.jsp">Logout</a></li>
	  <%}%>
      <li><a href="http://www.auburn.edu/main/welcome">Homepage</a></li>
    </ul>
    <div >
      <h1><a href="student1.jsp">Auburn Campus Management System</a></h1>
    </div>
   
  </div>
</div>  
<div class="wrapper col2"></div>
<div class="wrapper col4">
  <div id="container">
  <div text-align="center">
<% 
String cflag = (String) session.getAttribute("courseflag");
if(cflag == "ctrue")
{
        out.println(" <b>");
        out.println("Please enter valid faculty username which is already created");
        out.println("</b>");
        session.setAttribute("courseflag","cfalse");
  
}
%>
<table>
<thead>
<th class="dark">Course Registration</th></thead>
</table>

<form action="courseinsert.jsp" name="register" method="post">
<table>
<tbody>
<tr><td>Course Name:</td>
      <td><input type="text" name="coursename" required/></td>
</tr>
<tr><td>Department:</td>
      <td><input type="text" name="department" required/></td>
</tr>
<tr><td>Instructor Username</td>
      <td><select name="instructor_selected" id="instructorSelID"><option value=""><---Select---></option>
	  <%
			 String url = "jdbc:mysql://localhost:3306/acms";
			 String username="root";
			 String password="";
			 Connection  conn=null;
			 String classPath = "com.mysql.jdbc.Driver";
			 try{
				Class.forName(classPath);
				conn = DriverManager.getConnection(url,username,password);
			  }catch(Exception exc){
				out.println(exc.toString());
			  }
			%>
			<%
			PreparedStatement psmnt = conn.prepareStatement("select * from fregistration");
			ResultSet results = psmnt.executeQuery();
			while(results.next())
			{
				String instructor_id = results.getString("fuser_name");
				String firstname = results.getString("ffirst_name");
				String lastname = results.getString("flast_name");
				%><option value="<%= instructor_id %>">
				<% out.println(firstname+" "+lastname); %>
					</option>
				<%
			} results.close(); psmnt.close(); conn.close();%>
			</select></td>
</tr> </tbody></table>     
<center><input type="submit" name="course_register" value="Register Here" onclick="Validate()" /></center>
</form> 
<div id="comments">
        <h2>&nbsp;</h2>
      </div>
      <div id="respond">
        <form action="#" method="post">
</form>

      
      </div>
    </div>
</div>
</div>
<div class="wrapper col5">
  <div id="footer">
    
   
  </div>
</div>
<div class="wrapper col6">
  <div id="copyright">
    <p class="fl_left"></p>
    <p class="fl_right"></p>
    <br class="clear" />
  </div>
</div>
</div>


</BODY>
</HTML>
