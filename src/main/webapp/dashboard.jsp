<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page session="true" %>
<%
  String userName = (String) session.getAttribute("user_name");
%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Dashboard - Planora</title>
  <link href="https://fonts.googleapis.com/css2?family=Inter:wght@500;700&display=swap" rel="stylesheet">
  <style>
    * {
      margin: 0;
      padding: 0;
      box-sizing: border-box;
      font-family: 'Inter', sans-serif;
    }

    body {
      background: #1c002e;
      color: #fff;
      height: 100vh;
      overflow: hidden;
      display: flex;
    }

    .navbar {
      position: fixed;
      top: 0;
      left: 0;
      width: 100%;
      padding: 30px 60px;
      background: linear-gradient(90deg, rgba(28,0,46,0.8), rgba(0,0,0,0.3));
      display: flex;
      justify-content: space-between;
      align-items: center;
      z-index: 1000;
    }

    .navbar .logo {
      font-size: 28px;
      font-weight: bold;
    }

    .navbar .logo span {
      background: #ff5a3c;
      color: #fff;
      padding: 4px 8px;
      border-radius: 6px;
    }

    .navbar ul {
      list-style: none;
      display: flex;
      gap: 30px;
    }

    .navbar ul li a {
      text-decoration: none;
      color: white;
    }

    .call-btn {
      background: #ff5a3c;
      padding: 10px 20px;
      border-radius: 20px;
      color: white;
      font-weight: bold;
      text-decoration: none;
    }

    .left {
      width: 50%;
      padding: 100px 80px;
      background: #24003f;
      display: flex;
      flex-direction: column;
      justify-content: center;
    }

    .left h3,
    .left h1,
    .left p,
    .buttons {
      opacity: 0;
      transform: translateY(30px);
      animation: fadeInUp 1s ease forwards;
    }

    .left h3 { animation-delay: 0.2s; }
    .left h1 { animation-delay: 0.4s; }
    .left p { animation-delay: 0.6s; }
    .buttons { animation-delay: 0.8s; }

    @keyframes fadeInUp {
      to {
        opacity: 1;
        transform: translateY(0);
      }
    }

    .left h3 {
      color: #f8485e;
      font-size: 28px;
      margin-bottom: 20px;
    }

    .left h1 {
      font-size: 72px;
      font-weight: 700;
      margin-bottom: 30px;
    }

    .left p {
      font-size: 20px;
      color: #ccc;
      margin-bottom: 50px;
      max-width: 520px;
    }

    .buttons {
      display: flex;
      gap: 20px;
    }

    .btn {
      padding: 14px 36px;
      border-radius: 30px;
      font-size: 16px;
      font-weight: 600;
      text-decoration: none;
      border: 2px solid #00aaff;
      color: #00aaff;
      transition: 0.3s;
    }

    .btn:hover {
      background: #00aaff;
      color: #fff;
    }

    .right {
      width: 50%;
      position: relative;
      background: url('img3.jpg') no-repeat center center/cover;
      overflow: hidden;
    }

    .overlay {
      position: absolute;
      top: 0; left: 0;
      width: 100%;
      height: 100%;
      background: rgba(0,0,0,0.5);
      z-index: 1;
    }

    .stars {
      position: absolute;
      top: 0;
      left: 0;
      width: 100%;
      height: 100%;
      z-index: 2;
      pointer-events: none;
    }

    .star-dot {
      position: absolute;
      width: 4px;
      height: 4px;
      background: white;
      border-radius: 50%;
      box-shadow: 0 0 8px #fff;
      animation: fallStar linear infinite;
    }

    @keyframes fallStar {
      0% {
        transform: translateY(-10px);
        opacity: 0;
      }
      10% {
        opacity: 1;
      }
      100% {
        transform: translateY(110vh);
        opacity: 0;
      }
    }

    @media (max-width: 768px) {
      body {
        flex-direction: column;
      }

      .left, .right {
        width: 100%;
        height: 50vh;
      }

      .left {
        padding: 40px;
      }

      .left h1 {
        font-size: 42px;
      }

      .left p {
        font-size: 15px;
      }

      .btn {
        padding: 10px 20px;
        font-size: 14px;
      }
    }
  </style>
</head>
<body>

<div class="navbar">
  <div class="logo"><span>P</span>lanora</div>
  <ul>
    <li><a href="dashboard.jsp">Home</a></li>
    <li><a href="about.jsp">About</a></li>
    <li><a href="event.jsp">Events</a></li>
    <li><a href="upcoming_event.jsp">Upcoming Events</a></li>
    <li><a href="my_bookings.jsp">My Bookings</a></li>
    <li><a href="contact.jsp">Contact</a></li>
  </ul>
  <a href="logout.jsp" class="call-btn">Logout</a>
</div>

<div class="left">
  <% if (userName != null) { %>
    <p style="font-size: 20px; color: #00ffaa; margin-bottom: 20px;">
      Welcome, <strong><%= userName %></strong>!
    </p>
  <% } %>
  <h3>Time to celebrate</h3>
  <h1>
    Organization of<br><span style="color:#f8485e">Planora</span> events
  </h1>
  <p>
    📋 Manage your event participants, 🎁 explore exciting offers, and ✨ enjoy seamless planning with Planora. 🎉 Let the fun begin
  </p>
  <div class="buttons">
    <a href="event.jsp" class="btn">Book Event</a>
    <a href="upcoming_event.jsp" class="btn">Upcoming Events</a>
  </div>
</div>

<div class="right">
  <div class="overlay"></div>
  <div class="stars" id="stars"></div>
</div>

<script>
  function createStarDot() {
    const star = document.createElement('div');
    star.className = 'star-dot';
    star.style.left = Math.random() * 100 + 'vw';
    star.style.top = '-' + Math.random() * 20 + 'px';
    star.style.animationDuration = (Math.random() * 3 + 4) + 's';
    star.style.opacity = Math.random() * 0.8 + 0.2;
    document.getElementById('stars').appendChild(star);
    setTimeout(() => star.remove(), 8000);
  }

  setInterval(createStarDot, 150);
</script>

</body>
</html>
