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
	background: url("images/background/forgotPass.jpg") no-repeat fixed;
	background-size: cover;
	width: 100%;
	height: 83vh;
}
</style>
</head>
<body>
	<%@include file="allComponents/navbar.jsp"%>

	<%
	String success = (String) session.getAttribute("successMessage");
	String error = (String) session.getAttribute("errorMessage");

	if (success != null) {
	%>
	<div class="alert alert-success alert-dismissible fade-show"
		role="alert">
		<strong><%=success%></strong><a href="login.jsp"> Login From Here
			!!</a>
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

	<div class="container-fluid">
		<div class="row">
			<div class="col-md-5 offset-md-3">
				<div class="card border-danger mt-4">
					<div class="card-header bg-info">
						<h3 class="text-center text-light">
							<img alt="Register Here" src="images/background/login.png"
								style="max-width: 40px;"> Forgot Password !!
						</h3>
					</div>
					<div class="card-body">
						<form action="forgot" method="post">

							<div class="form-group">
								<label for="exampleInputEmail1">Username</label> <input
									type="email" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" placeholder="Enter the username"
									name="username">
							</div>
							<div class="form-group">
								<label for="exampleInputPassword1">Password</label> <input
									type="password" class="form-control" id="exampleInputPassword1"
									placeholder="Enter the password" name="password">
							</div>

							<div class="form-group">
								<label for="exampleInputPassword2">Confirm Password</label> <input
									type="password" class="form-control" id="exampleInputPassword2"
									placeholder="Enter the confirm password">
							</div>

							<div class="mt-4">
								<button type="submit" class="btn btn-primary">Submit</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<%@include file="allComponents/footer.jsp"%>
</body>
</html>