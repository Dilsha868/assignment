<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="com.connection.*"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">

<!-- Mirrored from www.binarytheme.com/BTlivedemos/2014/08/29/horizontal-admin/blank.html by HTTrack Website Copier/3.x [XR&CO'2014], Sun, 14 Jul 2019 14:48:34 GMT -->
<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1" />
<meta name="description" content="" />
<meta name="author" content="" />
<!--[if IE]>
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <![endif]-->
<title>User Management</title>
<!-- BOOTSTRAP CORE STYLE  -->
<link href="assets/css/bootstrap.css" rel="stylesheet" />
<!-- FONT AWESOME STYLE  -->
<link href="assets/css/font-awesome.css" rel="stylesheet" />
<!-- CUSTOM STYLE  -->
<link href="assets/css/style.css" rel="stylesheet" />
<!-- GOOGLE FONT -->
<link href='http://fonts.googleapis.com/css?family=Open+Sans'
	rel='stylesheet' type='text/css' />
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<body>
	<%
		if (session.getAttribute("uname") != null && session.getAttribute("uname") != "") {
	%>
	<div class="navbar navbar-inverse set-radius-zero">
		<div class="container">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target=".navbar-collapse">
					<span class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<h2>User Management System</h2>
			</div>

			<div class="right-div">
				<a href="logout.jsp" class="btn btn-info pull-right">LOG
					ME OUT</a>
			</div>
		</div>
	</div>
	<jsp:include page="userSideHeader.jsp"></jsp:include>
	<div class="content-wrapper">
		<div class="container">
			<div class="row pad-botm">
				<div class="col-md-12">
					<h4 class="header-line">Profile</h4>

				</div>
			</div>
			<div class="row">
				<%
					Connection connection = DatabaseConnection.getConnection();
						Statement statement = connection.createStatement();
						ResultSet resultSet = statement.executeQuery("select * from users where id='"
								+ session.getAttribute("uid") + "' and uname='" + session.getAttribute("uname") + "'");
						while (resultSet.next()) {
				%>
				<div class="col-md-8 col-sm-8 col-xs-12">
					<div class="panel panel-danger">
						<div class="panel-heading">My Profile</div>
						<div class="panel-body">
							<form action="" method="">

								<div class="form-group">
									<label>User Id:</label> <input type="text" name="id"
										class="form-control" value="<%=resultSet.getInt(1)%>" readonly>
								</div>
								<div class="form-group">
									<label>Name of User:</label> <input type="text" name="name"
										class="form-control" value="<%=resultSet.getString(2)%>" readonly>
								</div>

								<div class="form-group">
									<label>Email:</label> <input type="text" name="email"
										class="form-control" value="<%=resultSet.getString(3)%>"
										readonly readonly>
								</div>
								<div class="form-group">
									<label>State:</label> <input type="text" name="state"
										class="form-control" value="<%=resultSet.getString(5)%>" readonly>
								</div>
								<div class="form-group">
									<label>User Name:</label> <input type="text" name="uname"
										class="form-control" value="<%=resultSet.getString(6)%>"
										readonly>
								</div>
							</form>
						</div>
					</div>
				</div>
				<%
					}
				%>
			</div>
		</div>
	</div>
	<!-- CONTENT-WRAPPER SECTION END-->
	<!-- FOOTER SECTION END-->
	<!-- JAVASCRIPT FILES PLACED AT THE BOTTOM TO REDUCE THE LOADING TIME  -->
	<!-- CORE JQUERY  -->
	<script src="assets/js/jquery-1.10.2.js"></script>
	<!-- BOOTSTRAP SCRIPTS  -->
	<script src="assets/js/bootstrap.js"></script>
	<!-- CUSTOM SCRIPTS  -->
	<script src="assets/js/custom.js"></script>
	<script>
		(function(i, s, o, g, r, a, m) {
			i['GoogleAnalyticsObject'] = r;
			i[r] = i[r] || function() {
				(i[r].q = i[r].q || []).push(arguments)
			}, i[r].l = 1 * new Date();
			a = s.createElement(o), m = s.getElementsByTagName(o)[0];
			a.async = 1;
			a.src = g;
			m.parentNode.insertBefore(a, m)
		})
				(
						window,
						document,
						'script',
						'../../../../../../www.google-analytics.com/analytics.js',
						'ga');

		ga('create', 'UA-58127580-1', 'auto');
		ga('send', 'pageview');
	</script>
	<%
		} else {
			response.sendRedirect("index.jsp");
		}
	%>
</body>
</html>