package com.conf.controller;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.sql.*;

@WebServlet("/ConfSubmitBookingServlet")
public class ConfSubmitBookingServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");

        String eventId = request.getParameter("eventId");
        String eventTitle = request.getParameter("eventTitle");
        String eventDate = request.getParameter("eventDate");
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String ticketCountStr = request.getParameter("ticketCount");

        if (eventId == null || eventTitle == null || eventDate == null || name == null || email == null || ticketCountStr == null) {
            response.sendRedirect("confbook_ticket.jsp?eventId=" + eventId + "&error=missing_fields");
            return;
        }

        int ticketCount;
        try {
            ticketCount = Integer.parseInt(ticketCountStr);
        } catch (NumberFormatException e) {
            response.sendRedirect("confbook_ticket.jsp?eventId=" + eventId + "&error=invalid_count");
            return;
        }

        int ticketPrice = switch (eventId) {
            case "201" -> 799;
            case "202" -> 599;
            case "203" -> 699;
            case "204" -> 899;
            default -> 0;
        };

        if (ticketPrice == 0) {
            response.sendRedirect("confbook_ticket.jsp?eventId=" + eventId + "&error=invalid_event");
            return;
        }

        int totalAmount = ticketCount * ticketPrice;

        // Store booking in DB
        try (
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/event_portal", "root", "root");
            PreparedStatement ps = conn.prepareStatement(
                "INSERT INTO ticket_bookings (event_id, event_title, event_date, user_name, user_email, ticket_count, total_amount) VALUES (?, ?, ?, ?, ?, ?, ?)")
        ) {
            Class.forName("com.mysql.cj.jdbc.Driver");

            ps.setString(1, eventId);
            ps.setString(2, eventTitle);
            ps.setString(3, eventDate);
            ps.setString(4, name);
            ps.setString(5, email);
            ps.setInt(6, ticketCount);
            ps.setInt(7, totalAmount);

            int rows = ps.executeUpdate();

            if (rows > 0) {
                // Set all data to be shown on confirmation page
                request.setAttribute("eventId", eventId);
                request.setAttribute("eventTitle", eventTitle);
                request.setAttribute("eventDate", eventDate);
                request.setAttribute("ticketPrice", ticketPrice);
                request.setAttribute("name", name);
                request.setAttribute("email", email);
                request.setAttribute("ticketCount", ticketCount);
                request.setAttribute("totalAmount", totalAmount);

                // Forward to confirmation JSP
                RequestDispatcher dispatcher = request.getRequestDispatcher("confconfirm_booking.jsp");
                dispatcher.forward(request, response);
            } else {
                response.sendRedirect("confbook_ticket.jsp?eventId=" + eventId + "&error=insert_fail");
            }

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("confbook_ticket.jsp?eventId=" + eventId + "&error=exception");
        }
    }
}
