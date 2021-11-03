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
	background: url("images/background/login.jpg") no-repeat fixed;
	background-size: cover;
	width: 100%;
	height: 83vh;
}

a {
	text-decoration: none;
	color: black;
}

a:hover {
	text-decoration: none;
	color: blue;
}
</style>
</head>
<body>
	<%@include file="allComponents/navbar.jsp"%>

	<%
	String loginCompulsory = (String) session.getAttribute("loginCompulsory");
	String error = (String) session.getAttribute("errorMessage");
	String logout = (String) session.getAttribute("logoutMessage");

	if (loginCompulsory != null) {
	%>
	<div class="alert alert-warning alert-dismissible fade-show"
		role="alert">
		<strong><%=loginCompulsory%></strong>
		<button type="button" class="close" data-dismiss="alert"
			aria-label="Close">
			<span aria-hidden="true">&times;</span>
		</button>
	</div>
	<%
	}
	session.removeAttribute("loginCompulsory");

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

	if (logout != null) {
	%>
	<div class="alert alert-success alert-dismissible fade-show"
		role="alert">
		<strong><%=logout%></strong>
		<button type="button" class="close" data-dismiss="alert"
			aria-label="Close">
			<span aria-hidden="true">&times;</span>
		</button>
	</div>
	<%
	}
	session.removeAttribute("logoutMessage");
	%>

	<div class="container">
		<div class="row">
			<div class="col-md-6 offset-md-3">
				<div class="card mt-4">
					<div class="card-header bg-warning">
						<h3 class="text-center text-dark">
							<img alt="Register Here" src="images/background/login.png"
								style="max-width: 40px;"> Login Here !!
						</h3>
					</div>
					<div class="card-body">
						<form action="login" method="post">

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

							<div class="mt-4">
								<button type="submit"
									class="btn btn-success badge-pill btn-block">Login</button>
								<div class="mt-2">
									<a href="forgotPassword.jsp"> Forgot Password ?</a>
								</div>

								<div class="mt-2">
									<a href="register.jsp"> New User ? Register Here</a>
								</div>

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