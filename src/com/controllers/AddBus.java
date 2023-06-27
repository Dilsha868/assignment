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

@WebServlet("/AddBus")
public class AddBus extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String v_no = request.getParameter("v_no");
		String model = request.getParameter("model");
		String d_name = request.getParameter("d_name");
		String root = request.getParameter("root");
		String date = request.getParameter("date");
		String time = request.getParameter("time");
		String seats = request.getParameter("seats");
		try {
			Connection connection = DatabaseConnection.getConnection();
			Statement statement = connection.createStatement();
			int addBus = statement
					.executeUpdate("insert into bus(v_no,model,d_name,root,date,time,seat) values('" + v_no + "','" + model + "','" + d_name + "','" + root + "','" + date + "','" + time + "','"
							+ seats + "')");
			if (addBus > 0) {
				response.sendRedirect("viewBus.jsp");
			} else {
				response.sendRedirect("addBus.jsp");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

}
