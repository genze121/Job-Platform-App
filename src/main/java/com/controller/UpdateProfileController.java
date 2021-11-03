package com.controller;

import java.io.File;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.helper.PasswordEncDec;
import com.model.UserModel;
import com.serviceimpl.UserDAOIMPL;

/**
 * Servlet implementation class UpdateProfileController
 */
@WebServlet("/updateProfile")
@MultipartConfig
public class UpdateProfileController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private UserDAOIMPL userDAOIMPL;

	public UpdateProfileController() {
		super();
		userDAOIMPL = new UserDAOIMPL();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String secret = "secrete";

		PasswordEncDec passwordEncDec = new PasswordEncDec();

		HttpSession session = request.getSession();

		int id = Integer.parseInt(request.getParameter("Id"));
		String name = request.getParameter("name");
		String username = request.getParameter("username");
		Part part = request.getPart("user_profile");
		String userProfile = part.getSubmittedFileName();
		String password = request.getParameter("password");

		String encryptedPass = passwordEncDec.encode(password, secret);

		UserModel userModel = (UserModel) session.getAttribute("userModel");
		userModel.setId(id);
		userModel.setName(name);
		userModel.setUsername(username);
		userModel.setUserImage(userProfile);
		userModel.setPassword(encryptedPass);

		boolean finalCheck = userDAOIMPL.checkPassword(id, encryptedPass);

		if (finalCheck) {
			boolean finalUpdated = userDAOIMPL.updateProfile(userModel);
			passwordEncDec.decode(encryptedPass, secret);
			if (finalUpdated) {
				String path = getServletContext().getRealPath("") + "images/user_profile";
				File file = new File(path);
				part.write(file + File.separator + userProfile);
				System.out.println(file);
				session.setAttribute("successMessage", "User updated successfully.....");
				response.sendRedirect("index.jsp");
			} else {
				session.setAttribute("errorMessage", "Something went worng.Please try again.....");
				response.sendRedirect("editProfile.jsp");
			}
		} else {
			session.setAttribute("errorMessage", "You have entered wrong password.....");
			response.sendRedirect("editProfile.jsp");
		}
	}

}
