package com.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class LogoutController
 */
@WebServlet("/logout")
public class LogoutController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public LogoutController() {
		super();

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		HttpSession session1 = request.getSession();
		session1.removeAttribute("userAdmin");
		
		HttpSession session2 = request.getSession();
		session2.removeAttribute("userModel");

		HttpSession session3 = request.getSession();
		session3.setAttribute("logoutMessage", "Logged out successfully.......");
		response.sendRedirect("login.jsp");

	}

}
