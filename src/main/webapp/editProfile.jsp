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
	background: url("images/background/edit-profile.jpg") no-repeat fixed;
	background-size: cover;
	width: 100%;
}
</style>
</head>
<body>
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
			<div class="col-md-6 offset-md-6">
				<div class="card border-danger mt-4">
					<div class="card-header bg-secondary">
						<h3 class="text-center text-light">
							<img alt="Edit Here" src="images/background/register-here.png"
								style="max-width: 70px;"> Edit Profile Here !!
						</h3>
					</div>
					<div class="card-body">
						<form action="updateProfile" method="post"
							enctype="multipart/form-data">

							<%
							if (user != null) {
							%>
							<input type="hidden" value="<%=user.getId()%>" name="Id">
							<%
							}
							%>

							<div class="form-group">
								<label for="exampleName">Name</label> <input type="text"
									class="form-control" id="exampleName"
									placeholder="Enter the name" name="name"
									value="<%=user.getName()%>">
							</div>

							<div class="form-group">
								<label for="exampleInputEmail1">Username</label> <input
									type="email" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" placeholder="Enter the username"
									name="username" value="<%=user.getUsername()%>"> <small
									id="emailHelp" class="form-text text-muted">We'll never
									share your email with anyone else.</small>
							</div>

							<div class="form-group">
								<label for="exampleFormControlFile1">User Profile</label> <input
									type="file" class="form-control-file" name="user_profile"
									id="exampleFormControlFile1">
							</div>

							<div class="form-group">
								<label for="exampleInputPassword1">Password</label> <input
									type="password" class="form-control" id="exampleInputPassword1"
									placeholder="Enter the password" name="password">
							</div>
							<button type="submit" class="btn btn-primary">Update
								Profile</button>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<%@include file="allComponents/footer.jsp"%>
</body>
</html>