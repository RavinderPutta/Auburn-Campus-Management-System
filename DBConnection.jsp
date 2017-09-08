<%@page import="java.sql.*" %>

<%!
	public class DBConnection{
		
		Connection con;
		ResultSet rs = null;
		Statement st;
		
		public void setData(String str){
			try{
				Class.forName("com.mysql.jdbc.Driver");
				String url = "jdbc:mysql://localhost:3306/acms";
				String password = "";
				String username = "root";
				con = DriverManager.getConnection(url, username, password);
				st = con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_UPDATABLE);
				st= con.createStatement();
				st.execute(str);
			}catch(Exception e){
				
			}
		}
		
		public ResultSet getData(String str){
			try{
				Class.forName("com.mysql.jdbc.Driver");
				con = DriverManager.getConnection("jdbc:mysql://localhost/acms?user=root&password=");
				st = con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_UPDATABLE);
				st = con.createStatement();
				rs = st.executeQuery(str);	
			}catch(Exception e){
				
			}
			return rs;
		}
	}
%>