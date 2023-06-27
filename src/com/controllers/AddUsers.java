package com.controllers;

import java.io.IOException;
import java.sql.Connection;
import java.sql.Statement;
import java.util.Random;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.connection.DatabaseConnection;

@WebServlet("/AddUsers")
public class AddUsers extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String address = request.getParameter("address");
		String state = request.getParameter("state");
		String uname = request.getParameter("uname");
		String upass = request.getParameter("upass");
		try {
			Connection connection = DatabaseConnection.getConnection();
			Statement statement = connection.createStatement();
			int addUser = statement
					.executeUpdate("insert into users(Name,email,address,state,uname,upass) values('" + name + "','" + email + "','" + address + "','" + state + "','"
							+ uname + "','" + upass + "')");
			if (addUser > 0) {
				response.sendRedirect("userLogin.jsp");
			} else {
				response.sendRedirect("userLogin.jsp");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

}
