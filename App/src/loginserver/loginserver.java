package loginserver;

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
 * Servlet implementation class loginserver
 */
@WebServlet("/loginserver")
public class loginserver extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public loginserver() {
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
		      
		      boolean ok = false;
		      String uname = (String)request.getParameter("username").trim();
		      String password = (String)request.getParameter("password").trim();
		      String error = "";
		      String nextPage = "/login.jsp";
		      
		      String s = "SELECT * FROM info WHERE username='"+uname+"';";
			  ps = conn.prepareStatement(s);
			  rs = ps.executeQuery();
			  if (rs.next())
			  {

				  String un = rs.getString("username");
				  String pw = rs.getString("passkey");
				  if (password.contentEquals(pw))
				  {
					  ok = true;
				  }
				  else
				  {
					  error = "Incorrect password";
				  }
			  }
			  else
			  {
				  error = "This user does not exist";
			  }
		      
		      if (ok)
		      {
		    	  nextPage = "/index.jsp";
		    	  session.setAttribute("currentUser",uname);
		      }
		      else
		      {
		    	  nextPage = "/login.jsp";
		    	  request.setAttribute("error",error);
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
