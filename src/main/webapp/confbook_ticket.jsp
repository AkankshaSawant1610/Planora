<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String eventId = request.getParameter("eventId");
    String eventTitle = request.getParameter("title");
    String eventDate = request.getParameter("date");

    String eventImage = "", duration = "", ticketPrice = "";
    if ("301".equals(eventId)) {
        eventImage = "conf8.jpg";
        duration = "9:00 AM - 1:00 PM";
        ticketPrice = "499";
    } else if ("302".equals(eventId)) {
        eventImage = "conf9.jpg";
        duration = "10:00 AM - 2:00 PM";
        ticketPrice = "599";
    } else if ("303".equals(eventId)) {
        eventImage = "conf10.jpg";
        duration = "11:00 AM - 3:00 PM";
        ticketPrice = "699";
    } else if ("304".equals(eventId)) {
        eventImage = "conf11.jpg";
        duration = "1:00 PM - 5:00 PM";
        ticketPrice = "649";
    } else if ("305".equals(eventId)) {
        eventImage = "conf12.jpg";
        duration = "2:00 PM - 6:00 PM";
        ticketPrice = "499";
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Register - Planora Conference</title>
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link href="https://fonts.googleapis.com/css2?family=Nunito:wght@400;700&display=swap" rel="stylesheet">
  <style>
    * {
      box-sizing: border-box;
      margin: 0;
      padding: 0;
    }

    html, body {
      height: 100%;
      font-family: 'Nunito', sans-serif;
      color: #fff;
    }

    body {
      background: url('b5.jpg') no-repeat center center fixed;
      background-size: cover;
      position: relative;
    }

    body::after {
      content: '';
      position: fixed;
      top: 0; left: 0; right: 0; bottom: 0;
      background-color: rgba(0, 0, 0, 0.6);
      backdrop-filter: blur(6px);
      z-index: -1;
    }

    .page-wrapper {
      position: relative;
      z-index: 1;
      display: flex;
      flex-direction: column;
      width: 100%;
      max-width: 1200px;
      gap: 30px;
      margin: 0 auto;
      padding: 20px;
    }

    .event-header {
      background: rgba(255, 255, 255, 0.07);
      border-radius: 15px;
      padding: 30px;
      text-align: center;
      backdrop-filter: blur(8px);
      box-shadow: 0 4px 20px rgba(0, 0, 0, 0.3);
    }

    .event-header h1 {
      font-size: 34px;
      color: #b3e0ff;
    }

    .event-header p {
      font-size: 16px;
      margin-top: 8px;
      color: #e0f7ff;
    }

    .grid-content {
      display: grid;
      grid-template-columns: 1fr 1.1fr;
      gap: 30px;
      background-color: rgba(255, 255, 255, 0.05);
      padding: 30px;
      border-radius: 20px;
      box-shadow: 0 10px 40px rgba(0,0,0,0.4);
    }

    .event-info {
      background: rgba(255, 255, 255, 0.06);
      border-radius: 20px;
      padding: 25px;
      backdrop-filter: blur(6px);
      box-shadow: 0 8px 25px rgba(0, 0, 0, 0.4);
    }

    .event-info img {
      width: 100%;
      height: auto;
      border-radius: 15px;
      margin-bottom: 20px;
    }

    .event-info h2 {
      font-size: 22px;
      margin-bottom: 10px;
      color: #d6f0ff;
    }

    .event-info p {
      margin: 6px 0;
      font-size: 15px;
      color: #e4faff;
    }

    .form-card {
      background: rgba(255, 255, 255, 0.08);
      border-radius: 20px;
      padding: 30px;
      box-shadow: 0 6px 20px rgba(0, 0, 0, 0.4);
    }

    .form-card h3 {
      text-align: center;
      font-size: 24px;
      margin-bottom: 20px;
      color: #b3d9ff;
    }

    input, select {
      width: 100%;
      padding: 14px 18px;
      margin: 12px 0;
      border: none;
      border-radius: 12px;
      font-size: 15px;
      background-color: #fff;
      color: #222;
    }

    input:focus, select:focus {
      outline: 2px solid #3399cc;
    }

    .price-summary {
      text-align: center;
      margin-top: 18px;
      font-weight: bold;
      font-size: 18px;
      color: #87ceeb;
    }

    button {
      width: 100%;
      margin-top: 24px;
      padding: 14px;
      border-radius: 30px;
      font-size: 16px;
      background: linear-gradient(to right, #0077b6, #00b4d8);
      color: #fff;
      border: none;
      font-weight: bold;
      cursor: pointer;
      transition: all 0.3s ease;
      box-shadow: 0 4px 16px rgba(0, 180, 216, 0.4);
    }

    button:hover {
      background: linear-gradient(to right, #00b4d8, #0077b6);
      transform: translateY(-2px);
    }

    @media (max-width: 768px) {
      .grid-content {
        grid-template-columns: 1fr;
        padding: 20px;
      }
    }
  </style>
</head>
<body>

<div class="page-wrapper">
  <div class="event-header">
    <h1><%= eventTitle %></h1>
    <p>Scheduled on <strong><%= eventDate %></strong></p>
  </div>

  <div class="grid-content">
    <div class="event-info">
      <img src="<%= eventImage %>" alt="Conference Banner">
      <h2>Conference Details</h2>
      <p><strong>Time:</strong> <%= duration %></p>
      <p><strong>Registration Fee:</strong> ₹<%= ticketPrice %></p>
    </div>

    <div class="form-card">
      <h3>📝 Conference Registration</h3>
      <form action="confconfirm_booking.jsp" method="post">
        <input type="hidden" name="eventId" value="<%= eventId %>">
        <input type="hidden" name="eventTitle" value="<%= eventTitle %>">
        <input type="hidden" name="eventDate" value="<%= eventDate %>">
        <input type="hidden" id="ticketPriceHidden" name="ticketPrice" value="<%= ticketPrice %>">

        <input type="text" name="name" placeholder="Full Name" required>
        <input type="email" name="email" placeholder="Email Address" required>

        <select name="ticketCount" id="ticketCount" required>
          <option value="" disabled selected>Select Number of Passes</option>
          <option value="1">1 Pass</option>
          <option value="2">2 Passes</option>
          <option value="3">3 Passes</option>
          <option value="4">4 Passes</option>
        </select>

        <div class="price-summary" id="totalPrice">Total: ₹0</div>

        <button type="submit">Register Now 🧾</button>
      </form>
    </div>
  </div>
</div>

<script>
  window.onload = function () {
    const ticketSelect = document.getElementById("ticketCount");
    ticketSelect.addEventListener("change", function () {
      const count = parseInt(this.value) || 0;
      const price = parseInt(document.getElementById("ticketPriceHidden").value) || 0;
      const total = count * price;
      document.getElementById("totalPrice").innerText = "Total: ₹" + total;
    });
  };
</script>

</body>
</html>
