package com.conf.controller;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import java.io.IOException;
import java.sql.*;


public class ConfRegisterServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String email = request.getParameter("email");
        String firstName = request.getParameter("firstName");
        String lastName = request.getParameter("lastName");
        String password = request.getParameter("password");
        String confirmPassword = request.getParameter("confirmPassword");

        if (!password.equals(confirmPassword)) {
            request.setAttribute("error", "Passwords do not match!");
            request.getRequestDispatcher("confregister.jsp").forward(request, response);
            return;
        }

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection(
                    "jdbc:mysql://localhost:3306/event_portal", "root", "root");

            PreparedStatement ps = conn.prepareStatement(
                "INSERT INTO users (email, first_name, last_name, password) VALUES (?, ?, ?, ?)");

            ps.setString(1, email);
            ps.setString(2, firstName);
            ps.setString(3, lastName);
            ps.setString(4, password);

            int result = ps.executeUpdate();

            if (result > 0) {
                response.sendRedirect("conflogin.jsp?success=registered");
            } else {
                request.setAttribute("error", "Registration failed. Try again.");
                request.getRequestDispatcher("confregister.jsp").forward(request, response);
            }

            conn.close();

        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "Something went wrong: " + e.getMessage());
            request.getRequestDispatcher("confregister.jsp").forward(request, response);
        }
    }
}
