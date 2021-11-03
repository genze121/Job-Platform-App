package com.admin.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.model.JobModel;
import com.serviceimpl.JobDAOIMPL;

@WebServlet("/postJobs")
public class PostJobsController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private JobDAOIMPL jobDAOIMPL;

	public PostJobsController() {
		super();
		jobDAOIMPL = new JobDAOIMPL();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String title = request.getParameter("title");
		String location = request.getParameter("location");
		String category = request.getParameter("category");
		String status = request.getParameter("status");
		String description = request.getParameter("description");

		JobModel jobModel = new JobModel();
		jobModel.setTitle(title);
		jobModel.setLocation(location);
		jobModel.setCategory(category);
		jobModel.setStatus(status);
		jobModel.setDescription(description);

		boolean finalJobsPosted = jobDAOIMPL.postJobs(jobModel);

		HttpSession session = request.getSession();

		if (finalJobsPosted) {
			session.setAttribute("successMessage", "Job Posted Successfully......");
			response.sendRedirect("admin/postJobs.jsp");
		} else {
			session.setAttribute("errorMessage", "Something went wrong.Please try again.....");
			response.sendRedirect("admin/postJobs.jsp");
		}

	}

}
