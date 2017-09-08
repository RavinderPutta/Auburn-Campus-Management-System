<%@page session="true" %>
<%@include file="DBConnection.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="EN" lang="EN" dir="ltr">
<head profile="http://gmpg.org/xfn/11">
<title>Profile</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<meta http-equiv="imagetoolbar" content="no" />
  
<link rel="stylesheet" href="Styles/layout.css" type="text/css" />
<%
    if ((session.getAttribute("user_name") == null) || (session.getAttribute("user_name") == "")) {
		out.println("Please login");
		response.sendRedirect("login.jsp");
	}
%>

<script src="//ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
    <script src="//cdn.auburn.edu/assets/js/default.min.js"></script>

<script type="text/javascript">

function checkoption(){
	var option = document.stud.studoption.value;
	var usernm = <%= (String)session.getAttribute("who") %>
	
	// url="showprofile.jsp?usernm="+usernm;
			
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
            <th colspan="4">Welcome&nbsp;<%=session.getAttribute("user_name")%></th>
            
          </tr>
        </thead>
        <tbody>
        <form action="" method="post">
        <tr class="light">
        <td colspan="4"><center>
		<input type="submit" value="Courses" name="studoption" />
		<input type="submit" value="Fee Status" name="studoption" />
		<input type="submit" value="Result" name="studoption" />
		<input type="submit" value="Library" name="studoption"/>
		 <input type="submit" value="Assignments" name="studoption" /></form></form>
		<form action="gpacal.jsp" name="studoption" method="post" style="display:inline;">
        <input type="submit" value="GPA Calculator" name="studoption"/></form>
		</center>
		</td>
		</tr>
      
     <%
     try{
String s = request.getParameter("studoption");

if(s.equals("Courses")){
	try
	{
		Class.forName("com.mysql.jdbc.Driver").newInstance(); 
		String url = "jdbc:mysql://localhost:3306/acms";
		String db_pwd = "";
		String db_uname = "root";
		java.sql.Connection con = DriverManager.getConnection(url,db_uname,db_pwd); 
		Statement st= con.createStatement(); 
		ResultSet rs;
		String suser=(String)session.getAttribute("user_name");
		String firstQuery="select sreg_id from sregistration where suser_name='"+suser+"'";
		rs=st.executeQuery(firstQuery);
		int s_id=0;
		if(rs.next())
		{
			s_id=rs.getInt(1);
		}
		String flname_query="select sfirst_name,slast_name from sregistration where sreg_id='"+s_id+"'";
		String fname="";
		String lname="";
		rs=st.executeQuery(flname_query);
		if(rs.next())
		{
			fname=rs.getString(1);
			lname=rs.getString(2);
		}
		String queryString="select * from courses where stu_id="+s_id;
		rs=st.executeQuery(queryString);
	%>
    	<tr class="light">
        <td colspan="2">
        Student Name
        </td>
        <td colspan="2">
        <input type="text" value=<%=fname%>&nbsp;<%=lname%> disabled="disabled" />
        </td>
        </tr>
        <tr class="dark">
        <td colspan="2">
        Branch
        </td>
        <td colspan="2">
        <input type="text" value="Computer Science" disabled="disabled" />
        </td>
        </tr>
        <tr class="light">
        <td colspan="4">
        <table>
        <thead>
        <th>Course ID</th>
        <th>Course Name</th>
        <th>Department</th>
        <th>Instructor</th>
        </thead>
		<tbody>
 <% while(rs.next()){  %>     
		
        <tr class="light">

        <td><%=rs.getString("course_id") %></td>
        <td><%=rs.getString("course_name") %></td>
        <td><%=rs.getString("department") %></td>
        <td><%=rs.getString("instructor") %></td>
        </tr>
        
<%
 }%>
 </tbody>
 </table>
	<%}
 catch (Exception e){
	 e.printStackTrace();
 }
}
else if(s.equals("Fee Status")){
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
        <td>$15000</td>
        <td>Paid</td>
        <td>8/15/2015</td>
        </tr>
        <tr class="light">

        <td>2</td>
        <td>$15000</td>
        <td>Paid</td>
        <td>1/8/2016 </td>
        </tr>
        <tr class="light">

        </tr>
        </tbody>
        </table>
        </td>
        </tr>
<%
}else if(s.equals("Result")){
	%>
    	<!--<form name="result" action="" method="post">
   
      <table summary="Summary Here" cellpadding="0" cellspacing="0">
        <thead>
          <tr>
            <th colspan="4">Result</th>
            
          </tr>
        </thead>
        <tbody>-->
        
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
        <th>Course</th>
        <th>Test</th>
        <th>Date</th>
        <th>Points</th>
        <th>Grade</th>
        </thead>
        <tbody>
        <tr class="light">

        <td >1</td>
        <td>Web Development</td>
        <td>XML 1</td>
        <td>04/10/2016</td>
        <td>150/153</td>
        <td>A</td>
        </tr>
        <tr class="light">

        <td>1</td>
        <td>Web Development</td>
        <td>XML 2</td>
        <td>04/10/2016</td>
        <td>150/153</td>
        <td>A</td>
        </tr>
        <tr class="light">

        <td>1</td>
        <td>Operating Systems</td>
        <td>OS_Test</td>
        <td>1/16/2016</td>
         <td>95/100</td>
          <td>A</td>
        </tr>
        
        <tr class="light">

        <td>2</td>
        <td>Computer Architecture</td>
        <td>Test_CA</td>
        <td>1/12/2015</td>
        <td>90/100</td>
        <td>A</td>
        </tr>
        <tr class="light">

        <td>2</td>
        <td>Computer Architecture</td>
        <td>Paid</td>
        <td>12/11/2015</td>
        <td>89/100</td>
        <td>B</td>
        </tr>
        <tr class="light">

        
<!--<tr class="light">
<td colspan="2">Semester</td>
  <input type="text" value="1" disabled="disabled" />
</tr>
<tr class="dark">
<td colspan="4"><div id="showresult"></div></td>
</tr>-->

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
        <td>23/3/2015</td>
        <td>7/4/2015</td>
        </tr> 
        

        <tr class="light">
        <td></td>
        <td>2</td>
        <td>Web Development</td>
        <td>Barons</td>
        <td>4239182</td>
        <td>30/3/2015</td>
        <td>14/4/2015</td>
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
}else if(s.equals("Assignments")){
				   %>
                   	<tr class="light">
            <td colspan="2"><a href="XML_Assignment2_Instructions.docx">Assignment1</a></td>
            <td colspan="2"><a href="XML_Assignment3_Instructions.docx">Assignment2</a></td>
            
            
            </tr>
            

				   <%
			   }
/*else if(s.equals("gpa Calculator")){
<form action="gpacal.jsp" name="studoption" method="post"></form>
}*/
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
    <br class="clear" />
  </div>
</div>
</body>
</html>
<html>
<body>


<%
	/*for(int j=1989;j<2020;j++)
	{
		%>
        <option value="<%= j %>"><%= j %>-<%= j+4 %></option>
		<%
		}*/
%>


