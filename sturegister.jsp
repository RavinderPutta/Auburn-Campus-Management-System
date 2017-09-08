<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@include file="DBConnection.jsp" %>
<%@ page import="java.io.*" %>
<%@ page import="java.util.*" %>
<html>
<HEAD>
<TITLE>ACMS</TITLE>
<link rel="stylesheet" href="Styles/layout.css" type="text/css" />
 		
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

<form action="sturegisterSuccess.jsp" name="register" method="post">
<table>
<tbody>
<tr><td>Name:</td>
      <td><input type="text" name="regname" /></td>
</tr>
<tr><td>Username:</td>
      <td><input type="text" name="regusername"/></td>
</tr>
<tr><td>Password:</td>
      <td><input type="password" name="regpassword" /></td>
</tr>      
<tr><td>ReEnter Password:</td>
      <td><input type="password" name="regrepassword" /></td>
</tr> </tbody></table>     
<center><input type="submit" name="register" value="Register Here" onclick="Validate()" /></center>
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
