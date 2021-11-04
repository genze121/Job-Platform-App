<%@page import="com.model.ApplyJobModel"%>
<%@page import="java.util.List"%>
<%@page import="com.serviceimpl.JobDAOIMPL"%>
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
.table-bordered>thead>tr>th, .table-bordered>tbody>tr>td {
	border: 2px solid black;
}

.footer-applied {
	left: 0;
	bottom: 0;
	width: 100%;
	background: #1460e3;
	position: relative;
	margin-top: 332px;
}

.card {
	box-shadow: 5px 10px 10px 5px rgba(0, 0, 0, 0.4);
	border: 2px solid red;
}
</style>
</head>
<body style="background: #c7c8c9;">
	<%@include file="navbar.jsp"%>

	<%
	if (userAdmin == null) {
		session.setAttribute("loginCompulsory", "Please login to access the details....");
		response.sendRedirect("../login.jsp");
	}
	%>

	<div class="container">
		<div class="row">
			<div class="col-md-12">

				<div class="card mt-4">
					<div class="card-body bg-info">
						<h3 class="text-center text-light">Applied Jobs By Users</h3>
					</div>
				</div>

				<div class="text-center mt-5">
					<table class="table table-bordered table-striped table-hover">
						<thead class="bg-primary text-light">
							<tr>
								<th scope="col">Id</th>
								<th scope="col">Job Id</th>
								<th scope="col">Job Title</th>
								<th scope="col">Location</th>
								<th scope="col">Category</th>
								<th scope="col">Username</th>
								<th scope="col">Applied Date</th>
							</tr>
						</thead>

						<%
						JobDAOIMPL jobDAOIMPL = new JobDAOIMPL();
						List<ApplyJobModel> lists = jobDAOIMPL.getAllApplyJobs();
						for (ApplyJobModel applyJobModel : lists) {
						%>
						<tbody>
							<tr>
								<td><%=applyJobModel.getId()%></td>
								<td><%=applyJobModel.getApply_id()%></td>
								<td><%=applyJobModel.getTitle()%></td>
								<td><%=applyJobModel.getLocation()%></td>
								<td><%=applyJobModel.getCategory()%></td>
								<td><%=applyJobModel.getUsername()%></td>
								<td><%=applyJobModel.getApply_date()%></td>
							</tr>
						</tbody>
						<%
						}
						%>

					</table>
				</div>
			</div>
		</div>
	</div>

	<div class="footer-applied p-2">
		<h3 class="text-center text-light">Copyright &copy; Designed and
			Developed By Tirtha Sharma</h3>
	</div>


</body>
</html>
