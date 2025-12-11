<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    request.setCharacterEncoding("UTF-8");

    String eventId = request.getParameter("eventId");
    String eventTitle = request.getParameter("eventTitle");
    String eventDate = request.getParameter("eventDate");
    String name = request.getParameter("name");
    String email = request.getParameter("email");
    int ticketCount = Integer.parseInt(request.getParameter("ticketCount"));
    int ticketPrice = Integer.parseInt(request.getParameter("ticketPrice"));
    int totalAmount = ticketCount * ticketPrice;

    String eventImage = "";
    if ("301".equals(eventId)) eventImage = "conf8.jpg";
    else if ("302".equals(eventId)) eventImage = "conf9.jpg";
    else if ("303".equals(eventId)) eventImage = "conf10.jpg";
    else if ("304".equals(eventId)) eventImage = "conf11.jpg";
    else if ("305".equals(eventId)) eventImage = "conf12.jpg";
%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Booking Ticket - Planora</title>
  <link href="https://fonts.googleapis.com/css2?family=Nunito:wght@400;700&display=swap" rel="stylesheet">
  <style>
    * { margin: 0; padding: 0; box-sizing: border-box; }

    body {
      font-family: 'Nunito', sans-serif;
      background: url('b4.jpg') no-repeat center center fixed;
      background-size: cover;
      min-height: 100vh;
      display: flex;
      align-items: center;
      justify-content: center;
      padding: 40px 15px;
      position: relative;
    }

    body::after {
      content: "";
      position: fixed;
      top: 0; left: 0; right: 0; bottom: 0;
      background: rgba(0, 0, 0, 0.65);
      backdrop-filter: blur(10px);
      z-index: 0;
    }

    .ticket {
      position: relative;
      z-index: 1;
      max-width: 960px;
      width: 100%;
      background: rgba(255, 255, 255, 0.06);
      border-radius: 20px;
      box-shadow: 0 10px 30px rgba(0, 0, 0, 0.6);
      overflow: hidden;
      display: grid;
      grid-template-columns: 1fr 1.1fr;
      border: 2px dashed #80e8ff;
    }

    .ticket::before, .ticket::after {
      content: "";
      position: absolute;
      width: 25px;
      height: 25px;
      background: #000;
      border-radius: 50%;
      top: 50%;
      transform: translateY(-50%);
      z-index: 2;
    }

    .ticket::before {
      left: -12px;
    }

    .ticket::after {
      right: -12px;
    }

    .ticket .left {
      background-color: rgba(255, 255, 255, 0.07);
      padding: 25px;
      display: flex;
      align-items: center;
      justify-content: center;
    }

    .ticket .left img {
      width: 100%;
      height: auto;
      border-radius: 15px;
      box-shadow: 0 6px 15px rgba(0, 0, 0, 0.5);
    }

    .ticket .right {
      padding: 40px 30px;
      color: #fff;
      display: flex;
      flex-direction: column;
      justify-content: center;
      background: rgba(0, 0, 0, 0.2);
    }

    .right h2 {
      font-size: 28px;
      text-align: center;
      margin-bottom: 25px;
      color: #aeeaff;
    }

    .info {
      font-size: 16px;
      margin-bottom: 14px;
      display: flex;
      justify-content: space-between;
      border-bottom: 1px dashed #ccc;
      padding-bottom: 6px;
    }

    .info span {
      color: #ffeb99;
      font-weight: bold;
    }

    button {
      margin-top: 30px;
      padding: 14px;
      width: 100%;
      border: none;
      border-radius: 30px;
      background: linear-gradient(to right, #00b4d8, #0077b6);
      color: white;
      font-size: 16px;
      font-weight: bold;
      cursor: pointer;
      transition: 0.3s;
      box-shadow: 0 5px 15px rgba(0, 180, 216, 0.3);
    }

    button:hover {
      transform: translateY(-2px);
      background: linear-gradient(to right, #0077b6, #00b4d8);
    }

    @media (max-width: 768px) {
      .ticket {
        grid-template-columns: 1fr;
      }
      .ticket::before, .ticket::after {
        display: none;
      }
    }
  </style>
</head>
<body>

<div class="ticket">
  <div class="left">
    <img src="<%= eventImage %>" alt="Event Poster">
  </div>
  <div class="right">
    <h2>🎟️ Your Booking Summary</h2>
    <div class="info">Event: <span><%= eventTitle %></span></div>
    <div class="info">Date: <span><%= eventDate %></span></div>
    <div class="info">Name: <span><%= name %></span></div>
    <div class="info">Email: <span><%= email %></span></div>
    <div class="info">Passes: <span><%= ticketCount %></span></div>
    <div class="info">Price/Pass: <span>₹<%= ticketPrice %></span></div>
    <div class="info">Total: <span>₹<%= totalAmount %></span></div>

    <form action="ConfCheckoutServlet" method="post">
      <input type="hidden" name="eventId" value="<%= eventId %>">
      <input type="hidden" name="eventTitle" value="<%= eventTitle %>">
      <input type="hidden" name="eventDate" value="<%= eventDate %>">
      <input type="hidden" name="name" value="<%= name %>">
      <input type="hidden" name="email" value="<%= email %>">
      <input type="hidden" name="ticketCount" value="<%= ticketCount %>">
      <input type="hidden" name="ticketPrice" value="<%= ticketPrice %>">
      <input type="hidden" name="totalAmount" value="<%= totalAmount %>">
      <input type="hidden" name="poster" value="<%= eventImage %>">
      <button type="submit">✅ Proceed to Checkout</button>
    </form>
  </div>
</div>

</body>
</html>
