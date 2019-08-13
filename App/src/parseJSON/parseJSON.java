package parseJSON;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.example.Clouds;
import com.example.Coord;
import com.example.Example;
import com.example.Main;
import com.example.Rain;
import com.example.Sys;
import com.example.Weather;
import com.example.Wind;
import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;

/**
 * Servlet implementation class parseJSON
 */
@WebServlet("/parseJSON")
public class parseJSON extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public parseJSON() {
        super();
        // TODO Auto-generated constructor stub
    }
    public void sendDB(String user, String history)
    {
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
		      
		      //STEP 3: Open a connection
		      System.out.println("Connecting to a selected database...");
		      conn = DriverManager.getConnection(DB_URL, USER, PASS);
		      System.out.println("Connected database successfully...");
		      
		      //STEP 4: Execute a query
		      System.out.println("Inserting records into the table...");
		      stmt = conn.createStatement();
			  String sql = "INSERT INTO hist ( record , username )" +
			                   "VALUES ( '" + history +"', '" + user + "');";
			      System.out.println(sql);
			      stmt.executeUpdate(sql);
			      System.out.println("Inserted records into the table...");


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
    public ArrayList<Example> sortLetter(ArrayList<Example> data)
    {
    	ArrayList<Example> temp = (ArrayList<Example>) data.clone();
    	for (int i=temp.size()-1; i>0; i--)
    	{
    		for (int j=0; j<i; j++)
    		{
    			char cj = temp.get(j).name.toLowerCase().charAt(0);
    			char cj1 = temp.get(j+1).name.toLowerCase().charAt(0);
    			if (cj > cj1)
    			{
    				Collections.swap(temp,j,j+1);
    			}
    		}
    	}

    	
    	
    	return temp;
    }
    
    
    
    public ArrayList<Example> sorttempLow(ArrayList<Example> data)
    {
    	ArrayList<Example> temp = (ArrayList<Example>) data.clone();
    	for (int i=temp.size()-1; i>0; i--)
    	{
    		for (int j=0; j<i; j++)
    		{
    			double cj = temp.get(j).main.tempMin;
    			double cj1 = temp.get(j+1).main.tempMin;
    			if (cj > cj1)
    			{
    				Collections.swap(temp,j,j+1);
    			}
    		}
    	}

    	
    	
    	
    	return temp;
    }
    
    
    public ArrayList<Example> sorttempHigh(ArrayList<Example> data)
    {
    	ArrayList<Example> temp = (ArrayList<Example>) data.clone();
    	for (int i=temp.size()-1; i>0; i--)
    	{
    		for (int j=0; j<i; j++)
    		{
    			double cj = temp.get(j).main.tempMax;
    			double cj1 = temp.get(j+1).main.tempMax;
    			if (cj > cj1)
    			{
    				Collections.swap(temp,j,j+1);
    			}
    		}
    	}
    	
    	
    	
    	return temp;
    }
    
    public void print(ArrayList<Example> temp)
    {
    	System.out.println("---------printing the list------------");
    	for (int i=0; i<temp.size(); i++)
    	{
    		System.out.println(temp.get(i).name);
    	}
    	System.out.println("*********************");
    }

    public ArrayList<Example> reverse(ArrayList<Example> data)
    {
    	ArrayList<Example> temp = new ArrayList<Example>();
    	for (int i=(data.size()-1); i>=0; i--)
    	{
    		temp.add(data.get(i));
    	}
    	
    	return temp;
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
		String json = request.getParameter("info");
		HttpSession session = request.getSession();
		session.setAttribute("info",json);
		System.out.println("dsa");
		System.out.println(json);
		
		Gson gson = new Gson();
		List<Example> list1 = gson.fromJson(json, new TypeToken<List<Example>>(){}.getType());
		ArrayList<Example> data = new ArrayList<Example>(list1);
		for (int i=0; i<data.size(); i++)
		{
			Example e = data.get(i);
			System.out.println("Name: "+e.name+" id:"+e.id);
		}
		
		session.setAttribute("data",data);
		/*********do the pre-sorting work************/
		ArrayList<ArrayList<Example>> sortedData = new ArrayList<ArrayList<Example>>();
		
		ArrayList<Example> d0 = sortLetter(data);
		
		ArrayList<Example> d1 = reverse(d0);
		sortedData.add(d0);
		sortedData.add(d1);
		
		
		ArrayList<Example> d2 = sorttempLow(data);
		ArrayList<Example> d3 = reverse(d2);
		sortedData.add(d2);
		sortedData.add(d3);

		ArrayList<Example> d4 = sorttempHigh(data);
		ArrayList<Example> d5 = reverse(d4);
		sortedData.add(d4);
		sortedData.add(d5);
		
		session.setAttribute("sortedData", sortedData);
		session.setAttribute("sortIndex", "0");
		String currentUser = (String)session.getAttribute("currentUser");
		if (currentUser != null)
		{
			String history = (String)request.getParameter("history");
			sendDB(currentUser,history);
		}
	}

}
