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
				<li class="nav-item active"><a class="nav-link" href="adminhome.jsp">
						<i class="fas fa-home"></i> Home <span class="sr-only">(current)</span>
				</a></li>
			</ul>

			<%
			UserModel userAdmin = (UserModel) session.getAttribute("userAdmin");

			if (userAdmin == null) {
			%>
			<form class="form-inline my-2 my-lg-0 button-custom">
				<a href="../login.jsp" class="btn btn-success my-2 my-sm-0"><i
					class="fas fa-sign-in-alt"></i> Login</a> <a href="../register"
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
					<%=userAdmin.getName()%></a>
			</form>
			<%
			}
			%>
		</div>
	</nav>
</div>