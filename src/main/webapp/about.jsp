<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>About Us - Planora</title>
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600;700&display=swap" rel="stylesheet">
  <style>
    * {
      margin: 0; padding: 0; box-sizing: border-box;
    }

    body {
      font-family: 'Inter', sans-serif;
      background: linear-gradient(180deg, #0d001a, #2d004d);
      color: #eee;
      min-height: 100vh;
      overflow-x: hidden;
      position: relative;
    }

    .navbar {
      background: rgba(30, 0, 60, 0.95);
      display: flex;
      justify-content: space-between;
      align-items: center;
      padding: 20px 40px;
      border-bottom: 1px solid rgba(255,255,255,0.1);
      box-shadow: 0 4px 15px rgba(0, 0, 0, 0.3);
      z-index: 10;
      position: sticky;
      top: 0;
    }

    .logo {
      font-size: 32px;
      font-weight: 700;
      background: linear-gradient(to right, #a678ff, #dbb2ff);
      -webkit-background-clip: text;
      -webkit-text-fill-color: transparent;
      animation: glowText 2s ease-in-out infinite alternate;
    }

    .navbar a {
      padding: 10px 22px;
      background: #9b59b6;
      color: white;
      text-decoration: none;
      border-radius: 12px;
      font-weight: 600;
      transition: all 0.3s ease;
    }

    .navbar a:hover {
      background: #8e44ad;
      transform: scale(1.05);
    }

    .content {
      max-width: 1400px;
      margin: 80px auto;
      padding: 0 30px;
      display: flex;
      flex-wrap: wrap;
      justify-content: space-around;
      gap: 50px;
      position: relative;
      z-index: 10;
    }

    .card {
      background: rgba(255, 255, 255, 0.07);
      backdrop-filter: blur(14px);
      border-radius: 20px;
      box-shadow: 0 25px 60px rgba(0, 0, 0, 0.3);
      border: 1px solid rgba(255,255,255,0.1);
      width: 340px;
      padding: 28px;
      text-align: center;
      transition: transform 0.4s ease, box-shadow 0.4s ease;
      animation: fadeUp 1.2s ease forwards;
      opacity: 0;
    }

    .card:hover {
      transform: translateY(-10px);
      box-shadow: 0 30px 80px rgba(173, 122, 255, 0.4);
    }

    .card img {
      width: 100%;
      height: 200px;
      object-fit: cover;
      border-radius: 14px;
      margin-bottom: 20px;
      border: 1px solid rgba(255,255,255,0.1);
    }

    .card h2 {
      font-size: 22px;
      margin-bottom: 12px;
      color: #dbb2ff;
    }

    .card p {
      font-size: 15px;
      line-height: 1.7;
      color: #e0d6ff;
      text-align: justify;
    }

    @keyframes fadeUp {
      0% { opacity: 0; transform: translateY(40px); }
      100% { opacity: 1; transform: translateY(0); }
    }

    @keyframes glowText {
      from {
        text-shadow: 0 0 8px #a678ff, 0 0 16px #dbb2ff;
      }
      to {
        text-shadow: 0 0 12px #c094ff, 0 0 24px #d9a8ff;
      }
    }

    .particles {
      position: fixed;
      top: 0; left: 0;
      width: 100%; height: 100%;
      z-index: 1;
      overflow: hidden;
      pointer-events: none;
    }

    .particles span {
      position: absolute;
      display: block;
      background: rgba(255, 255, 255, 0.8);
      width: 3px;
      height: 3px;
      border-radius: 50%;
      animation: fall 12s linear infinite;
      box-shadow: 0 0 6px rgba(255,255,255,0.5);
    }

    @keyframes fall {
      0% { transform: translateY(0); opacity: 1; }
      100% { transform: translateY(1000px); opacity: 0; }
    }

    @media (max-width: 768px) {
      .navbar {
        flex-direction: column;
        gap: 10px;
        padding: 14px;
      }

      .card {
        width: 90%;
      }
    }
  </style>
</head>
<body>

<!-- Falling Stars -->
<div class="particles">
  <% for (int i = 0; i < 120; i++) {
       int left = (int)(Math.random() * 100);
       int top = -10 + (int)(Math.random() * 10);
       int size = 1 + (int)(Math.random() * 2);
       int delay = (int)(Math.random() * 10);
  %>
    <span style="left:<%=left%>vw; top:<%=top%>vh; width:<%=size%>px; height:<%=size%>px; animation-delay:<%=delay%>s;"></span>
  <% } %>
</div>

<!-- Navbar -->
<div class="navbar">
  <div class="logo">Planora</div>
  <a href="dashboard.jsp">← Back to Dashboard</a>
</div>

<!-- Content -->
<div class="content">
  <div class="card">
    <img src="a1.jpg" alt="About Planora">
    <h2>About Planora</h2>
    <p>
      Planora is an innovative event management platform designed to simplify the planning, registration, and coordination of events. 
      From college fests to professional conferences, Planora ensures a smooth and organized experience for organizers and participants alike.
    </p>
  </div>

  <div class="card">
    <img src="a2.png" alt="Our Mission">
    <h2>Our Mission</h2>
    <p>
      Our mission is to empower organizers with efficient tools to manage events effortlessly — from creating listings to handling registrations. 
      Planora brings together creativity, technology, and management to help every event run successfully and stress-free.
    </p>
  </div>

  <div class="card">
    <img src="conf7.jpg" alt="Meet Our Team">
    <h2>Meet Our Team</h2>
    <p>
      Planora is built by a team of dedicated developers, designers, and event planners who understand the real-world challenges of event organization. 
      We’re passionate about creating seamless, user-friendly solutions that elevate every event experience.
    </p>
  </div>
</div>

</body>
</html>
