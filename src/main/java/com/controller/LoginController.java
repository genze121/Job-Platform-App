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
 * Servlet implementation class LoginController
 */
@WebServlet("/login")
public class LoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private UserDAOIMPL userDAOIMPL = null;

	public LoginController() {
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

		if (username.equalsIgnoreCase("admin@gmail.com") && password.equalsIgnoreCase("admin")) {
			UserModel userAdmin = new UserModel();
			userAdmin.setName("Admin");
			session.setAttribute("userAdmin", userAdmin);
			response.sendRedirect("admin/adminhome.jsp");
		} else {
			String encrypted = passwordEncDec.encode(password, secret);

			UserModel userModel = userDAOIMPL.loginUsers(username, encrypted);

			passwordEncDec.decode(encrypted, secret);

			if (userModel != null) {
				session.setAttribute("userModel", userModel);
				response.sendRedirect("home.jsp");
			} else {
				session.setAttribute("errorMessage", "Username or Password is incorrect....");
				response.sendRedirect("login.jsp");
			}

		}

	}

}
