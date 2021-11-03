<%@page import="com.model.JobModel"%>
<%@page import="java.util.List"%>
<%@page import="com.serviceimpl.JobDAOIMPL"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<%@include file="all_Components.jsp"%>
<title>Online Job Portal</title>
<style type="text/css">
.card {
	box-shadow: 5px 10px 10px 5px rgba(0, 0, 0, 0.4);
}

.footer-view {
	left: 0;
	bottom: 0;
	width: 100%;
	background: #1460e3;
	position: relative;
}
</style>
</head>
<body
	style="background: background-color: #b3cdd1; background-image: linear-gradient(315deg, #b3cdd1 0%, #9fa4c4 74%);">
	<%@include file="navbar.jsp"%>

	<%
	String success = (String) session.getAttribute("successMessage");
	String error = (String) session.getAttribute("errorMessage");

	if (success != null) {
	%>
	<div class="alert alert-success alert-dismissible fade-show"
		role="alert">
		<strong><%=success%></strong>
		<button type="button" class="close" data-dismiss="alert"
			aria-label="Close">
			<span aria-hidden="true">&times;</span>
		</button>
	</div>
	<%
	}
	session.removeAttribute("successMessage");

	if (error != null) {
	%>
	<div class="alert alert-danger alert-dismissible fade-show"
		role="alert">
		<strong><%=error%></strong>
		<button type="button" class="close" data-dismiss="alert"
			aria-label="Close">
			<span aria-hidden="true">&times;</span>
		</button>
	</div>
	<%
	}
	session.removeAttribute("errorMessage");
	%>

	<div class="container">
		<div class="row">
			<div class="col-md-12 mt-3">

				<div class="text-center">
					<h3 class="post">
						<i class="fas fa-eye text-primary"></i> View Jobs
					</h3>
				</div>

				<%
				JobDAOIMPL jobDAOIMPL = new JobDAOIMPL();
				List<JobModel> listJobs = jobDAOIMPL.getAllJobs();
				for (JobModel jobModel : listJobs) {
				%>

				<div class="card mt-4">
					<div class="card-body">

						<h3><%=jobModel.getTitle()%></h3>

						<p class="mt-3"><%=jobModel.getDescription()%></p>


						<div class="form-row">
							<div class="col-md-4">
								<input type="text" class="form-control"
									value="<%=jobModel.getLocation()%>" readonly="readonly">
							</div>

							<div class="col-md-4">
								<input type="text" class="form-control"
									value="<%=jobModel.getCategory()%>" readonly="readonly">
							</div>

							<div class="col-md-4">
								<input type="text" class="form-control"
									value="<%=jobModel.getStatus()%>" readonly="readonly">
							</div>
						</div>

						<h4 class="mt-3">
							Published Date :-
							<%=jobModel.getPublishDate()%></h4>

						<div class="text-center mt-3">
							<a href="editJobs.jsp?jobId=<%=jobModel.getId()%>"
								class="btn btn-primary">Edit</a> <a
								href="../deleteJobs?jobId=<%=jobModel.getId()%>"
								class="btn btn-danger">Delete</a>
						</div>

					</div>
				</div>
				<%
				}
				%>

			</div>
		</div>
	</div>

	<div class="footer-view mt-5 p-2">
		<h3 class="text-center text-light">Copyright &copy; Designed and
			Developed By Tirtha Sharma</h3>
	</div>

</body>
</html>