<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@include file="DBConnection.jsp" %>
<%@ page import="java.io.*" %>
<%@ page import="java.util.*" %>
<html>
<HEAD>
<TITLE>ACMS</TITLE>
<link rel="stylesheet" href="Styles/layout.css" type="text/css" />
<script src="//ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
    <script src="//cdn.auburn.edu/assets/js/default.min.js"></script>
    <head></head>
    <body id="top">
 
      

<div class="wrapper col1">
  <div id="header">
    <ul id="topnav">
      <li><a href="aboutus.jsp">About Us</a></li>
      <li><a href="reg1.jsp">Registration</a></li>
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
<h1>GPA Calculator</h1>
    <table>
        <tr>
            <td><p>How many A's do you have?</p></td>
            <td><input type="text" id="hrs1" value="0" class="gpa" data-x="1" /></td>
            <td id="e1"></td>
        </tr>
        <tr>
            <td><p>How many B's do you have?</p></td>
            <td><input type="text" id="hrs2" value="0" class="gpa" data-x="2" /></td>
            <td id="e2"></td>
        </tr>
        <tr>
            <td><p>How many C's do you have?</p></td>
            <td><input type="text" id="hrs3" value="0" class="gpa" data-x="3" /></td>
            <td id="e3"></td>
        </tr>
        <tr>
            <td><p>How many D's do you have?</p></td>
            <td><input type="text" id="hrs4" value="0" class="gpa" data-x="4" /></td>
            <td id="e4"></td>
        </tr>
        <tr>
            <td><p>How many F's do you have?</p></td>
            <td><input type="text" id="hrs5" value="0" class="gpa" data-x="5" /></td>
            <td id="e5"></td>
        </tr>
    </table>

    <h4 id="result"></h4><br />

        
    <script src="Scripts/calculator.js"></script>
    </div></div>

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