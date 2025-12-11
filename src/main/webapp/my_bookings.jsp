<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*, java.util.*" %>
<%
    String userEmail = (String) session.getAttribute("user_email");
    String userName = (String) session.getAttribute("user_name");
    if (userEmail == null || userName == null) {
        response.sendRedirect("login.jsp");
        return;
    }
    
    List<Map<String, String>> bookings = new ArrayList<>();
    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/event_portal", "root", "root");
        PreparedStatement ps = conn.prepareStatement("SELECT * FROM event_bookings WHERE email = ? ORDER BY booking_time DESC");
        ps.setString(1, userEmail);
        ResultSet rs = ps.executeQuery();

        while (rs.next()) {
            Map<String, String> booking = new HashMap<>();
            booking.put("id", rs.getString("id"));
            booking.put("event_id", rs.getString("event_id"));
            booking.put("title", rs.getString("event_title"));
            booking.put("date", rs.getString("event_date"));
            booking.put("tickets", rs.getString("ticket_count"));
            booking.put("total", rs.getString("total_amount"));
            booking.put("time", rs.getString("booking_time"));
            bookings.add(booking);
        }

        rs.close();
        ps.close();
        conn.close();
    } catch (Exception e) {
        e.printStackTrace();
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>My Bookings - Planora</title>
    <link href="https://fonts.googleapis.com/css2?family=Rubik:wght@400;600&display=swap" rel="stylesheet">
    <style>
        body {
            font-family: 'Rubik', sans-serif;
            background: linear-gradient(to right, #243B55, #141E30);
            color: #fff;
            padding: 40px 20px;
            position: relative;
        }
        .back-btn {
            position: absolute;
            top: 20px;
            left: 20px;
            background: rgba(255, 255, 255, 0.1);
            padding: 10px 18px;
            color: #fff;
            text-decoration: none;
            border-radius: 25px;
            font-weight: bold;
            border: 1px solid rgba(255,255,255,0.3);
            transition: 0.3s ease;
        }
        .back-btn:hover {
            background: rgba(255,255,255,0.3);
        }
        h1 {
            text-align: center;
            font-size: 38px;
            margin-bottom: 10px;
        }
        .ticket-container {
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            gap: 25px;
        }
        .ticket-card {
            background: #fefefe;
            color: #333;
            padding: 30px;
            border-radius: 16px;
            box-shadow: 0 10px 30px rgba(0,0,0,0.5);
            width: 340px;
            position: relative;
        }
        .ticket-card:before, .ticket-card:after {
            content: ''; position: absolute; width: 20px; height: 20px; background: #141E30;
            border-radius: 50%; top: 50%; transform: translateY(-50%);
        }
        .ticket-card:before { left: -10px; }
        .ticket-card:after { right: -10px; }
        .ticket-title {
            font-size: 22px;
            font-weight: bold;
            text-align: center;
            margin-bottom: 10px;
        }
        .ticket-detail { font-size: 15px; margin: 4px 0; }
        .barcode { text-align: center; margin-top: 20px; }
        .barcode img { width: 140px; filter: grayscale(100%); }
        .actions { text-align: center; margin-top: 20px; }
        .cancel-btn, .print-btn {
            background: linear-gradient(to right, #ff6b6b, #ff4d4d);
            color: white;
            padding: 8px 18px;
            border-radius: 8px;
            border: none;
            font-weight: bold;
            cursor: pointer;
            margin: 5px;
            transition: 0.3s ease;
        }
        .cancel-btn:hover, .print-btn:hover {
            transform: scale(1.05);
        }
    </style>
    <script>
        function confirmCancel(id) {
            if (confirm("Are you sure you want to cancel this booking?")) {
                window.location.href = "CancelBookingServlet?id=" + id;
            }
        }
    </script>
</head>
<body>

<a href="dashboard.jsp" class="back-btn">← Back to Dashboard</a>

<h1>🎫 Hello <%= userName %>, Here are Your Tickets</h1>

<% if (bookings.size() == 0) { %>
    <p style="text-align:center; font-size: 18px; margin-top: 60px;">You haven’t booked any events yet. Start exploring!</p>
<% } else { %>
<div class="ticket-container">
    <% for (Map<String, String> booking : bookings) { %>
    <div class="ticket-card">
        <div class="ticket-title">🎟️ <%= booking.get("title") %></div>
        <div class="ticket-detail"><strong>📅 Date:</strong> <%= booking.get("date") %></div>
        <div class="ticket-detail"><strong>🎫 Tickets:</strong> <%= booking.get("tickets") %></div>
        <div class="ticket-detail"><strong>💰 Total Paid:</strong> ₹<%= booking.get("total") %></div>
        <div class="ticket-detail"><strong>🕒 Booked On:</strong> <%= booking.get("time") %></div>
        <div class="ticket-detail"><strong>🆔 Booking ID:</strong> <%= booking.get("event_id") %></div>
        <div class="barcode">
            <img src="https://api.qrserver.com/v1/create-qr-code/?size=150x150&data=<%= booking.get("event_id") %>" alt="QR Code">
        </div>
        <div class="actions">
            <button class="print-btn" onclick="window.print()">🖨️ Print</button>
            <button class="cancel-btn" onclick="confirmCancel(<%= booking.get("id") %>)">Delete from here</button>
        </div>
    </div>
    <% } %>
</div>
<% } %>

</body>
</html>
