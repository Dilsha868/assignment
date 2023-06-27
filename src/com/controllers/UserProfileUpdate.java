package com.controllers;

import java.io.IOException;
import java.sql.Connection;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.connection.DatabaseConnection;

/**
 * Servlet implementation class UserProfileUpdate
 */
@WebServlet("/UserProfileUpdate")
public class UserProfileUpdate extends HttpServlet {
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			String Name = request.getParameter("Name");
			String email = request.getParameter("email");
			String address = request.getParameter("address");
			String state=request.getParameter("state");
			HttpSession hs = request.getSession();
			
			Connection connection = DatabaseConnection.getConnection();
			Statement statement = connection.createStatement();
			int editProfile = statement
					.executeUpdate("update users set Name='"+Name+"',email='"+email+"',address='"+address+"',state='"+state+"' where uname='"+hs.getAttribute("uname")+"'");
			if (editProfile > 0) {
				response.sendRedirect("editUserProfile.jsp");
			} else {
				response.sendRedirect("editUserProfile.jsp");
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
	}

}
