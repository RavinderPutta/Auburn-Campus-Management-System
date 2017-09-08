<%@ page import="java.io.*" %>
 
<HTML>
<HEAD>
<TITLE>Registration Form</TITLE>
</HEAD>
<BODY>

<%
try {
             
			String strusername = request.getParameter("regusername");
            String strpassword = request.getParameter("regpassword"); 	
            String strrepassword = request.getParameter("regrepassword"); 
           			

            if( (!strusername.equals("")) && (!strpassword.equals("")) && (!strrepassword.equals("")) && (strpassword.equals(strrepassword))  )
		 	{	
                  
				String fileName = application.getRealPath("/")+"users.txt";
				BufferedWriter bw = new BufferedWriter(new FileWriter(fileName, true));
		
				String str=strusername+"@"+strpassword;
				bw.write(str);
				bw.newLine(); 
				bw.close();
                
                session.setAttribute("regSuccess","success");
				session.setAttribute("regUser",(String) request.getParameter("regusername"));
				response.sendRedirect("login.jsp");
            }
            else
            {
			         response.sendRedirect("register.jsp");
			}
			} catch (IOException e) {
                    out.println("Exception"+e);
			}


%>


</BODY>
</HTML>
