<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ page import="java.util.List" %>
<%
    List<String> confirmedEvents = (List<String>) session.getAttribute("confirmedEvents");
%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Conference Events - Planora</title>
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600&display=swap" rel="stylesheet">
  <style>
    * { margin: 0; padding: 0; box-sizing: border-box; }

    body {
      font-family: 'Inter', sans-serif;
      min-height: 100vh;
      background: linear-gradient(to right, #1f1c2c, #928dab);
      color: #ffffff;
      padding: 60px 20px;
      position: relative;
      overflow-y: auto;
    }

    #snow-canvas {
      position: fixed;
      top: 0;
      left: 0;
      width: 100%;
      height: 100%;
      pointer-events: none;
      z-index: 0;
    }

    .bubble {
      position: fixed;
      bottom: -100px;
      width: 15px;
      height: 15px;
      background: rgba(255, 255, 255, 0.1);
      border-radius: 50%;
      animation: rise 18s infinite ease-in;
      z-index: 1;
    }
    @keyframes rise {
      0% {
        transform: translateY(0) scale(1);
        opacity: 0.3;
      }
      100% {
        transform: translateY(-120vh) scale(1.6);
        opacity: 0;
      }
    }
    .bubble:nth-child(2) { left: 12%; animation-delay: 1s; }
    .bubble:nth-child(3) { left: 28%; animation-delay: 3s; }
    .bubble:nth-child(4) { left: 48%; animation-delay: 5s; }
    .bubble:nth-child(5) { left: 68%; animation-delay: 2s; }
    .bubble:nth-child(6) { left: 82%; animation-delay: 4s; }

    .back-btn {
      position: absolute;
      top: 20px;
      left: 20px;
      padding: 10px 20px;
      background: rgba(255, 255, 255, 0.08);
      border: 1px solid rgba(255, 255, 255, 0.2);
      backdrop-filter: blur(10px);
      border-radius: 30px;
      color: #ffffff;
      text-decoration: none;
      font-weight: 500;
      font-size: 14px;
      transition: all 0.3s ease;
      box-shadow: 0 4px 12px rgba(0,0,0,0.25);
      z-index: 2;
    }
    .back-btn:hover {
      background: rgba(255, 255, 255, 0.2);
      transform: scale(1.05);
    }

    h1 {
      text-align: center;
      font-size: 42px;
      margin-bottom: 50px;
      font-weight: 700;
      color: #f5f5f5;
      z-index: 2;
      position: relative;
    }

    .grid-container {
      display: grid;
      grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
      gap: 40px;
      max-width: 1300px;
      margin: 0 auto;
      position: relative;
      z-index: 2;
    }

    .card {
      background: rgba(255, 255, 255, 0.06);
      backdrop-filter: blur(20px);
      border-radius: 18px;
      box-shadow: 0 10px 35px rgba(0, 0, 0, 0.5);
      overflow: hidden;
      display: flex;
      flex-direction: column;
      transition: transform 0.3s ease;
      border: 1px solid rgba(255, 255, 255, 0.15);
    }

    .card:hover {
      transform: translateY(-5px);
    }

    .card img {
      width: 100%;
      height: 190px;
      object-fit: cover;
    }

    .card-body {
      padding: 20px 24px;
      display: flex;
      flex-direction: column;
    }

    .card-category { font-size: 13px; color: #b2e3ff; text-transform: uppercase; margin-bottom: 8px; }
    .card-title { font-size: 21px; font-weight: 700; margin-bottom: 6px; color: #fff; }
    .card-text { font-size: 15px; color: #e3e3e3; margin-bottom: 12px; line-height: 1.5; }
    .card-price { font-size: 14px; font-weight: bold; color: #fddb3a; margin-bottom: 10px; }
    .confirmed-msg { color: #2affb2; font-weight: bold; margin-bottom: 10px; }

    .card-btn {
      background: linear-gradient(to right, #6dd5ed, #2193b0);
      color: white;
      padding: 12px 24px;
      border-radius: 30px;
      font-weight: 600;
      text-decoration: none;
      text-align: center;
      transition: all 0.3s ease;
    }

    .card-btn:hover {
      transform: translateY(-2px);
      box-shadow: 0 6px 30px rgba(33, 147, 176, 0.6);
    }
  </style>
</head>
<body>

<canvas id="snow-canvas"></canvas>

<!-- 🌫 Floating Bubbles -->
<div class="bubble"></div>
<div class="bubble"></div>
<div class="bubble"></div>
<div class="bubble"></div>
<div class="bubble"></div>

<a href="confdashboard.jsp" class="back-btn">← Back to Dashboard</a>
<h1>Planora Conference Events</h1>

<div class="grid-container">
  <!-- Card 1 -->
  <div class="card">
    <img src="conf8.jpg" alt="AI & Future Tech">
    <div class="card-body">
      <div class="card-category">Technology</div>
      <div class="card-title">AI & Future Tech</div>
      <div class="card-text">Explore cutting-edge breakthroughs in artificial intelligence and robotics.</div>
      <div class="card-price">₹499 per participant</div>
      <% if (confirmedEvents != null && confirmedEvents.contains("301")) { %>
        <div class="confirmed-msg">✅ Registered</div>
      <% } %>
      <a href="confbook_ticket.jsp?eventId=301&title=AI & Future Tech&date=2025-08-01" class="card-btn">Register Now</a>
    </div>
  </div>

  <!-- Card 2 -->
  <div class="card">
    <img src="conf9.jpg" alt="Green Energy Summit">
    <div class="card-body">
      <div class="card-category">Environment</div>
      <div class="card-title">Green Energy Summit</div>
      <div class="card-text">Sustainable energy solutions and clean tech innovations discussed globally.</div>
      <div class="card-price">₹599 per participant</div>
      <% if (confirmedEvents != null && confirmedEvents.contains("302")) { %>
        <div class="confirmed-msg">✅ Registered</div>
      <% } %>
      <a href="confbook_ticket.jsp?eventId=302&title=Green Energy Summit&date=2025-08-10" class="card-btn">Register Now</a>
    </div>
  </div>

  <!-- Card 3 -->
  <div class="card">
    <img src="conf10.jpg" alt="Health & Wellness Expo">
    <div class="card-body">
      <div class="card-category">Healthcare</div>
      <div class="card-title">Health & Wellness Expo</div>
      <div class="card-text">Join experts promoting mental, physical, and community health practices.</div>
      <div class="card-price">₹450 per participant</div>
      <% if (confirmedEvents != null && confirmedEvents.contains("303")) { %>
        <div class="confirmed-msg">✅ Registered</div>
      <% } %>
      <a href="confbook_ticket.jsp?eventId=303&title=Health & Wellness Expo&date=2025-08-15" class="card-btn">Register Now</a>
    </div>
  </div>
  
  <!-- Card 4 -->
<div class="card">
  <img src="conf11.jpg" alt="Cybersecurity Conference">
  <div class="card-body">
    <div class="card-category">Cybersecurity</div>
    <div class="card-title">Cybersecurity Conference</div>
    <div class="card-text">Stay ahead of cyber threats with insights from leading security experts.</div>
    <div class="card-price">₹649 per participant</div>
    <% if (confirmedEvents != null && confirmedEvents.contains("304")) { %>
      <div class="confirmed-msg">✅ Registered</div>
    <% } %>
    <a href="confbook_ticket.jsp?eventId=304&title=Cybersecurity Conference&date=2025-08-20" class="card-btn">Register Now</a>
  </div>
</div>
  
  
  <!-- Card 5 -->
<div class="card">
  <img src="conf12.jpg" alt="Women in Tech Forum">
  <div class="card-body">
    <div class="card-category">Leadership</div>
    <div class="card-title">Women in Tech Forum</div>
    <div class="card-text">Celebrate innovation and leadership by women shaping the tech world.</div>
    <div class="card-price">₹499 per participant</div>
    <% if (confirmedEvents != null && confirmedEvents.contains("305")) { %>
      <div class="confirmed-msg">✅ Registered</div>
    <% } %>
    <a href="confbook_ticket.jsp?eventId=305&title=Women in Tech Forum&date=2025-08-25" class="card-btn">Register Now</a>
  </div>
</div>
  
  
</div>

<!-- ❄️ Snow Animation JS -->
<script>
  const canvas = document.getElementById("snow-canvas");
  const ctx = canvas.getContext("2d");

  let width = window.innerWidth;
  let height = window.innerHeight;
  canvas.width = width;
  canvas.height = height;

  let snowflakes = [];

  function createSnowflakes() {
    for (let i = 0; i < 80; i++) {
      snowflakes.push({
        x: Math.random() * width,
        y: Math.random() * height,
        radius: Math.random() * 2 + 1,
        speedY: Math.random() * 0.8 + 0.5,
        speedX: Math.random() * 0.3 - 0.15
      });
    }
  }

  function drawSnowflakes() {
    ctx.clearRect(0, 0, width, height);
    ctx.fillStyle = "white";
    ctx.beginPath();
    for (let flake of snowflakes) {
      ctx.moveTo(flake.x, flake.y);
      ctx.arc(flake.x, flake.y, flake.radius, 0, Math.PI * 2);
    }
    ctx.fill();
    updateSnowflakes();
  }

  function updateSnowflakes() {
    for (let flake of snowflakes) {
      flake.y += flake.speedY;
      flake.x += flake.speedX;
      if (flake.y > height) {
        flake.y = 0;
        flake.x = Math.random() * width;
      }
    }
  }

  function animateSnow() {
    drawSnowflakes();
    requestAnimationFrame(animateSnow);
  }

  window.addEventListener("resize", () => {
    width = window.innerWidth;
    height = window.innerHeight;
    canvas.width = width;
    canvas.height = height;
  });

  createSnowflakes();
  animateSnow();
</script>

</body>
</html>
