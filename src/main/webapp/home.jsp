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
.home {
	background: url("images/background/home.jpg") no-repeat fixed;
	width: 100%;
	height: 83vh;
	background-size: cover;
}

.card {
	box-shadow: 5px 10px 10px 5px rgba(0, 0, 0, 0.5);
	border-radius: 8px;
	border: 5px solid red;
}
</style>
</head>
<body>
	<%@include file="allComponents/navbar.jsp"%>
	
	<%
	if(user==null){
		session.setAttribute("loginCompulsory", "Please login to view the hot jobs....");
		response.sendRedirect("login.jsp");
	}
	
	%>

	<div class="container-fluid home">
		<div class="row">
			<div class="col-md-4 offset-md-4">
				<div class="card mt-5">
					<div class="card-body">
						<div class="text-center">
							<h3>Start Viewing Jobs</h3>
							<a href="userView.jsp" class="btn btn-outline-success mt-3">
								Start Here</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<%@include file="allComponents/footer.jsp"%>
</body>
</html>