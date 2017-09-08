<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@include file="DBConnection.jsp" %>
<%@ page import="java.io.*" %>
<%@ page import="java.util.*" %>
<html>
<HEAD>
<TITLE>ACMS</TITLE>
<link rel="stylesheet" href="Styles/layout.css" type="text/css" />
<BODY id="top">
                                 
<div class="wrapper col1">
  <div id="header">
    <ul id="topnav">
      <li><a href="aboutus.jsp">About Us</a></li>
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

<table>
<tr class="light">
<form action="sturegister.jsp" name="s1" method="post"><td><center><input type="submit" value="Student" name="s1" /></center></td></form>
</tr>
</br>
<td>&nbsp;</td>
<tr class="dark">
<form action="facregister.jsp" name="f1" method="post"><center><input type="submit" value="Faculty" name="f1" /></center></td></form>
</tr>
</table>     
<!--<form action="register.jsp" name="s1" method="post"><td><center><input type="submit" name="register" value="Register Here" onclick="Validate()" />-->
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