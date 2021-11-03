<%@page import="com.model.UserModel"%>
<div class="container-fluid p-0 m-0">

	<nav class="navbar navbar-expand-lg navbar-dark bg-custom">
		<a class="navbar-brand" href="index.jsp"><i
			class="fab fa-asymmetrik"></i> Job Keeda</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>

		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav mr-auto">
				<li class="nav-item active"><a class="nav-link" href="home.jsp">
						<i class="fas fa-home"></i> Home <span class="sr-only">(current)</span>
				</a></li>
			</ul>

			<%
			UserModel user = (UserModel) session.getAttribute("userModel");

			if (user == null) {
			%>
			<form class="form-inline my-2 my-lg-0 button-custom">
				<a href="login.jsp" class="btn btn-success my-2 my-sm-0"><i
					class="fas fa-sign-in-alt"></i> Login</a> <a href="register"
					class="btn btn-danger my-2 my-sm-0 ml-2"> <i
					class="fas fa-registered"></i> Register
				</a>
			</form>
			<%
			} else {
			%>
			<form class="form-inline my-2 my-lg-0 button-custom">
				<a class="btn btn-success my-2 my-sm-0" data-toggle="modal"
					data-target="#exampleModalCenter"> <i class="fas fa-user"></i>
					<%=user.getName()%></a> <a class="btn btn-danger my-2 my-sm-0 ml-2"
					data-toggle="modal" data-target="#exampleModal"> <i
					class="fas fa-sign-out-alt"></i> Logout
				</a>

				<!-- Modal -->
				<div class="modal fade" id="exampleModalCenter" tabindex="-1"
					role="dialog" aria-labelledby="exampleModalCenterTitle"
					aria-hidden="true">
					<div class="modal-dialog modal-dialog-centered" role="document">
						<div class="modal-content">
							<div class="modal-header bg-danger">
								<h5 class="modal-title text-light" id="exampleModalLongTitle">User
									Profile</h5>
								<button type="button" class="close" data-dismiss="modal"
									aria-label="Close">
									<span aria-hidden="true">&times;</span>
								</button>
							</div>
							<div class="modal-body bg-secondary">

								<div class="text-center">
									<img alt="User Profile Pic"
										src="images/user_profile/<%=user.getUserImage()%>"
										style="max-width: 150px;">
								</div>

								<table
									class="table table-bordered table-striped table-hover text-center text-light mt-3">
									<tr>
										<td>Id</td>
										<td><%=user.getId()%></td>
									</tr>

									<tr>
										<td>Name</td>
										<td><%=user.getName()%></td>
									</tr>

									<tr>
										<td>Username</td>
										<td><%=user.getUsername()%></td>
									</tr>
								</table>
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-secondary"
									data-dismiss="modal">Close</button>
								<a href="editProfile.jsp" class="btn btn-primary">Edit
									Profile</a>
							</div>
						</div>
					</div>
				</div>
			</form>
			<%
			}
			%>
		</div>
	</nav>
</div>


<!-- Modal -->
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
				<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
				<a href="logout" class="btn btn-danger">Logout</a>
			</div>
		</div>
	</div>
</div>