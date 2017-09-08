<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@include file="DBConnection.jsp" %>
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="EN" lang="EN" dir="ltr">
<head profile="http://gmpg.org/xfn/11">
<title>Registration</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<meta http-equiv="imagetoolbar" content="no" />
<link rel="stylesheet" href="Styles/layout.css" type="text/css" />



<script src="SpryAssets/SpryValidationTextField.js" type="text/javascript"></script>
<script type="text/javascript">

function checkForm(frm){

	frm.unm.disabled=false;

	frm.fee.disabled=false;
}
function showyear(){
	for (var i=0; i < document.fsrch.stype.length; i++)
   			{	
   				if (document.fsrch.stype[i].checked)
      			{
      				rad_val = document.fsrch.stype[i].value;
      			}
			}
			url="yearbranch.jsp?stype="+rad_val;
			
	if(window.XMLHttpRequest){
				  xmlhttp = new XMLHttpRequest();
			}else{
				  xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
			}
			xmlhttp.onreadystatechange=function()
  			{
  				
    			document.getElementById("year").innerHTML=xmlhttp.responseText;
    			
  			}
			
			xmlhttp.open("GET",url,true);
			xmlhttp.send();
}

function SearchDoc(){
			
			var rad_val="";	
			var l = document.fsrch.stype.length;
			
			for (var i=0; i < document.fsrch.stype.length; i++)
   			{	
   				if (document.fsrch.stype[i].checked)
      			{
					
      				rad_val = document.fsrch.stype[i].value;
					
      			}
			}
			var data = document.fsrch.srch.value;
			
			
		url = "searchstud.jsp?stype="+rad_val+"&data="+data;	
			
			if(window.XMLHttpRequest){
				  xmlhttp = new XMLHttpRequest();
			}else{
				  xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
			}
			xmlhttp.onreadystatechange=function()
  			{
  				
    			document.getElementById("showresult").innerHTML=xmlhttp.responseText;
    			
  			}
			
			xmlhttp.open("GET",url,true);
			xmlhttp.send();

}

function showuser(){
	var fnm = document.getElementById("fnm").value;
	var lnm = document.getElementById("lnm").value;
	var mnm = document.getElementById("mnm").value;
	var init = mnm.charAt(0);
	if(fnm != null && mnm !=null && lnm !=null && fnm!="" && mnm!="" && lnm!=""){
		
	document.getElementById("usernm").innerHTML="<input type='text' name='unm' value="+fnm+"_"+init+"_"+lnm+" disabled='disabled' />";
	
		
		
		
	}
}
function bat(){

	
	var l = document.getElementById("branch").selectedIndex;
	
	if(window.XMLHttpRequest){
				  xmlhttp = new XMLHttpRequest();
			}else{
				  xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
			}
			xmlhttp.onreadystatechange=function()
  			{
				
    			document.getElementById("b").innerHTML=xmlhttp.responseText;
    			
  			}
	url="yearbranch.jsp?selected="+l;
	xmlhttp.open("GET",url,true);
	xmlhttp.send();
}

function showres(){
	var l = document.getElementById("branch").selectedIndex;
	var j = document.getElementById("semester").selectedIndex;
	if(window.XMLHttpRequest){
				  xmlhttp = new XMLHttpRequest();
			}else{
				  xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
			}
			xmlhttp.onreadystatechange=function()
  			{
				
    			document.getElementById("showresult").innerHTML=xmlhttp.responseText;
    			
  			}
	var url = "showres.jsp?branch="+l+"&sem="+j;
	xmlhttp.open("GET",url,true);
	xmlhttp.send();
}
function total(){
	var form = document.forms[1];
	var txt = form["fortot"];
	var len = txt.length;
	var i;
	var marks = new Array();
	var total=0;
	for(i=0;i<len;i++){
		if(txt[i].value == null || txt[i].value=="")
		break;
	}
	if(i==len){
		for(i=0;i<len;i++){
			marks[i] = parseInt(txt[i].value);
		}
		for(i=0;i<len;i++){
			total += marks[i];
		}
		form.obttotal.value = total;
		
		
		var k = (total/form.maxtotal.value)*100;
		form.per.value=k;
		k = parseInt(k);
		if(k<40){
			form.grade.value="fail";
		}
		if(k>40 && k<50){
			form.grade.value="Pass Class";
		}
		if(k>=50 && k<60){
			form.grade.value="Second Class";
		}
		if(k>=60 && k<65){
			form.grade.value="First Class";
		}
		if(k>=65){
			form.grade.value="Distinction";
		}
	}
	var t = parseInt();
}
function cntry(){
	if(window.XMLHttpRequest){
				  xmlhttp = new XMLHttpRequest();
			}else{
				  xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
			}
			xmlhttp.onreadystatechange=function()
  			{
				
    			document.getElementById("showcountry").innerHTML=xmlhttp.responseText;
    			
  			}
	url="showcntry.jsp";
	xmlhttp.open("GET",url,true);
	xmlhttp.send();
}

</script>	


<link href="SpryAssets/SpryValidationTextField.css" rel="stylesheet" type="text/css" />
</head>
<!--<jsp:include page="include/top.jsp"></jsp:include>-->
<body onload="cntry()">
<body id="top">
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

