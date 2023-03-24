package com.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.Element.Operation.StudentOperation;

/**
 * Servlet implementation class Delete
 */
@WebServlet("/Delete")
public class Delete extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Delete() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String eno = request.getParameter("stdroll");
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		
		StudentOperation stdop = new StudentOperation();
		
		String res = stdop.Deletestd(Integer.parseInt(eno));
		
		if(res.equals("Success"))
			response.sendRedirect("AddStudent.jsp");
		else
			response.sendRedirect("AdminDashboard.jsp");
		
	}

}
