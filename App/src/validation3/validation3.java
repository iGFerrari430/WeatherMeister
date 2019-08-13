package validation3;

import java.io.IOException;


import java.io.PrintWriter;
import java.util.ArrayList;
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
import com.example.util;
/**
 * Servlet implementation class validation3
 */
@WebServlet("/validation3")
public class validation3 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public validation3() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		response.setContentType("text/html");
		String choice = (String)request.getParameter("choice");
		util u = new util();
		
		//System.out.println("choice: " + choice);
		HttpSession session = request.getSession(true);
		ArrayList<ArrayList<Example>> sortedData = (ArrayList<ArrayList<Example>>)session.getAttribute("sortedData");

		int index = 0;
		if (choice.equals("v0"))
		{
			index = 0;
		}
		else if (choice.equals("v1"))
		{
			index = 1;
		}
		else if (choice.equals("v2"))
		{
			index = 2;
		}
		else if (choice.equals("v3"))
		{
			index = 3;
		}
		else if (choice.contentEquals("v4"))
		{
			index = 4;
		}
		else if (choice.contentEquals("v5"))
		{
			index = 5;
		}
		System.out.println(choice);
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		
		//
		
		// begin printing
		out.println("<table>");
		out.println("<tr>");
		out.println("<th>City Name</th>");
		out.println("<th>Temp.low</th>");
		out.println("<th>Temp.High</th>");
		out.println("</tr>");
		ArrayList<Example> temp = sortedData.get(index);
		for (int i=0; i<temp.size(); i++)
		{
			String displayName = temp.get(i).name;
			displayName += " ";
			displayName += temp.get(i).sys.country;
			out.println("<tr>");
			out.println("<td><button class='DIANG' id='"+Integer.toString(temp.get(i).id)+"' onclick='loadCity(this.id)' name='city' type='submit' value='"+temp.get(i).name+"'>"+displayName+"</button></td>");
			out.println("<td>"+u.toF(temp.get(i).main.tempMin)+"</td>");
			out.println("<td>"+u.toF(temp.get(i).main.tempMax)+"</td>");
			out.println("</tr>");
			
		}
		int left = 16 - (int)temp.size();
		for (int i=0; i<left; i++)
		{
			out.println("<tr>");
			out.println("<td></td>");
			out.println("<td></td>");
			out.println("<td></td>");
			out.println("</tr>");
		}
		out.println("</table>");
		
	}
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
