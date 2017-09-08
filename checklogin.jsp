<%@include file="DBConnection.jsp" %>
<%@ page import="java.io.*" session="true" %>
<%@ page import="java.sql.*" %>
<%

try{
	
	DBConnection db = new DBConnection();
	String user = request.getParameter("user");
	String pwd = request.getParameter("pwd");
	String ltype = request.getParameter("ltype");
	
	String q = "select * from login where type = '"+ ltype+"'";
	
	ResultSet rs = db.getData(q);
	
	while(rs.next()){
		if(user.equals(rs.getString("usernm")) && pwd.equals(rs.getString("pwd"))){
			session.setAttribute("who",user);
			session.setAttribute("type",ltype);
			break;
		}
	}


	
	if(rs.isAfterLast()){
		out.println("Invalid Username/Password");
	}
	
}catch(Exception e){
	out.println(e);
}
%>