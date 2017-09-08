<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@include file="DBConnection.jsp" %>
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="EN" lang="EN" dir="ltr">
<head profile="http://gmpg.org/xfn/11">
<title>Faculty</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<meta http-equiv="imagetoolbar" content="no" />
<link rel="stylesheet" href="Styles/layout.css" type="text/css" />
<%
    if ((session.getAttribute("user_name") == null) || (session.getAttribute("user_name") == "")) {
		out.println("Please login");
		response.sendRedirect("login.jsp");
	}
%>


</head>
<jsp:include page="include/top.jsp"></jsp:include>
<div class="wrapper col2"></div>
<div class="wrapper col4">
  <div id="container">
    <div id="content">
      <h1>&nbsp;</h1>
      <p>&nbsp;</p>
<h2>&nbsp;</h2>

   
      <table summary="Summary Here" cellpadding="0" cellspacing="0">
        <thead>
          <tr>
            <th colspan="4">Welcome &nbsp;<%=session.getAttribute("user_name")%></th>
            
          </tr>
        </thead>
        <tbody>
        
       <tr class="dark">
       <form action="" method="post">
       <td colspan="4"><center>
	   <input type="submit" value="Courses" name="faculty" />
       <input type="submit" value="Assignments" name="faculty" />
	   <input type="submit" value="Student Progress" name="faculty" />
       
       </center>
       </td>
       </form>
       </tr>
       <% try{
		   String check = request.getParameter("faculty");
		   if(check!=null){
			   
			   if(check.equals("Courses")){
				  try
	{
		Class.forName("com.mysql.jdbc.Driver").newInstance(); 
		String url = "jdbc:mysql://localhost:3306/acms";
		String db_pwd = "";
		String db_uname = "root";
		java.sql.Connection con = DriverManager.getConnection(url,db_uname,db_pwd); 
		Statement st= con.createStatement();
Statement st1= con.createStatement();		
		ResultSet rs;
		ResultSet rs1;
		String fuser=(String)session.getAttribute("user_name");
		String firstQuery="select freg_id from fregistration where fuser_name='"+fuser+"'";
		rs=st.executeQuery(firstQuery);
		int s_id=0;
		if(rs.next())
		{
			s_id=rs.getInt(1);
		}
		String flname_query="select ffirst_name,flast_name from fregistration where freg_id='"+s_id+"'";
		String fname="";
		String lname="";
		rs=st.executeQuery(flname_query);
		if(rs.next())
		{
			fname=rs.getString(1);
			lname=rs.getString(2);
		}
		String queryString="select * from courses where instructor_id="+s_id;
		rs=st.executeQuery(queryString);
		int stu_id=0;
	%>
    	<tr class="light">
        <td colspan="2">
        Instructor Name
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
        <th>Student Name</th>
        </thead>
		<tbody>
<%
while(rs.next()){
String course_id=rs.getString("course_id");
String course_name=rs.getString("course_name");
String dpt=rs.getString("department");
stu_id=rs.getInt(6);
String str_query="select sfirst_name,slast_name from sregistration where sreg_id="+stu_id;
rs1=st1.executeQuery(str_query);
String stu_fname="";
String stu_lname="";
if(rs1.next())
{

	stu_fname=rs1.getString("sfirst_name");
	stu_lname=rs1.getString("slast_name");
}
  %>
		<tr class="light">
        <td><%=course_id%></td>
        <td><%=course_name%></td>
        <td><%=dpt %></td>
        <td><%=stu_fname%>&nbsp;<%=stu_lname%></td>
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
			   if(check.equals("Assignments")){
				   %>
                   	<tr class="light">
            <td colspan="2"><a href="XML_Assignment2_Instructions.docx">Assignment1</a></td>
            <td colspan="2"><a href="XML_Assignment3_Instructions.docx">Assignment2</a></td>
            
            
            </tr>
            

				   <%
			   }
			   if(check.equals("Student Progress")){
				   %>
                   <tr class="light">
            <td colspan="2"><a href="graph.html">Assignment1 Progress</a></td>
            
			
			
			
			
			<td colspan="2"><a href="graph2.html">Assignment2 Progress</a></td>
            </tr>
            

				   <%
			   }
		   }
	   }catch(Exception e){
	   }%>
          
       </tbody>
      </table>

     <div id="comments">
        <h2>&nbsp;</h2>
      </div>
      <div id="respond">
        <form action="#" method="post">
</form>

      <jsp:include page="include/bottom.jsp"></jsp:include>
