<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
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
<body>
	<%@include file="allComponents/navbar.jsp"%>

	<div class="container">
		<div class="row">
			<div class="col-md-12">

				<%
				String Location = request.getParameter("location");
				String Category = request.getParameter("category");

				JobDAOIMPL jobDAOIMPL = new JobDAOIMPL();
				List<JobModel> lists = null;
				String message = "";

				if ("loc".equals(Location) && "cat".equals(Category)) {
					lists = new ArrayList<>();
					message = "Job is not available";
				} else if ("loc".equals(Location) || "cat".equals(Category)) {
					lists = jobDAOIMPL.getJobsByLocationOrCategory(Category, Location);
				} else {
					lists = jobDAOIMPL.getJobsByLocationAndCategory(Category, Location);
				}

				if (lists != null) {
				for (JobModel jobModel : lists) {
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
							<a href="home.jsp" class="btn btn-success">Home</a>
						</div>

					</div>
				</div>
				<%
				}
				} else {
				%>
				<div class="text-center">
					<h2 class="text-danger">Job is not available</h2>
				</div>
				<%
				}
				
				if (lists.isEmpty()) {
					%>
				<div class="text-center mt-5">
					<h2 class="text-danger">Job is not available</h2>
				</div>
				<%
					}
				
				%>
			</div>
		</div>
	</div>

</body>
</html>