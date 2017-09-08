<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Untitled Document</title>
</head>

<body>

<%
try{
	
String sem = request.getParameter("sem");
if(sem!=null){

	int l = Integer.parseInt(sem);

out.println("<select name='semester' id='semester' onChange='showres()'>");	
out.println("<option>----Select-----</option>");
	if(l<=5){
			
		
		for(int i=1;i<=8;i++){
			out.println("<option value="+i+">"+i+"</option>");
		}
		
	}
	if(l>5){
		
		for(int i=1;i<=6;i++){
			out.println("<option value="+i+">"+i+"</option>");
		}
		
	}
	out.println("</select>");
}
String select = request.getParameter("select");
String mode = request.getParameter("mode");
if(select!=null && mode!=null){
	int l = Integer.parseInt(select);
	if(l<=5 && mode.equals("sf")){
		out.println("<tr id='light'>");
		out.println("<td colspan='2'><input type='text' name='fee' disabled='disabled'  value='40000' /></td>");
		out.println("</tr>");
	}
	if(l<=5 && mode.equals("g")){
		out.println("<tr id='light'>");
		out.println("<td colspan='2'><input type='text' name='fee' disabled='disabled' value='5000' /></td>");
		out.println("</tr>");
	}
	if(l<=5 && mode.equals("sg")){
		out.println("<tr id='light'>");
		out.println("<td colspan='2'><input type='text' name='fee' disabled='disabled' value='15000' /></td>");
		out.println("</tr>");
	}
	if(l>5 && mode.equals("sf")){
		out.println("<td colspan='2'><input type='text' name='fee' disabled='disabled' value='25000' /></td>");
	}
	if(l>5 && mode.equals("sg")){
		out.println("<td colspan='2'><input type='text' name='fee' disabled='disabled' value='5000' /></td>");
	}
	if(l>5 && mode.equals("g")){
		out.println("<td colspan='2'><input type='text' name='fee' disabled='disabled' value='1000' /></td>");		
	}
}
String str = request.getParameter("selected");
if(str!="null"){
	int i = Integer.parseInt(str);
	
	if(i<=5){
		
		out.println("<select id='batch' name='batch'>");
		out.println("<option selected='selected'>Select Batch</option>");
		for(int k=1989;k<2020;k++){
			int j = k + 4; 
			out.println("<option value="+k+">"+k+" - "+j+"</option>");
		}
		out.println("</select>");
	}
	else{
		out.println("<select id='batch'>");
		out.println("<option selected='selected'>Select Batch</option>");		
		for(int k=1989;k<2020;k++){
			int j = k + 3; 
			out.println("<option value="+k+">"+k+" - "+j+"</option>");
		}
		out.println("</select>");
	}
}
if(request.getParameter("stype").equals("roll_no")){

out.println("<select name='yr'>");
for(int i=1989;i<2020;i++){
	out.println("<option value="+i+">"+i+"</option>");
}
out.println("</select>");
out.println("<select id='branch' name='branch'>");
out.println("<option value='none' selected='selected'>-------------------Select-------------------</option>");
out.println("<optgroup label='Engineering'>");
out.println("<option value='ce'>Compter Engineering</option>");
out.println("<option value='it'>Information & Technology</option>");
out.println("<option value='mech'>Mechanical Engineering</option>");
out.println("<option value='ec'>Electrionics & Communication</option>");
out.println("<option value='bt'>BioTechnology</option>");
out.println("</optgroup>");
out.println("<optgroup label='Commerce'>");
out.println("<option value='bcom'>B.Com</option>");
out.println("<option value='bba'>BBA</option>");
out.println("<option value='bca'>BCA</option>");
out.println("</optgroup>");
out.println("</select>");

}
else{
	out.println("");
}
}catch(Exception e){
	
}
%>
</body>
</html>