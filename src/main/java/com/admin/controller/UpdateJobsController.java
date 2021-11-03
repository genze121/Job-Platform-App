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

@WebServlet("/updateJobs")
public class UpdateJobsController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private JobDAOIMPL jobDAOIMPL;

	public UpdateJobsController() {
		super();
		jobDAOIMPL = new JobDAOIMPL();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		int jobId = Integer.parseInt(request.getParameter("jobId"));
		String title = request.getParameter("title");
		String location = request.getParameter("location");
		String category = request.getParameter("category");
		String status = request.getParameter("status");
		String description = request.getParameter("description");

		JobModel jobModel = new JobModel();
		jobModel.setId(jobId);
		jobModel.setTitle(title);
		jobModel.setLocation(location);
		jobModel.setCategory(category);
		jobModel.setStatus(status);
		jobModel.setDescription(description);

		boolean updatedJobs = jobDAOIMPL.updateJobs(jobModel);

		HttpSession session = request.getSession();

		if (updatedJobs) {
			session.setAttribute("successMessage", "Job Updated Successfully......");
			response.sendRedirect("admin/viewJobs.jsp");
		} else {
			session.setAttribute("errorMessage", "Something went wrong.Please try again.....");
			response.sendRedirect("admin/editJobs.jsp?JobId=" + jobId);
		}

	}

}