<!-- you.jsp -->
<div class="wrapper col4">
  <div id="container">
    <div id="content">
      <h1>&nbsp;</h1>
      <p>&nbsp;</p>
<h2>&nbsp;</h2>
<form action="" method="post">
<input  type="submit" value="Student Registration" name="s" />
<input type="submit" value="Faculty Registration" name="s" />
<input type="submit" value="Search Student" name="s" />

</form>
<% 
try{
	String s = request.getParameter("s");
	if(s!=null) {
	
	if(s.equals("Student Registration")){

	%>
		<form name="regform" action="savestud.jsp?reg=stud" onsubmit="return checkForm(this)" onload="cntry()"> 
	<% } 
    if(s.equals("Faculty Registration"))
	{%>
    <form name="regform" action="savestud.jsp?reg=fac" onreset="cntry()" onsubmit="return checkForm(this)" onload="cntry()"> 
    <% } 
	if(s.equals("Student Registration") || s.equals("Faculty Registration")){
	%>
    
      <table summary="Summary Here" cellpadding="0" cellspacing="0">
        <thead>
          <tr>
            <th colspan="4">Registration Form</th>
            
          </tr>
        </thead>
        <tbody>
          <tr class="light">
<td colspan="2" ><label>First Name</label> </td>
<td colspan="2"><input type="text"  name="fnm" id="fnm" onblur="showuser()" /></td>
</tr>

<tr class="dark">
<td colspan="2">Middle Name</td>
<td colspan="2"><input type="text" name="mnm" id="mnm" onblur="showuser()" /></td>
</tr>

<tr class="light">
<td colspan="2">Last Name</td>
<td colspan="2"><input type="text" name="lnm" id="lnm" onblur="showuser()" /></td>
</tr>
<tr class="dark">
<td colspan="2">User Name</td>
<td colspan="2"><div id="usernm"></div></td>
</tr>
<tr class="light">
<td colspan="2">Password</td>
<td colspan="2"><input type="password" name="pwd" /></td>
</tr>
<tr class="dark">
<td colspan="2">Confirm Password</td>
<td colspan="2"><input type="password" name="cpwd" /></td>
</tr>
<tr class="light">
<td colspan="2">Address</td>
<td colspan="2"><input type="text" name="addr"  /></td>
</tr>
<tr class="dark">
<td colspan="2">Phone Number</td>
<td colspan="2"><input type="text" name="pno" /></td>
</tr>
<tr class="light">
<td colspan="2">Branch</td>
<td colspan="2"><select id="branch" name="branch" onChange="bat()">
<option value="none" selected="selected">-------------------Select-------------------</option>
<optgroup label="Engineering">
<option value="ce">Compter Engineering</option>
<option value="it">Information & Technology</option>
<option value="mech">Mechanical Engineering</option>
<option value="ec">Electrionics & Communication</option>
<option value="bt">BioTechnology</option>
</optgroup>
<optgroup label="Commerce">
<option value="bcom">B.Com</option>
<option value="bba">BBA</option>
<option value="bca">BCA</option>
</optgroup>
</select></td>
</tr>
<% if(s.equals("Student Registration")){%>
<tr class="dark">
<td colspan="2">Batch</td>
<td colspan="2"><div id="b"></div></td>
</tr>
<%}%>

<tr class="light">
<td colspan="2">Email id</td>
<td colspan="2"><input type="text" name="eid" /></td>
</tr>





<% if(s.equals("Faculty Registration")){
%>
<tr class="dark">
	<td colspan="2">Highest Degree</td>
    <td colspan="2">
    <select name="degree">
    <option selected="selected">Select The Qualification</option>
    <optgroup label="Engineering">
    <option value="phd">PhD</option>
    <option value="me">ME</option>
    <option value="btech">BTech</option>
    <option value="be">BE</option>
    </optgroup>
    <optgroup label="Commerce">
    <option value="masters">Masters</option>
    <option value="bachelor">Bacheolr</option>
    <option value=""></option>
    </optgroup>
    </select>
    </td>
    </tr>
    <tr class="light">
    <td colspan="2">Experience</td>
    <td colspan="2"><input type="text" name="exp" /></td>
    </tr>
<%}%>




<tr class="dark">
<td colspan="2">Nationality</td>
<td colspan="2"><div id="showcountry"></div></td>
</tr>

<tr class="light">

<td colspan="4"><center><input type="submit"  value="submit"/><input type="reset" value="Reset" /></center></td>

</tr>

       </tbody>
      </table>

      </form>
      <% 
	  
	  }}
	  /*if(s.equals("Search Student")){
		  %>
          <form name="fsrch" action="fullpro.jsp" method="get">
          <table>
          <tr class="light">
          <td>Search By </td>
          <td colspan="2"><input type="radio" name="stype" value="roll_no"  />Roll Number

      <input type="radio" name="stype" value="sname" />Name</td>
      
      
<td>      <input type="text"  name="srch" onkeyup="SearchDoc()" /></td>
		  </tr>
          <tr class="dark">
          <td colspan="4"><div id="showresult"></div></td>
          </tr>
          </table>
		</form>
		<%  
		
	  }*/
	  	}catch(Exception e){ } %>
      
    
    
      
      <div id="comments">
        <h2>&nbsp;</h2>
      </div>
      <div id="respond">
        <form action="#" method="post">
</form>

     <jsp:include page="include/bottom.jsp"></jsp:include>