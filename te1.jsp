<%@ page import="java.io.*" %>
<%@ page import="java.util.*" %>
<HTML>
<HEAD>
<TITLE>Guest Book</TITLE>
<SCRIPT type="text/javascript">
 		
 		
function funValidate()
{
    if(document.home.username.value == '')
    {
         alert('Please enter Username')
         document.home.username.focus()
    }
    
    if(document.home.password.value == '')
    {
        alert('Please enter Password')
        document.home.password.focus()
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
<BODY bgcolor="#F6E3CE">
<form action="validate.jsp" name="home" method="post" >

<table align="center" frame="box" bgcolor="#dd550c">
<th width="250">Guestbook</th>
</table>

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

<table align="center" frame="box" >
<tr>
<td>Username:</td>
<td><input type="text" name="username" /></td>
</tr>
<tr>
<td>Password:</td>
<td><input type="password" name="password" /></td>
</tr>
<tr>
<td><input type="submit" name="login" value="Login" onclick="funValidate()"/></td>
<td><input type="button" name="register" value="Register" onclick="funRedirect('register')" /></td>
</tr>

</table>
</form> 

</BODY>
</HTML>
