package com.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.helper.PasswordEncDec;
import com.serviceimpl.UserDAOIMPL;

/**
 * Servlet implementation class ForgotPasswordController
 */
@WebServlet("/forgot")
public class ForgotPasswordController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private UserDAOIMPL userDAOIMPL = null;

	public ForgotPasswordController() {
		super();
		userDAOIMPL = new UserDAOIMPL();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String secret = "secrete";
		PasswordEncDec passwordEncDec = new PasswordEncDec();

		HttpSession session = request.getSession();

		String username = request.getParameter("username");
		String password = request.getParameter("password");

		String encryptedPass = passwordEncDec.encode(password, secret);

		boolean updatedPass = userDAOIMPL.forgotPassword(encryptedPass, username);

		passwordEncDec.decode(encryptedPass, secret);

		if (updatedPass) {
			session.setAttribute("successMessage", "Password changed successfully....");
			response.sendRedirect("forgotPassword.jsp");
		} else {
			session.setAttribute("errorMessage", "Password changed failed due to some issue.Please rectify it...");
			response.sendRedirect("forgotPassword.jsp");
		}
	}

}
