<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    String userName = (String) session.getAttribute("user_name");
%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Planora Conference Dashboard</title>
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <style>
    * {
      margin: 0;
      padding: 0;
      box-sizing: border-box;
    }

    body {
      font-family: 'Segoe UI', sans-serif;
      background: linear-gradient(to bottom right, #3b2bd4, #a678f1);
      color: white;
      overflow-x: hidden;
    }

    .navbar {
      display: flex;
      justify-content: space-between;
      align-items: center;
      padding: 20px 50px;
      background: rgba(255, 255, 255, 0.05);
      backdrop-filter: blur(10px);
      border-bottom: 1px solid rgba(255, 255, 255, 0.1);
      position: fixed;
      width: 100%;
      top: 0;
      z-index: 10;
    }

    .logo {
      font-size: 28px;
      font-weight: bold;
      color: #ffffff;
      letter-spacing: 3px;
      text-shadow: 2px 2px 8px rgba(0,0,0,0.3);
    }

    .nav-links {
      display: flex;
      gap: 30px;
      list-style: none;
    }

    .nav-links li a {
      color: white;
      text-decoration: none;
      font-weight: 500;
      font-size: 16px;
      position: relative;
    }

    .nav-links li a::after {
      content: "";
      position: absolute;
      width: 0%;
      height: 2px;
      bottom: -4px;
      left: 0;
      background-color: white;
      transition: width 0.3s;
    }

    .nav-links li a:hover::after {
      width: 100%;
    }

    .btns {
      display: flex;
      gap: 10px;
    }

    .btn {
      padding: 10px 20px;
      font-weight: 600;
      border-radius: 25px;
      border: none;
      cursor: pointer;
      transition: 0.3s ease;
      box-shadow: 0 0 12px rgba(0, 102, 255, 0.3);
    }

    .btn-register {
      background-color: #0066ff;
      color: white;
    }

    .btn-contact {
      background-color: white;
      color: #0066ff;
    }

    .btn:hover {
      transform: translateY(-2px) scale(1.05);
      box-shadow: 0 0 20px rgba(0, 102, 255, 0.5);
    }

    .welcome-banner {
      position: absolute;
      top: 100px;
      left: 60px;
      z-index: 2;
      font-size: 22px;
      font-weight: 500;
      color: #ffffff;
      text-shadow: 1px 1px 6px rgba(0,0,0,0.3);
    }

    .hero {
      position: relative;
      height: 100vh;
      display: flex;
      align-items: center;
      padding: 0 60px;
      overflow: hidden;
    }

    .hero-bg {
      position: absolute;
      top: 0;
      left: 0;
      width: 100%;
      height: 100%;
      background: linear-gradient(rgba(0,0,0,0.6), rgba(0,0,0,0.8)), url('conf4.jpg') center/cover no-repeat;
      filter: blur(3px);
      z-index: 0;
      pointer-events: none;
    }

    .stars {
      position: absolute;
      top: 0; left: 0;
      width: 100%;
      height: 100%;
      z-index: 1;
      pointer-events: none;
    }

    .stars span {
      position: absolute;
      width: 2px;
      height: 8px;
      background: white;
      animation: starFall 4s linear infinite;
      opacity: 0.6;
      border-radius: 1px;
    }

    @keyframes starFall {
      0% {
        transform: translateY(-100px);
        opacity: 0;
      }
      50% {
        opacity: 1;
      }
      100% {
        transform: translateY(100vh);
        opacity: 0;
      }
    }

    .hero-content {
      position: relative;
      z-index: 2;
      max-width: 600px;
      animation: fadeInUp 1.2s ease-out;
    }

    .hero h1 {
      font-size: 64px;
      font-weight: 800;
      line-height: 1.2;
      margin-bottom: 20px;
      text-shadow: 2px 2px 6px rgba(0,0,0,0.4);
    }

    .hero p {
      font-size: 20px;
      margin-bottom: 30px;
      color: #e0e0ff;
    }

    .btn-register-now {
      background-color: white;
      color: #0066ff;
      font-size: 16px;
      font-weight: bold;
      padding: 14px 32px;
      border: none;
      border-radius: 30px;
      cursor: pointer;
      box-shadow: 0 0 16px rgba(255, 255, 255, 0.3);
      transition: all 0.3s ease;
    }

    .btn-register-now:hover {
      background-color: #0066ff;
      color: white;
      transform: scale(1.08);
      box-shadow: 0 0 20px rgba(255, 255, 255, 0.6);
    }

    @keyframes fadeInUp {
      0% {
        opacity: 0;
        transform: translateY(40px);
      }
      100% {
        opacity: 1;
        transform: translateY(0);
      }
    }

    @media (max-width: 768px) {
      .navbar {
        flex-direction: column;
        align-items: flex-start;
        gap: 10px;
      }

      .hero {
        padding: 0 20px;
        text-align: center;
        justify-content: center;
      }

      .hero-content {
        align-items: center;
        text-align: center;
        max-width: 100%;
      }

      .nav-links {
        flex-wrap: wrap;
        gap: 15px;
      }
    }
  </style>
</head>
<body>

  <!-- Navbar -->
  <div class="navbar">
    <div class="logo">PLANORA</div>
    <ul class="nav-links">
      <li><a href="confdashboard.jsp">Home</a></li>
      <li><a href="confabout.jsp">About</a></li>
      <li><a href="confevent.jsp">Event</a></li>
      <li><a href="confupcoming_event.jsp">Upcoming Event</a></li>
      <li><a href="confmy_bookings.jsp">My Booking</a></li>
       <li><a href="confcontact.jsp">Contact Us </a></li>
    </ul>
    <div class="btns">
     <a href="conflogout.jsp" class="btn-register-now">Logout</a>

      
    </div>
  </div>

  <!-- Welcome Message -->
  <div class="welcome-banner">
    👋 Welcome, <%= userName != null ? userName : "Guest" %>!
  </div>

  <!-- Hero Section -->
  <section class="hero">
    <div class="hero-bg"></div>

    <div class="stars">
      <% for (int i = 0; i < 50; i++) { %>
        <span style="left: <%= (int)(Math.random()*100) %>%; animation-delay: <%= (Math.random()*5) %>s;"></span>
      <% } %>
    </div>

    <div class="hero-content">
      <h1>Planora Presents<br>CONFERENCE Hub</h1>
      <p> Planora Conference Hub is your gateway to transformative events 🎤, visionary speakers 🧠, and powerful networking 🤝. 🚀 Discover innovation, exchange ideas 💡, and shape the future together—only at Planora! ✨</p>
     <a href="confevent.jsp" class="btn-register-now">Explore More</a>

    </div>
  </section>

</body>
</html>
