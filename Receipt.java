package com.flyaway;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class Receipt
 */
@WebServlet("/Receipt")
public class Receipt extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Receipt() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();
		String dot=(String)session.getAttribute("date_of_travel");
		int nop=(int)session.getAttribute("number_of_pass");
		String email=(String)session.getAttribute("email");
		System.out.println(session.getAttribute("FlightNoFinal"));
		String fno=(String)session.getAttribute("FlightNoFinal");
		UserActions lp=new UserActions();
		lp.bookingOrderInsert(email, dot, Integer.parseInt(fno), nop);
		response.sendRedirect("Receipt1.jsp");
		//response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
