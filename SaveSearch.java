package com.flyaway;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class SaveSearch
 */
@WebServlet("/SaveSearch")
public class SaveSearch extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SaveSearch() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String source=request.getParameter("src");
		String destination=request.getParameter("dest");
		String date_of_travel=request.getParameter("dot");
		int number_of_pass=Integer.parseInt(request.getParameter("noofpax"));
		HttpSession session=request.getSession();
		session.setAttribute("source", source);
		session.setAttribute("date_of_travel", date_of_travel);
		session.setAttribute("destination", destination);
		session.setAttribute("number_of_pass", number_of_pass);
		if(source.equals(destination)) {
			
			
			request.setAttribute("Error","The Source and Destination Locations cannot be the same");
			RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
			rd.include(request, response);
			}
		else 
		{
			session.setAttribute("SourceLocation", source);
			response.sendRedirect("register.jsp");
			
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
