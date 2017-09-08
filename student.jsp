<%@page session="true" %>
<%@include file="DBConnection.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="EN" lang="EN" dir="ltr">
<head profile="http://gmpg.org/xfn/11">
<title>Profile</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<meta http-equiv="imagetoolbar" content="no" />
  
<link rel="stylesheet" href="Styles/layout.css" type="text/css" />



<script type="text/javascript">

function checkoption(){
	var option = document.stud.studoption.value;
	var usernm = <%= (String)session.getAttribute("who") %>
	
	url="showprofile.jsp?usernm="+usernm;
			
	if(window.XMLHttpRequest){
				  xmlhttp = new XMLHttpRequest();
			}else{
				  xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
			}
			xmlhttp.onreadystatechange=function()
  			{
  				
    			document.getElementById("seeprofile").innerHTML=xmlhttp.responseText;
    			
  			}
			
			xmlhttp.open("GET",url,true);
			xmlhttp.send();

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
				
    			document.getElementById("showsem").innerHTML=xmlhttp.responseText;
    			
  			}
	url="yearbranch.jsp?sem="+l;
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
</script>
</head>
<jsp:include page="include/top.jsp"></jsp:include>
<!-- you.jsp -->
<%

		%>
        <div class="wrapper col4">
  <div id="container">
    <div id="content">
      <h1>&nbsp;</h1>
      <p>&nbsp;</p>
<h2>&nbsp;</h2>

      <table summary="Summary Here" cellpadding="0" cellspacing="0">
        <thead>
          <tr>
            <th colspan="4">Welcome&nbsp;ACMS</th>
            
          </tr>
        </thead>
        <tbody>
        <form action="" method="post">
        <tr class="light">
        <td colspan="4"><center><input type="submit" value="See Profile" name="studoption" /><input type="submit" value="Fee Status" name="studoption" /><input type="submit" value="Result" name="studoption" /><input type="submit" value="Library" name="studoption"</center></td>
        </tr>
      </form>
     
<%
try{
String s = request.getParameter("studoption");
if(s.equals("Fee Status")){
	%>
    	<tr class="light">
        <td colspan="2">
        Student Id
        </td>
        <td colspan="2">
        <input type="text" value="07ce010" disabled="disabled" />
        </td>
        </tr>
        <tr class="dark">
        <td colspan="2">
        Branch
        </td>
        <td colspan="2">
        <input type="text" value="Computer Engineering" disabled="disabled" />
        </td>
        </tr>
        <tr class="light">
        <td colspan="4">
        <table>
        <thead>
        <th>Semester</th>
        <th>Fees</th>
        <th>Status</th>
        <th>Due Date</th>
        </thead>
        <tbody>
        <tr class="light">

        <td>1</td>
        <td>38000</td>
        <td>Paid</td>
        <td>15/8/2007</td>
        </tr>
        <tr class="light">

        <td>2</td>
        <td>38000</td>
        <td>Paid</td>
        <td>15/1/2008</td>
        </tr>
        <tr class="light">

        <td>3</td>
        <td>38000</td>
        <td>Paid</td>
        <td>15/8/2008</td>
        </tr>
        <tr class="light">

        <td>4</td>
        <td>38000</td>
        <td>Paid</td>
        <td>15/1/2009</td>
        </tr>
        <tr class="light">

        <td>5</td>
        <td>38000</td>
        <td>Paid</td>
        <td>15/8/2009</td>
        </tr>
        <tr class="light">

        <td>6</td>
        <td>38000</td>
        <td>Paid</td>
        <td>15/1/2010</td>
        </tr>
        <tr class="light">

        <td>7</td>
        <td>38000</td>
        <td>Paid</td>
        <td>15/8/2010</td>
        </tr>
        <tr class="light">

        <td>8</td>
        <td>38000</td>
        <td>Paid</td>
        <td>15/1/2011</td>
        </tr>
        </tbody>
        </table>
        </td>
        </tr>
	<%
}else if(s.equals("Result")){
	%>
    	<form name="result" action="" method="post">
   
      <table summary="Summary Here" cellpadding="0" cellspacing="0">
        <thead>
          <tr>
            <th colspan="4">Result</th>
            
          </tr>
        </thead>
        <tbody>
          <tr class="light">
<td colspan="2" >Student Id</td>
<td colspan="2"><input type="text" name="stuid" id="stuid" disabled="disabled" value="07ce010" /></td>
</tr>

<tr class="dark">
<td colspan="2">Branch</td>
        <td colspan="2">
        <input type="text" value="Computer Engineering" disabled="disabled" />
        </td>
        </tr>

<tr class="light">
<td colspan="2">Semester</td>
 <input type="text" value="1" disabled="disabled" />
</tr>
<tr class="dark">
<td colspan="4"><div id="showresult"></div></td>
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
 
	<%
}else if(s.equals("Library")){
	%>
    	<tr class="light">
        <td colspan="4">
        <table>
        <th>
        <th>Sr. No.</th>
        <th>Book Name</th>
        <th>Author</th>
        <th>ISDN</th>
        <th>Issue Date</th>
        <th>Return Date</th>
        </thead>
		<tr class="dark">
        <td></td>
        <td>1</td>
        <td>Java</td>
        <td>Herbert</td>
        <td>63729182</td>
        <td>23/3/2011</td>
        <td>7/4/2011</td>
        </tr> 
        

        <tr class="light">
        <td></td>
        <td>2</td>
        <td>GRE</td>
        <td>Barons</td>
        <td>4239182</td>
        <td>30/3/2011</td>
        <td>14/4/2011</td>
        </tr>
        
        </tbody>
        </table>
        </td>
        </tr>
	<%
}else if(s.equals("Result")){
	%>
	<tr class="light">
        <td colspan="4">
        <table>
        <th>
        <th>Sr. No.</th>
        <th>Semester</th>
        <th>Test</th>
        <th>Date</th>
        <th>Points</th>
        <th>Grade</th>
        </thead>
        <tr class="dark">
        <td></td>
        <td>1</td>
        <td>1</td>
        <td>XML Test</td>
        <td>04/13/2016</td>
        <td>150/153</td>
        <td>A</td>
        </tr> 
	<%
}
}catch(Exception e){
}
%>
       </tbody>
      </table>

     <div id="respond">
        <form action="#" method="post">
