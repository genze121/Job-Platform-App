<%@page import="com.helper.UserCounter"%>
<%@page import="java.util.List"%>
<%@page import="com.serviceimpl.UserDAOIMPL"%>
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
	box-shadow: 5px 10px 10px 5px rgba(0, 0, 0, 0.2);
}

a {
	text-decoration: none;
	color: black;
}

a:hover {
	text-decoration: none;
	color: black;
}

body {
	background: url("images/background/admin-home.jpg") no-repeat fixed;
	background-size: cover;
	width: 100%;
	height: 83vh;
}

.modal-dialog {
	max-width: 1200px;
}
</style>
</head>
<body>
	<%@include file="navbar.jsp"%>

	<div class="container">
		<div class="row mt-4">
			<div class="col-md-4 mt-4">

				<a href="postJobs.jsp">
					<div class="card border-danger mt-4">
						<div class="card-body">
							<div class="text-center">
								<i class="fas fa-plus-square fa-4x text-success"></i>
							</div>
							<h3 class="text-center mt-2">Post Jobs</h3>
							<div class="text-center">--------</div>
						</div>
					</div>
				</a>

			</div>

			<div class="col-md-4 mt-4">
				<a href="viewJobs.jsp">
					<div class="card border-danger mt-4">
						<div class="card-body">
							<div class="text-center">
								<i class="fas fa-eye fa-4x text-primary"></i>
							</div>
							<h3 class="text-center mt-2">View Jobs</h3>
							<div class="text-center">--------</div>
						</div>
					</div>
				</a>

			</div>


			<div class="col-md-4 mt-4">
				<a>
					<div class="card border-danger mt-4">
						<div class="card-body">
							<div class="text-center">
								<i class="fas fa-sign-out-alt text-danger fa-4x"></i>
							</div>
							<h3 class="text-center mt-2" data-toggle="modal"
								data-target="#exampleModal">Logout</h3>
							<div class="text-center">--------</div>
						</div>
					</div>
				</a>
			</div>

			<div class="col-md-12 mt-2">
				<a>
					<div class="card border-danger mt-4">
						<div class="card-body">
							<div class="text-center">
								<img alt="User Counter" src="../images/background/team.png"
									style="max-width: 120px;">
							</div>
							<h3 class="text-center mt-2" data-toggle="modal"
								data-target="#staticBackdrop">Users</h3>
							<div class="text-center">
								<h3><%=UserCounter.countUsers()%></h3>
							</div>
						</div>
					</div>
				</a>
			</div>
		</div>
	</div>


	<!-- All Users Modal -->
	<div class="modal fade" id="staticBackdrop" data-backdrop="static"
		data-keyboard="false" tabindex="-1"
		aria-labelledby="staticBackdropLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header bg-primary">
					<h5 class="modal-title text-light" id="staticBackdropLabel">All
						Users</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<div>
						<table class="table table-bordered table-striped text-center">
							<thead class="bg-info">
								<tr>
									<th scope="col">Id</th>
									<th scope="col">User Profile</th>
									<th scope="col">Name</th>
									<th scope="col">Username</th>
								</tr>
							</thead>
							<tbody>

								<%
								UserDAOIMPL userDAOIMPL = new UserDAOIMPL();
								List<UserModel> lists = userDAOIMPL.getAllUsers();
								for (UserModel userModel : lists) {
								%>

								<tr>
									<th scope="row"><%=userModel.getId()%></th>
									<td><img alt="User Profile"
										src="../images/user_profile/<%=userModel.getUserImage()%>"
										style="max-width: 100px;"></td>
									<td><%=userModel.getName()%></td>
									<td><%=userModel.getUsername()%></td>
								</tr>
								<%
								}
								%>
							</tbody>
						</table>
					</div>

				</div>
				<div class="modal-footer bg-primary">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>


	<!-- Logout Modal -->
	<div class="modal fade" id="exampleModal" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header bg-info">
					<h5 class="modal-title text-light" id="exampleModalLabel">Logout
						From Here</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<div class="text-center">
						<h3>Do You Want To Logout ?</h3>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">Close</button>
					<a href="../logout" class="btn btn-danger">Logout</a>
				</div>
			</div>
		</div>
	</div>


	<%@include file="footer.jsp"%>
</body>
</html>