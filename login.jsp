<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@include file="DBConnection.jsp" %>
<%@ page import="java.io.*" %>
<%@ page import="java.util.*" %>
<%@ page import = "java.sql.*"%>
<html>
<HEAD>
<TITLE>ACMS</TITLE>
<link rel="stylesheet" href="Styles/layout.css" type="text/css" />
<SCRIPT type="text/javascript">
 		
 		
function funValidate()
{
    if(document.login.username.value == '')
    {
         alert('Please enter Username')
         document.login.username.focus()
    }
    
    if(document.login.password.value == '')
    {
        alert('Please enter Password')
        document.login.password.focus()
    } 

} 	 		
 		
function funRedirect(value)
{
     if(value == 'register')
     {  
        window.location="register.jsp"; 
    }
}	

		
</SCRIPT>
</HEAD>
<body id="top">
 <form action="validate.jsp" name="login"  method="post" >
      

<div class="wrapper col1">
  <div id="header">
    <ul id="topnav">
      <li><a href="aboutus.jsp">About Us</a></li>
      <li><a href="reg1.jsp">Registration</a></li>
      <li><a href="http://www.auburn.edu/main/welcome">Homepage</a></li>
    </ul>
    <div >
      <h1><a href="index.jsp">Auburn Campus Management System</a></h1>

    </div>
   
  </div>
</div>  
<div class="wrapper col2"></div>
<div class="wrapper col4">
  <div id="container">
  <div text-align="center">
   <%
String rflag = (String) session.getAttribute("regflag");

if(rflag == "rtrue")
{
        out.println(" <b>");
        out.println("Please enter valid username and password");
        out.println("</b>");
        session.setAttribute("regflag","rfalse");
  
}

String sflag = (String) session.getAttribute("regSuccess");
String username = (String) session.getAttribute("regUser");

if(sflag == "success")
{
	    out.println(" <b>");
        out.println("User "+username+" Registered Successfully");
        out.println("</b>");
        session.setAttribute("regSuccess","failure");
}

%>
  </div>
    <div id="content">
      <h1>&nbsp;</h1>
      <p>&nbsp;</p>
<h2>&nbsp;</h2>

   
      <table summary="Summary Here" cellpadding="0" cellspacing="0">
     
        <thead>
          <tr>
            <th colspan="4">Login</th>
            
          </tr>
        </thead>
         <tbody>
          <tr class="light">
<td colspan="2" >User Name </td>
<td colspan="2"><input type="text" name="username"  required/></td>
</tr>

<tr class="dark">
<td colspan="2">Password</td>
<td colspan="2"><input type="password"  name="password" required /></td>
</tr>
<tr class="light">
<td colspan="4"><center><input type="radio" value="student1.jsp" name="r1" required/>Student
<input type="radio" value="faculty.jsp" name="r1" required/>Faculty
</tr>
<tr class="light">
<center>
<td colspan="4"><center><input type="submit" name="login" value="Login" onclick="funValidate()" /></center></td>
</center>
</tr>

       </tbody>
      </table>
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
</body>
</html>
