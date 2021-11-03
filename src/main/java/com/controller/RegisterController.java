package com.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.helper.PasswordEncDec;
import com.model.UserModel;
import com.serviceimpl.UserDAOIMPL;

/**
 * Servlet implementation class RegisterController
 */
@WebServlet("/registerUser")
public class RegisterController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private UserDAOIMPL userDAOIMPL = null;

	public RegisterController() {
		super();
		userDAOIMPL = new UserDAOIMPL();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String checkingBox = request.getParameter("checkbox");

		String secret = "secrete";

		PasswordEncDec passwordEncDec = new PasswordEncDec();

		HttpSession session = request.getSession();
		if (checkingBox == null) {
			session.setAttribute("checkbox", "Please check the box to proceed further.....");
			response.sendRedirect("register");
		} else {
			String name = request.getParameter("name");
			String username = request.getParameter("username");
			String password = request.getParameter("password");

			String encryptedPassword = passwordEncDec.encode(password, secret);

			UserModel userModel = new UserModel();
			userModel.setName(name);
			userModel.setUsername(username);
			userModel.setPassword(encryptedPassword);

			boolean finalUniqueUser = userDAOIMPL.uniqueUsers(username);

			if (finalUniqueUser) {
				boolean finalRegistration = userDAOIMPL.registerUsers(userModel);
				if (finalRegistration) {
					session.setAttribute("successMessage", "User is registered successfully.....");
					response.sendRedirect("register");
				} else {
					session.setAttribute("errorMessage", "Something went wrong.Please try again....");
					response.sendRedirect("register");
				}
			} else {
				session.setAttribute("errorMessage", "User already exists.Please try with new user....");
				response.sendRedirect("register");
			}
		}

	}

}
