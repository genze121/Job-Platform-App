<%@page import="com.helper.Get25Words"%>
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
.sub-bt {
	margin-top: 31px;
}

.card {
	box-shadow: 5px 10px 10px 5px rgba(0, 0, 0, 0.5);
	border-radius: 8px;
	border: 2px solid red;
}

.footer-user {
	left: 0;
	bottom: 0;
	width: 100%;
	background: #1460e3;
	position: relative;
}
</style>
</head>
<body style="background: #c4bdbc;">
	<%@include file="allComponents/navbar.jsp"%>

	<div class="container">
		<div class="row">
			<div class="col-md-12">

				<div class="text-center mt-3">
					<h3 class="post">
						<i class="fas fa-eye text-primary"></i> View Jobs
					</h3>
				</div>

				<div class="card mt-3">
					<div class="card-body">

						<form action="moreViews.jsp" method="get">
							<div class="form-row">
								<div class="col-md-4">
									<label for="exampleInputCategory">Location</label> <select
										class="custom-select" name="location">
										<option selected value="loc">Choose...</option>
										<option value="Bangalore">Bangalore</option>
										<option value="West Bengal">West Bengal</option>
										<option value="Mumbai">Mumbai</option>
										<option value="Hyderabad">Hyderabad</option>
										<option value="Noida">Noida</option>
										<option value="Pune">Pune</option>
									</select>
								</div>

								<div class="col-md-4">
									<label for="exampleInputCategory">Category</label> <select
										class="custom-select" name="category">
										<option selected value="cat">Choose...</option>
										<option value="IT">IT</option>
										<option value="Developer">Developer</option>
										<option value="Banking">Banking</option>
										<option value="Engineer">Engineer</option>
										<option value="Teacher">Teacher</option>
									</select>
								</div>

								<div class="col-md-4 sub-bt">
									<button class="btn btn-success">Submit</button>
								</div>
							</div>

						</form>
					</div>
				</div>
			</div>
		</div>
	</div>


	<div class="container">
		<div class="row">
			<div class="col-md-12 mt-3">

				<%
				JobDAOIMPL jobDAOIMPL = new JobDAOIMPL();
				List<JobModel> listJobs = jobDAOIMPL.getJobsForUser();
				for (JobModel jobModel : listJobs) {
				%>

				<div class="card mt-4">
					<div class="card-body">

						<h3><%=jobModel.getTitle()%></h3>

						<p class="mt-3"><%=Get25Words.get25Words(jobModel.getDescription())%></p>


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
							<a href="viewMore.jsp?jobId=<%=jobModel.getId()%>"
								class="btn btn-primary">View More</a>
						</div>

					</div>
				</div>
				<%
				}
				%>

			</div>
		</div>
	</div>


	<div class="footer-user mt-5 p-2">
		<h3 class="text-center text-light">Copyright &copy; Designed and
			Developed By Tirtha Sharma</h3>
	</div>
</body>
</html>