</form>

      </div>
    </div>
    <div class="clear"></div>
  </div>
</div>
<div class="wrapper col5">
  <div id="footer">
    
   
  </div>
</div>
<div class="wrapper col6">
  <div id="copyright">
   <!-- <p class="fl_left">Copyright &copy; 2010 - All Rights Reserved - <a href="#">Domain Name</a></p>
    <p class="fl_right">Template by <a href="http://www.os-templates.com/" title="Open Source Templates">OS Templates</a></p>-->
    <br class="clear" />
  </div>
</div>
</body>
</html>
<html>
<body>

		<%/*
	}else{
		
	}
}catch(Exception e){
	response.sendRedirect("login.jsp");
}*/
%>
<!--     <tr class="light">
<td colspan="2" >First Name </td>
<td colspan="2"><input type="text"  name="fnm" id="fnm" /></td>
</tr>

<tr class="dark">
<td colspan="2">Middle Name</td>
<td colspan="2"><input type="text" name="mnm" id="nm" /></td>
</tr>

<tr class="light">
<td colspan="2">Last Name</td>
<td colspan="2"><input type="text" name="lnm" /></td>
</tr>

<tr class="dark">
<td colspan="2">10th Percentage</td>
<td colspan="2"><input type="text" name="per10" /></td>
</tr>
<tr class="light">
<td colspan="2">12th Percentage</td>
<td colspan="2"><input type="text" name="per12" /></td>
</tr>
<tr class="dark">
<td colspan="2">Quota</td>
<td colspan="2"><input type="radio" value="Open" name="quota" />Open<input type="radio" value="SC" name="quota" />SC<input type="radio" value="BC" name="quota" />BC</td>
</tr>
<tr class="light">
<td colspan="2">Address</td>
<td colspan="2"><input type="text" name="addr" /></td>
</tr>
<tr class="dark">
<td colspan="2">Mobile Number</td>
<td colspan="2"><input type="text" name="pno" /></td>
</tr>
<tr class="light">
<td colspan="2">          Branch</td>
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

<tr class="light">
<td colspan="2">Batch</td>
<td colspan="2"><div id="b"></div></td>
<!-- <td colspan="2">
<select name="yr">
<option value="none">----Select----</option> -->
<%
	/*for(int j=1989;j<2020;j++)
	{
		%>
        <option value="<%= j %>"><%= j %>-<%= j+4 %></option>
		<%
		}*/
%>
<!-- </select>
</td> 
</tr>
<tr class="dark">
<td colspan="2">Email id</td>
<td colspan="2"><input type="text" name="eid" /></td>
</tr>


<tr class="light">

<td colspan="2">12th Percentage</td>
<td colspan="2"><input type="text" name="per" /></td>



</tr>
<tr class="dark">
<td colspan="2">Father's Occupation</td>
<td colspan="2"><input type="text" name="foccup" /></td>
</tr>
<tr class="light">
<td colspan="2">Family's Yearly Income</td>
<td colspan="2"><input type="text" name="finc" /></td>
</tr>
<tr class="dark">
<td colspan="2">Fees Mode</td>
<td colspan="2"><input type="radio" name="feemode" value="sf" onclick="fees()" />Self-Finance<input type="radio" value="g" name="feemode" onclick="fees()" />Govern<input type="radio" name="feemode" value="sg" onclick="fees()" />Semi-Govern</td>
</tr>
<tr id="light">
<td colspan="2">Fees</td>
<td colspan="2"><div id="showfee"></div>
</tr>
<tr class="light">
<td colspan="2">Blood Group</td>
<td colspan="2">
<select name="bgrp">
<option selected="selected">Select Blood Group</option>
<option value="a-">A-</option>
<option value="a+">A+</option>
<option value="ab+">AB+</option>
<option value="ab-">AB-</option>
<option value="b+">B+</option>
<option value="b-">B-</option>
<option value="o+">O+</option>
<option value="o-">O-</option>
</select>
</td>
</tr>
<tr class="light">
<td colspan="2">Nationality</td>
<td colspan="2"><input type="text" name="nlty" /></td>
</tr>
<tr class="dark">
<td colspan="2">Religion</td>
<td colspan="2"><input type="text" name="religion" /></td>
</tr>
<tr class="light">
<td colspan="2" >Caste</td>
<td colspan="2" ><input type="text" name="caste" /></td>
</tr>
 <tr class="dark">
						<td><b>Student's Pic</b></td>
						<td><INPUT NAME="F1" TYPE="file"></td>
					</tr>
 
<tr class="light">

<td colspan="4"><center><input type="submit"  value="submit"/><input type="reset" value="Reset" /></center></td>

</tr> -->