<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@include file="DBConnection.jsp" %>
<%@ page import="java.io.*" %>
<%@ page import="java.util.*" %>
<html>
<HEAD>
<TITLE>ACMS</TITLE>
<link rel="stylesheet" href="Styles/layout.css" type="text/css" />
 		
<SCRIPT type="text/javascript"> 
function radio_input(url)
{
	window.location.href='http://localhost:8080/ACMS/'+url
}				
</SCRIPT>

</HEAD>
<BODY id="top">
<div class="wrapper col1">
  <div id="header">
    <ul id="topnav">
      <li><a href="about.jsp">About Us</a></li>
      <li><a href="login.jsp">Login</a></li>
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
<table>
<thead>
<th class="dark">Registration</th></thead>
</table>

<form action="registerSuccess.jsp" name="register" method="post">
<table>
<tbody>
<tr class="light">
<td colspan="4"><center><input type="radio" onClick=radio_input('studentregistration.jsp') name="r1" />Student
<input type="radio" value="faculty.jsp" name="r1" onClick=radio_input('facultyregistration.jsp') />Faculty
</tr> </tbody></table>     
<center><input  name="register" value="Select one from above"/></center>
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
