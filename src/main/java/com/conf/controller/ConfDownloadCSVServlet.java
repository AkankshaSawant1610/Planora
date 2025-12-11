package com.conf.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;

@WebServlet("/ConfDownloadCSVServlet")
public class ConfDownloadCSVServlet extends HttpServlet {
    private static final String DB_URL = "jdbc:mysql://localhost:3306/event_portal";
    private static final String DB_USER = "root";
    private static final String DB_PASSWORD = "root";

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String userEmail = (String) request.getSession().getAttribute("user_email");
        if (userEmail == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        response.setContentType("text/csv");
        response.setHeader("Content-Disposition", "attachment; filename=bookings.csv");

        PrintWriter out = response.getWriter();
        out.println("Event Title,Event Date,Tickets,Total Paid,Booked On");

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);

            PreparedStatement ps = conn.prepareStatement(
                "SELECT event_title, event_date, ticket_count, total_amount, booking_time FROM event_bookings WHERE email = ? ORDER BY booking_time DESC"
            );
            ps.setString(1, userEmail);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                out.printf("%s,%s,%d,%d,%s\n",
                    rs.getString("event_title"),
                    rs.getString("event_date"),
                    rs.getInt("ticket_count"),
                    rs.getInt("total_amount"),
                    rs.getString("booking_time")
                );
            }

            rs.close();
            ps.close();
            conn.close();
        } catch (Exception e) {
            e.printStackTrace(out);
        }

        out.flush();
        out.close();
    }
}
