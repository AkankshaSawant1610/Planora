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
    if ("201".equals(eventId)) eventImage = "img4.avif";
    else if ("202".equals(eventId)) eventImage = "img5.jpg";
    else if ("203".equals(eventId)) eventImage = "img6.jpg";
    else if ("204".equals(eventId)) eventImage = "img7.jpg";
%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Confirm Booking - Planora</title>
  <link href="https://fonts.googleapis.com/css2?family=Outfit:wght@400;600;700&display=swap" rel="stylesheet">
  <style>
    * { margin: 0; padding: 0; box-sizing: border-box; }

    body {
      font-family: 'Outfit', sans-serif;
      background: url('b4.jpg') no-repeat center center fixed;
      background-size: cover;
      display: flex;
      justify-content: center;
      align-items: center;
      min-height: 100vh;
      padding: 60px 20px;
      position: relative;
    }

    body::before {
      content: '';
      position: fixed;
      top: 0; left: 0; right: 0; bottom: 0;
      background-color: rgba(0, 0, 0, 0.5);
      backdrop-filter: blur(10px);
      z-index: 0;
    }

    .ticket {
      position: relative;
      background: rgba(255, 255, 255, 0.07);
      backdrop-filter: blur(25px);
      border-radius: 22px;
      border: 1px solid rgba(255, 255, 255, 0.2);
      box-shadow: 0 12px 32px rgba(0, 0, 0, 0.4);
      max-width: 1000px;
      width: 100%;
      display: grid;
      grid-template-columns: 1.2fr 1fr;
      overflow: hidden;
      z-index: 2;
      border-left: 8px dashed #90e0ef;
    }

    .ticket::before, .ticket::after {
      content: "";
      position: absolute;
      width: 36px;
      height: 36px;
      background: #0d1b2a;
      border-radius: 50%;
      top: 50%;
      transform: translateY(-50%);
      z-index: 3;
    }

    .ticket::before { left: -18px; }
    .ticket::after { right: -18px; }

    .left {
      padding: 30px;
      background: rgba(255, 255, 255, 0.04);
      display: flex;
      align-items: center;
      justify-content: center;
    }

    .left img {
      width: 100%;
      height: auto;
      border-radius: 15px;
      box-shadow: 0 6px 16px rgba(0,0,0,0.5);
    }

    .right {
      padding: 40px 30px;
      color: #ffffff;
      display: flex;
      flex-direction: column;
      justify-content: space-between;
      background: linear-gradient(to bottom right, #0077b6, #00b4d8);
    }

    .right h2 {
      font-size: 28px;
      margin-bottom: 25px;
      text-align: center;
      color: #e0f7fa;
      letter-spacing: 1px;
    }

    .detail {
      font-size: 16px;
      display: flex;
      justify-content: space-between;
      margin: 10px 0;
      padding-bottom: 6px;
      border-bottom: 1px dashed rgba(255,255,255,0.4);
    }

    .detail span {
      font-weight: 600;
      color: #caf0f8;
    }

    .barcode {
      margin-top: 30px;
      height: 30px;
      background: repeating-linear-gradient(
        to right,
        #ffffff,
        #ffffff 2px,
        transparent 2px,
        transparent 5px
      );
      opacity: 0.7;
      border-radius: 4px;
    }

    button {
      margin-top: 35px;
      padding: 14px;
      width: 100%;
      border: none;
      border-radius: 30px;
      background: linear-gradient(to right, #00b4d8, #0077b6);
      font-size: 16px;
      font-weight: bold;
      color: #fff;
      cursor: pointer;
      transition: 0.3s;
      box-shadow: 0 5px 15px rgba(0, 180, 216, 0.4);
    }

    button:hover {
      background: linear-gradient(to right, #0077b6, #00b4d8);
      transform: scale(1.03);
    }

    form {
      margin-top: 20px;
    }

    @media(max-width: 768px) {
      .ticket {
        grid-template-columns: 1fr;
        border-radius: 20px;
        border-left: none;
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
    <h2>🎟️ Booking Summary</h2>
    <div class="detail">Event: <span><%= eventTitle %></span></div>
    <div class="detail">Date: <span><%= eventDate %></span></div>
    <div class="detail">Name: <span><%= name %></span></div>
    <div class="detail">Email: <span><%= email %></span></div>
    <div class="detail">Tickets: <span><%= ticketCount %></span></div>
    <div class="detail">Total: <span>₹<%= totalAmount %></span></div>

    <div class="barcode"></div>

    <form action="CheckoutServlet" method="post">
      <input type="hidden" name="eventId" value="<%= eventId %>">
      <input type="hidden" name="eventTitle" value="<%= eventTitle %>">
      <input type="hidden" name="eventDate" value="<%= eventDate %>">
      <input type="hidden" name="name" value="<%= name %>">
      <input type="hidden" name="email" value="<%= email %>">
      <input type="hidden" name="ticketCount" value="<%= ticketCount %>">
      <input type="hidden" name="ticketPrice" value="<%= ticketPrice %>">
      <input type="hidden" name="totalAmount" value="<%= totalAmount %>">
      <input type="hidden" name="poster" value="<%= eventImage %>">
      <button type="submit">✅ Confirm & Proceed</button>
    </form>
  </div>
</div>

</body>
</html>
