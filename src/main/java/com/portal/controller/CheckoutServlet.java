package com.portal.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/CheckoutServlet")
public class CheckoutServlet extends HttpServlet {
    private static final String DB_URL = "jdbc:mysql://localhost:3306/event_portal";
    private static final String DB_USER = "root";
    private static final String DB_PASSWORD = "root";

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        String eventId = request.getParameter("eventId");
        String eventTitle = request.getParameter("eventTitle");
        String eventDate = request.getParameter("eventDate");
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        int ticketCount = Integer.parseInt(request.getParameter("ticketCount"));
        int ticketPrice = Integer.parseInt(request.getParameter("ticketPrice"));
        int totalAmount = Integer.parseInt(request.getParameter("totalAmount"));
        String poster = request.getParameter("poster");

        boolean isInserted = false;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);

            String sql = "INSERT INTO event_bookings (event_id, event_title, event_date, name, email, ticket_count, ticket_price, total_amount) " +
                         "VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, eventId);
            ps.setString(2, eventTitle);
            ps.setString(3, eventDate);
            ps.setString(4, name);
            ps.setString(5, email);
            ps.setInt(6, ticketCount);
            ps.setInt(7, ticketPrice);
            ps.setInt(8, totalAmount);

            isInserted = ps.executeUpdate() > 0;
            ps.close();
            conn.close();

            HttpSession session = request.getSession();
            List<String> confirmedEvents = (List<String>) session.getAttribute("confirmedEvents");
            if (confirmedEvents == null) confirmedEvents = new ArrayList<>();
            confirmedEvents.add(eventId);
            session.setAttribute("confirmedEvents", confirmedEvents);

        } catch (Exception e) {
            e.printStackTrace(out);
        }

        // UI Output
        out.println("<!DOCTYPE html>");
        out.println("<html lang='en'>");
        out.println("<head>");
        out.println("<meta charset='UTF-8'>");
        out.println("<title>Booking Confirmation</title>");
        out.println("<link href='https://fonts.googleapis.com/css2?family=Rubik:wght@400;600&display=swap' rel='stylesheet'>");
        out.println("<style>");
        out.println("body { margin: 0; padding: 0; font-family: 'Rubik', sans-serif; background: linear-gradient(to right, #243B55, #141E30); color: white; height: 100vh; overflow: auto; display: flex; justify-content: center; align-items: center; padding: 40px; }");
        out.println(".content-flex { display: flex; flex-wrap: wrap; gap: 30px; max-width: 1100px; justify-content: center; align-items: flex-start; }");

        // ✅ Glassmorphic confirmation block
        out.println(".glass-message { flex: 1 1 300px; background: rgba(255, 255, 255, 0.1); backdrop-filter: blur(15px); border-radius: 16px; padding: 25px 30px; box-shadow: 0 8px 20px rgba(0,0,0,0.4); color: #ffffff; text-align: center; }");
        out.println(".glass-message h2 { font-size: 24px; margin-bottom: 10px; color: #ffffff; }");
        out.println(".glass-message p { font-size: 15px; line-height: 1.6; color: #eaeaea; }");

        // 🎟️ Ticket style
        out.println(".ticket-container { flex: 1 1 340px; background: #fefefe; color: #333; padding: 25px; border-radius: 16px; box-shadow: 0 10px 30px rgba(0,0,0,0.5); position: relative; }");
        out.println(".ticket-container:before, .ticket-container:after { content: ''; position: absolute; width: 20px; height: 20px; background: #141E30; border-radius: 50%; top: 50%; transform: translateY(-50%); }");
        out.println(".ticket-container:before { left: -10px; }");
        out.println(".ticket-container:after { right: -10px; }");
        out.println(".ticket-poster { width: 100%; height: 160px; object-fit: cover; border-radius: 12px; margin-bottom: 20px; }");
        out.println(".ticket-title { font-size: 22px; font-weight: bold; margin-bottom: 10px; text-align: center; }");
        out.println(".ticket-detail { font-size: 16px; margin: 5px 0; }");
        out.println(".barcode { margin-top: 25px; text-align: center; }");
        out.println(".barcode img { width: 140px; height: auto; filter: grayscale(100%); }");
        out.println(".btns { text-align: center; margin-top: 25px; }");
        out.println(".btns a, .btns button { margin: 10px 6px; padding: 10px 20px; background: #2575fc; color: white; border: none; border-radius: 25px; text-decoration: none; font-weight: bold; transition: 0.3s ease; cursor: pointer; }");
        out.println(".btns a:hover, .btns button:hover { background: #6a11cb; }");
        out.println("</style>");
        out.println("</head><body>");

        out.println("<div class='content-flex'>");

        if (isInserted) {
            // ✅ Glass confirmation block
            out.println("<div class='glass-message'>");
            out.println("<h2>✅ Hey " + name + "!</h2>");
            out.println("<p>Your ticket has been successfully confirmed.<br>Please print and keep this ticket safe — you'll need it at the event entry gate. 😊</p>");
            out.println("</div>");

            // 🎟️ Ticket section
            out.println("<div class='ticket-container'>");
            if (poster != null && !poster.isEmpty()) {
                out.println("<img class='ticket-poster' src='" + poster + "' alt='Event Poster'>");
            }

            out.println("<div class='ticket-title'>🎟️ " + eventTitle + "</div>");
            out.println("<div class='ticket-detail'><strong>📅 Date:</strong> " + eventDate + "</div>");
            out.println("<div class='ticket-detail'><strong>👤 Name:</strong> " + name + "</div>");
            out.println("<div class='ticket-detail'><strong>📧 Email:</strong> " + email + "</div>");
            out.println("<div class='ticket-detail'><strong>🎫 Tickets:</strong> " + ticketCount + "</div>");
            out.println("<div class='ticket-detail'><strong>💰 Total:</strong> ₹" + totalAmount + "</div>");
            out.println("<div class='ticket-detail'><strong>🆔 Booking ID:</strong> #" + eventId.toUpperCase() + "</div>");
            out.println("<div class='barcode'><img src='https://api.qrserver.com/v1/create-qr-code/?size=150x150&data=" + eventId + "' alt='QR Code'></div>");
            out.println("<div class='btns'>");
            out.println("<button onclick='window.print()'>🖨️ Print Ticket</button>");
            out.println("<a href='event.jsp'>← Back to Events</a>");
            out.println("</div>");
            out.println("</div>");
        } else {
            out.println("<div class='glass-message' style='background: rgba(255,0,0,0.2);'>");
            out.println("<h2>❌ Booking Failed</h2>");
            out.println("<p>Something went wrong while processing your booking. Please try again later.</p>");
            out.println("</div>");
        }

        out.println("</div>"); // content-flex
        out.println("</body></html>");
        out.close();
    }
}
