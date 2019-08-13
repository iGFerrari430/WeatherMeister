<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.sql.Connection" %>
    <%@ page import="java.sql.DriverManager" %>
    <%@ page import="java.sql.PreparedStatement" %>
    <%@ page import="java.sql.ResultSet" %>
    <%@ page import="java.sql.SQLException" %>
    <%@ page import="java.sql.Statement" %>
    <%@ page import="java.util.ArrayList" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="style.css" />
<style>
	#outBox{
		overflow:scroll;
		margin-top:10%;
		text-align:center;
	}
	#inBox{
				background-color:rgba(128,128,128,0.8);
		border-radius:10px;
		border:1px solid white;
		margin-left:auto;
		margin-right:auto;
		overflow:scroll;
		width:300px;
		height:400px;
	}
	tr{
		width:300px;
		height:30px;
	}
	td,th{
		height:30px;
		border-bottom: 1px solid white;
		text-align:center;
}
	#table1
	{
		margin:0px;
		width:300px;
		overflow:scroll;
		margin-right: 100px;
	}
</style>
</head>
<%
	String JDBC_DRIVER = "com.mysql.jdbc.Driver";  
	String DB_URL = "jdbc:mysql://localhost:3306/user";
	
	//  Database credentials
	String USER = "root";
	String PASS = "Zxw981010ggh";
	
	Connection conn = null;
	Statement stmt = null;
	ResultSet rs = null;
	PreparedStatement ps = null;
	 String uname = (String)session.getAttribute("currentUser");
	 ArrayList<String> userData = new ArrayList();
	try{
	   //STEP 2: Register JDBC driver
	   Class.forName("com.mysql.jdbc.Driver");
	   
	   
	   //STEP 3: Open a connection
	   System.out.println("Connecting to a selected database...");
	   conn = DriverManager.getConnection(DB_URL, USER, PASS);
	   System.out.println("Connected database successfully...");
	   
	   //STEP 4: Execute a query
	   System.out.println("Inserting records into the table...");
	   stmt = conn.createStatement();

	  

	   
	   String s = "SELECT * FROM hist WHERE username='"+uname+"';";
		  ps = conn.prepareStatement(s);
		  rs = ps.executeQuery();
		  while (rs.next())
		  {
	
			  String un = rs.getString("record");
			  String pw = rs.getString("username");
			  userData.add(un);
		  }
	   
	
	}catch(SQLException se){
	   //Handle errors for JDBC
	   se.printStackTrace();
	}catch(Exception e){
	   //Handle errors for Class.forName
	   e.printStackTrace();
	}finally{
	   //finally block used to close resources
	   try{
	      if(stmt!=null)
	      {
	         conn.close();
	      }
	      if (rs != null)
	      {
	     	 rs.close();
	      }
	      if (ps != null)
	      {
	     	 ps.close();
	      }
	      if (stmt != null)
	      {
	     	 stmt.close();
	      }
	      
	   }catch(SQLException se){
	
	   }
	
	}//end try
	System.out.println("Goodbye!");
			
	String currentUser = (String)session.getAttribute("currentUser");
%>
<body>
		<div class="top-bar"><a style="font-family: Savoye; margin: 0px; position: relative; bottom:11px;" href="index.jsp">WeatherMeister</a>
<% if (currentUser == null) {%>
	<div class="login"><a href="login.jsp">login</a></div>
	<div class="register"><a href="register.jsp">register</a></div>
<% }else{%>
	<div class="register"><a href="HandleSignout.jsp">Sign Out</a></div>
	<div class="register"><a href="getHistory.jsp">View Profile</a></div>
<%}%>
	<div class="clear"></div>
</div>
		<div id="outBox">
		<p style="font-size: 40px; margin:3px;"><%=uname %>'s Search History</p>
		<div id="inBox">
		<table id="table1" >
			<%
				for (int i=0; i<userData.size(); i++)
				{
					out.println("<tr><td>"+userData.get(i)+"</td></tr>");
				}
				int remain = 16 - userData.size();
				for (int i=0; i<remain; i++)
				{
					out.println("<tr><td></td></tr>");
				}
			%>
		</table>
		</div>
		</div>
</body>
</html>