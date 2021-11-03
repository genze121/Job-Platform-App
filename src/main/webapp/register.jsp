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
	box-shadow: 5px 10px 10px 5px rgba(0, 0, 0, 0.5);
	border-radius: 8px;
}

body {
	background: url("images/background/register.jpg") no-repeat fixed;
	background-size: cover;
	width: 100%;
	height: 83vh;
}
</style>
</head>
<body>
	<%@include file="allComponents/navbar.jsp"%>

	<%
	String checkbox = (String) session.getAttribute("checkbox");
	String success = (String) session.getAttribute("successMessage");
	String error = (String) session.getAttribute("errorMessage");

	if (checkbox != null) {
	%>
	<div class="alert alert-warning alert-dismissible fade-show"
		role="alert">
		<strong><%=checkbox%></strong>
		<button type="button" class="close" data-dismiss="alert"
			aria-label="Close">
			<span aria-hidden="true">&times;</span>
		</button>
	</div>
	<%
	}
	session.removeAttribute("checkbox");

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
			<div class="col-md-6 offset-md-3">
				<div class="card border-danger mt-4">
					<div class="card-header bg-secondary">
						<h3 class="text-center text-light">
							<img alt="Register Here"
								src="images/background/register-here.png"
								style="max-width: 70px;"> Register Here !!
						</h3>
					</div>
					<div class="card-body">
						<form action="registerUser" method="post">

							<div class="form-group">
								<label for="exampleName">Name</label> <input type="text"
									class="form-control" id="exampleName"
									placeholder="Enter the name" name="name">
							</div>

							<div class="form-group">
								<label for="exampleInputEmail1">Username</label> <input
									type="email" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" placeholder="Enter the username"
									name="username"> <small id="emailHelp"
									class="form-text text-muted">We'll never share your
									email with anyone else.</small>
							</div>
							<div class="form-group">
								<label for="exampleInputPassword1">Password</label> <input
									type="password" class="form-control" id="exampleInputPassword1"
									placeholder="Enter the password" name="password">
							</div>
							<div class="form-group form-check">
								<input type="checkbox" class="form-check-input"
									id="exampleCheck1" name="checkbox"> <label
									class="form-check-label" for="exampleCheck1">I agree to
									the terms and conditions</label>
							</div>
							<button type="submit" class="btn btn-primary">Register</button>
							<button type="reset" class="btn btn-danger ml-1">Reset</button>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<%@include file="allComponents/footer.jsp"%>
</body>
</html>