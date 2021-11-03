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
.back-img {
	background: url("images/background/job-index.jpg") no-repeat fixed;
	background-size: cover;
	width: 100%;
	height: 83vh;
}

.card {
	box-shadow: 5px 10px 10px 5px rgba(0, 0, 0, 0.5);
	border-left: 10px solid red;
}

.welcome {
	text-shadow: 2px 1px #558ABB;
}
</style>
</head>
<body>
	<%@include file="allComponents/navbar.jsp"%>

	<%
	String success = (String) session.getAttribute("successMessage");

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
	%>

	<div class="container-fluid back-img">
		<div class="row">
			<div class="col-md-4 offset-md-4">
				<div class="card mt-4">
					<div class="card-body">
						<h3 class="text-center welcome">Welcome To Online Job Portal</h3>
					</div>
				</div>
			</div>
		</div>
	</div>

	<%@include file="allComponents/footer.jsp"%>

</body>
</html>