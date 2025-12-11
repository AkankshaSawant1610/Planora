<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>About the Conference - Planora</title>
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
      background: linear-gradient(to right, #e4aaff, #ffb3f7);
      -webkit-background-clip: text;
      -webkit-text-fill-color: transparent;
      letter-spacing: 2px;
    }

    .navbar a {
      padding: 10px 22px;
      background: #c471ed;
      color: white;
      text-decoration: none;
      border-radius: 10px;
      font-weight: 600;
      transition: 0.3s ease;
    }

    .navbar a:hover {
      background: #a239ca;
    }

    .content {
      max-width: 1400px;
      margin: 100px auto;
      padding: 0 30px;
      display: flex;
      flex-wrap: wrap;
      justify-content: center;
      gap: 50px;
      position: relative;
      z-index: 10;
    }

    .card {
      background: rgba(255, 255, 255, 0.1);
      backdrop-filter: blur(20px);
      border-radius: 20px;
      box-shadow: 0 25px 50px rgba(0, 0, 0, 0.4);
      width: 360px;
      padding: 30px;
      text-align: center;
      transition: transform 0.3s ease, box-shadow 0.3s ease;
      animation: fadeUp 1s ease forwards;
      opacity: 0;
    }

    .card:hover {
      transform: translateY(-12px) scale(1.02);
      box-shadow: 0 30px 70px rgba(255, 192, 255, 0.4);
    }

    .card img {
      width: 100%;
      height: 220px;
      object-fit: cover;
      border-radius: 14px;
      margin-bottom: 20px;
    }

    .card h2 {
      font-size: 22px;
      margin-bottom: 14px;
      color: #ffd6ff;
    }

    .card p {
      font-size: 15.5px;
      line-height: 1.8;
      color: #f0e6ff;
      text-align: justify;
    }

    @keyframes fadeUp {
      0% { opacity: 0; transform: translateY(40px); }
      100% { opacity: 1; transform: translateY(0); }
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
  <div class="logo">Planora </div>
  <a href="confdashboard.jsp">← Back to Dashboard</a>
</div>

<!-- Content -->
<div class="content">
  <div class="card">
    <img src="conf5.jpg" alt="Conference Overview">
    <h2>About the Conference</h2>
    <p>
      The Annual Innovation Conference 2025 by Planora brings together global visionaries, pioneers, and innovators. Dive into futuristic tech, sustainability breakthroughs, and entrepreneurial insights at the year’s most anticipated gathering.
    </p>
  </div>

  <div class="card">
    <img src="conf6.jpg" alt="Conference Mission">
    <h2>Our Mission</h2>
    <p>
      We’re here to inspire, engage, and empower. Our mission is to create a platform where transformative ideas are shared, collaborations spark, and innovation is celebrated.
    </p>
  </div>

  <div class="card">
    <img src="conf7.jpg" alt="Organizing Team">
    <h2>Organizing Committee</h2>
    <p>
      Driven by a passion for excellence, the Planora Team ensures every aspect of the conference delivers a world-class experience — from planning and logistics to speaker curation and tech execution.
    </p>
  </div>
</div>

</body>
</html>
