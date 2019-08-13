package registerserver;

import java.io.IOException;


import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class registerserver
 */
@WebServlet("/registerserver")
public class registerserver extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public registerserver() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		   // JDBC driver name and database URL
		   String JDBC_DRIVER = "com.mysql.jdbc.Driver";  
		   String DB_URL = "jdbc:mysql://localhost:3306/user";

		   //  Database credentials
		   String USER = "root";
		   String PASS = "Zxw981010ggh";
		   
		   Connection conn = null;
		   Statement stmt = null;
		   ResultSet rs = null;
		   PreparedStatement ps = null;
		   try{
		      //STEP 2: Register JDBC driver
		      Class.forName("com.mysql.jdbc.Driver");
		      
		      HttpSession session = request.getSession(true);
		      
		      //STEP 3: Open a connection
		      System.out.println("Connecting to a selected database...");
		      conn = DriverManager.getConnection(DB_URL, USER, PASS);
		      System.out.println("Connected database successfully...");
		      
		      //STEP 4: Execute a query
		      System.out.println("Inserting records into the table...");
		      stmt = conn.createStatement();
		      
		      boolean ok = true;
		      String uname = (String)request.getParameter("username").trim();
		      String pw1 = (String)request.getParameter("pw1").trim();
		      String pw2 = (String)request.getParameter("pw2").trim();
		      
		      String nextPage = "/register.jsp";
		      if (!pw1.contentEquals(pw2))
		      {
		    	  ok = false;
		    	  request.setAttribute("error", "pwissue");
		      }
		      String s = "SELECT * FROM info WHERE username='"+uname+"';";
		      
		      if (ok)
		      {
			      ps = conn.prepareStatement(s);
			      rs = ps.executeQuery();
			      while (rs.next())
			      {
			    	  	request.setAttribute("error", "unissue");
						//String un = rs.getString("username");
						//String pw = rs.getString("passkey");
						ok = false;
						break;
			      }
		      }
		      
		      if (ok)
		      {
		    	  nextPage = "/index.jsp";
		    	  session.setAttribute("currentUser",uname);
			      String sql = "INSERT INTO info (username , passkey )" +
			                   "VALUES ( '" + uname +"'," + pw1 + ");";
			      System.out.println(sql);
			      stmt.executeUpdate(sql);
			      System.out.println("Inserted records into the table...");
		      }
		      else
		      {
		    	  System.out.println(",");
		      }
		  	RequestDispatcher dispatch = getServletContext().getRequestDispatcher(nextPage);
			dispatch.forward(request, response);
		      

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
		
	}
}



