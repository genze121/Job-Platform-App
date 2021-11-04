package com.controller;

import java.io.IOException;
import java.util.Random;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.model.ApplyJobModel;
import com.serviceimpl.JobDAOIMPL;

@WebServlet("/apply")
public class ApplyJobsController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private JobDAOIMPL jobDAOIMPL = null;

	public ApplyJobsController() {
		super();
		jobDAOIMPL = new JobDAOIMPL();

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		Random random = new Random();

		int id = Integer.parseInt(request.getParameter("jobId"));
		String applyId = "JOB-APP-00" + random.nextInt(1000);
		String title = request.getParameter("title");
		String location = request.getParameter("location");
		String category = request.getParameter("category");
		String username = request.getParameter("username");

		ApplyJobModel applyJobModel = new ApplyJobModel();
		applyJobModel.setId(id);
		applyJobModel.setApply_id(applyId);
		applyJobModel.setTitle(title);
		applyJobModel.setLocation(location);
		applyJobModel.setCategory(category);
		applyJobModel.setUsername(username);

		HttpSession session = request.getSession();

		boolean appliedJobs = jobDAOIMPL.applyJobs(applyJobModel);

		if (appliedJobs) {
			session.setAttribute("successMessage", "Job applied successfully.....");
			response.sendRedirect("userView.jsp");
		} else {
			session.setAttribute("errorMessage", "Something went wrong.Please try again....");
			response.sendRedirect("userView.jsp");
		}

	}

}
