<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<section class="menu-section">
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<div class="navbar-collapse collapse ">
					<ul id="menu-top" class="nav navbar-nav navbar-right">
						<li><a href="viewUsers.jsp">View Users</a></li>
						<li><a href="changeAdminPassword.jsp">Change Password</a></li>
						<li><a href=""><font color="#ff8c00"><%=session.getAttribute("uname")%></font></a></li>
					</ul>
				</div>
			</div>
		</div>
	</div>
</section>