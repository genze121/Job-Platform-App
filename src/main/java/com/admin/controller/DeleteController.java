package com.admin.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.serviceimpl.JobDAOIMPL;

@WebServlet("/deleteJobs")
public class DeleteController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private JobDAOIMPL jobDAOIMPL;

	public DeleteController() {
		super();
		jobDAOIMPL = new JobDAOIMPL();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		int jobId = Integer.parseInt(request.getParameter("jobId"));

		boolean finalDeleteJobs = jobDAOIMPL.deleteJobs(jobId);

		HttpSession session = request.getSession();

		if (finalDeleteJobs) {
			session.setAttribute("successMessage", "Job Details Deleted Successfully.....");
			response.sendRedirect("admin/viewJobs.jsp");
		} else {
			session.setAttribute("errorMessage", "Something went wrong.Please try again.....");
			response.sendRedirect("admin/viewJobs.jsp");
		}
	}

}
