<%@page import="com.model.JobModel"%>
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

<%@include file="allComponents/all_Components.jsp"%>
<title>Online Job Portal</title>
<style type="text/css">
.card {
	box-shadow: 5px 10px 10px 5px rgba(0, 0, 0, 0.4);
	border: 2px solid red;
}
</style>
</head>
<body
	style="background: background-color: #e7eff9; background-image: linear-gradient(315deg, #e7eff9 0%, #cfd6e6 74%);">
	<%@include file="allComponents/navbar.jsp"%>

	<%
	String error = (String) session.getAttribute("errorMessage");

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
			<div class="col-md-12">

				<%
				int JobId = Integer.parseInt(request.getParameter("jobId"));
				JobDAOIMPL jobDAOIMPL = new JobDAOIMPL();
				JobModel jobModel = jobDAOIMPL.getJobsById(JobId);
				%>

				<div class="card mt-5">
					<div class="card-body">

						<h3><%=jobModel.getTitle()%></h3>

						<p class="mt-3"><%=jobModel.getDescription()%></p>


						<div class="form-row">
							<div class="col-md-4">
								<input type="text" class="form-control"
									value="Location :- <%=jobModel.getLocation()%>"
									readonly="readonly">
							</div>

							<div class="col-md-4">
								<input type="text" class="form-control"
									value="Category :- <%=jobModel.getCategory()%>"
									readonly="readonly">
							</div>

						</div>

						<h4 class="mt-3">
							Published Date :-
							<%=jobModel.getPublishDate().toString()%></h4>

						<div class="text-center mt-3">
							<a href="userView.jsp" class="btn btn-success">Home</a>
						</div>

					</div>
				</div>
			</div>
		</div>
	</div>

	<%@include file="allComponents/footer.jsp"%>

</body>
</html>