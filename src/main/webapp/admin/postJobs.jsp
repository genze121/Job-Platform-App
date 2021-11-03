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

.post {
	font-size: 40px;
}

.footer-post {
	left: 0;
	bottom: 0;
	width: 100%;
	background: #1460e3;
	position: relative;
}
</style>
</head>
<body
	style="background: background-color: #bdd4e7; background-image: linear-gradient(315deg, #bdd4e7 0%, #8693ab 74%);">
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
			<div class="col-md-12">
				<div class="card mt-5">
					<div class="card-body">
						<div class="text-center">
							<h3 class="post">
								<i class="fas fa-plus-square text-success"></i> Post Jobs
							</h3>
						</div>
						<form action="../postJobs" method="post">
							<div class="form-group mt-3">
								<label for="exampleInputTitle">Job Title</label> <input
									type="text" class="form-control" id="exampleInputPassword1"
									placeholder="Enter job title" name="title">
							</div>

							<div class="form-row">
								<div class="col-md-4">
									<label for="exampleInputCategory">Location</label> <select
										class="custom-select" name="location">
										<option selected>Choose...</option>
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
										<option selected>Choose...</option>
										<option value="IT">IT</option>
										<option value="Developer">Developer</option>
										<option value="Banking">Banking</option>
										<option value="Engineer">Engineer</option>
										<option value="Teacher">Teacher</option>
									</select>
								</div>

								<div class="col-md-4">
									<label for="exampleInputCategory">Status</label> <select
										class="custom-select" name="status">
										<option value="Active">Active</option>
										<option value="Inactive">Inactive</option>
									</select>
								</div>
							</div>

							<div class="form-group mt-3">
								<label for="exampleFormControlTextarea1">Job Description</label>
								<textarea class="form-control" id="exampleFormControlTextarea1"
									placeholder="Enter job description....." name="description"
									style="width: 100%; height: 200px;"></textarea>
							</div>

							<div class="mt-3">
								<button type="submit" class="btn btn-primary">Post Jobs</button>
							</div>

						</form>

					</div>
				</div>
			</div>
		</div>
	</div>

	<div class="footer-post mt-5 p-2">
		<h3 class="text-center text-light">Copyright &copy; Designed and
			Developed By Tirtha Sharma</h3>
	</div>

</body>
</html>