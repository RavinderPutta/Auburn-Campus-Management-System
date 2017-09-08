<body id="top">
<div class="wrapper col1">
  <div id="header">
    <ul id="topnav">
    <li><a href="aboutus.jsp">About Us</a></li>  
      
	  <%
	  String currentUrl="";
	  currentUrl=request.getRequestURL().toString();
	  if(currentUrl.contains("index.jsp")){	%>
	  <li><a href="registerchoice.jsp">Registration</a></li>
	  <li><a href="login.jsp">Login</a></li>
	  <%}
    else if ((session.getAttribute("user_name") == null) || (session.getAttribute("user_name") == "")) {
%>
	   <li><a href="registerchoice.jsp">Registration</a></li>
       <li><a href="login.jsp">Login</a></li>
	   <%} else {
		   currentUrl=request.getRequestURL().toString();
		   if(currentUrl.contains("student1.jsp")){	
%>	<li><a href="courseregistration.jsp">Course Registration</a></li>
		   <%}%>
	<li><a href="logout.jsp">Logout</a></li>
	<%
    }	  
%>
		
      <li><a href="http://www.auburn.edu/main/welcome">Homepage</a></li>
          </ul>
    <div>
	<% if(currentUrl.contains("faculty.jsp")) {%>
      <h1><a href="faculty.jsp">Auburn Campus Management System</a></h1>
	<%} 
	 else if(currentUrl.contains("student1.jsp")) {%>
		 <h1><a href="student1.jsp">Auburn Campus Management System</a></h1>
	 <%}	 
	 else if(currentUrl.contains("aboutus.jsp") && request.getHeader("referer").contains("student1.jsp")){%>
		 <h1><a href="student1.jsp">Auburn Campus Management System</a></h1>
	 <%}else{%>
			<h1><a href="index.jsp">Auburn Campus Management System</a></h1>
	 <%}%>
      </div>
    <br class="clear" />
  </div>
</div>
</body>