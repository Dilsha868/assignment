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

@WebServlet("/DeleteUsers")
public class DeleteUsers extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String id = request.getParameter("id");
		try {
			Connection connection = DatabaseConnection.getConnection();
			Statement statement = connection.createStatement();
			int deleteUser = statement
					.executeUpdate("delete from users where id='" +id +"' ");
			if (deleteUser > 0) {
				response.sendRedirect("viewUsers.jsp");
			} else {
				response.sendRedirect("addUsers.jsp");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

}
