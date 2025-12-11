<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ page import="java.util.List" %>
<%
    List<String> confirmedEvents = (List<String>) session.getAttribute("confirmedEvents");
%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Book Events - Planora</title>
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600&display=swap" rel="stylesheet">
  <style>
    * { margin: 0; padding: 0; box-sizing: border-box; }

    body {
      font-family: 'Inter', sans-serif;
      min-height: 100vh;
      background: linear-gradient(to right, #0f2027, #203a43, #2c5364);
      color: #fff;
      padding: 60px 20px;
      position: relative;
      overflow-y: auto;
    }

    /* ❄️ Snow Canvas */
    #snow-canvas {
      position: fixed;
      top: 0;
      left: 0;
      width: 100%;
      height: 100%;
      pointer-events: none;
      z-index: 0;
    }

    /* 🫧 Bubble Animation */
    .bubble {
      position: fixed;
      bottom: -100px;
      width: 20px;
      height: 20px;
      background: rgba(255, 255, 255, 0.1);
      border-radius: 50%;
      animation: rise 15s infinite ease-in;
      z-index: 1;
    }
    @keyframes rise {
      0% {
        transform: translateY(0) scale(1);
        opacity: 0.3;
      }
      100% {
        transform: translateY(-120vh) scale(1.5);
        opacity: 0;
      }
    }
    .bubble:nth-child(2) { left: 10%; animation-delay: 2s; }
    .bubble:nth-child(3) { left: 25%; animation-delay: 4s; }
    .bubble:nth-child(4) { left: 40%; animation-delay: 6s; }
    .bubble:nth-child(5) { left: 60%; animation-delay: 1s; }
    .bubble:nth-child(6) { left: 75%; animation-delay: 3s; }
    .bubble:nth-child(7) { left: 90%; animation-delay: 5s; }

    .back-btn {
      position: absolute;
      top: 20px;
      left: 20px;
      padding: 10px 18px;
      background: rgba(255, 255, 255, 0.1);
      border: 1px solid rgba(255, 255, 255, 0.2);
      backdrop-filter: blur(10px);
      border-radius: 30px;
      color: #ffffff;
      text-decoration: none;
      font-weight: 500;
      font-size: 14px;
      transition: all 0.3s ease;
      box-shadow: 0 4px 12px rgba(0,0,0,0.2);
      z-index: 2;
    }
    .back-btn:hover {
      background: rgba(255, 255, 255, 0.2);
      transform: scale(1.05);
    }

    h1 {
      text-align: center;
      font-size: 40px;
      margin-bottom: 60px;
      font-weight: 700;
      position: relative;
      z-index: 2;
    }

    .grid-container {
      display: grid;
      grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
      gap: 40px;
      max-width: 1280px;
      margin: 0 auto;
      position: relative;
      z-index: 2;
    }

    .card {
      background: rgba(255, 255, 255, 0.06);
      backdrop-filter: blur(20px);
      border-radius: 18px;
      box-shadow: 0 10px 35px rgba(0, 0, 0, 0.4);
      overflow: hidden;
      display: flex;
      flex-direction: column;
      border: 1px solid rgba(255, 255, 255, 0.15);
      transition: transform 0.3s ease;
    }

    .card:hover {
      transform: translateY(-5px);
    }

    .card img {
      width: 100%;
      height: 200px;
      object-fit: cover;
      border-top-left-radius: 18px;
      border-top-right-radius: 18px;
    }

    .card-body {
      padding: 20px 25px;
      display: flex;
      flex-direction: column;
      justify-content: space-between;
    }

    .card-category { font-size: 12px; color: #b6d8ff; text-transform: uppercase; margin-bottom: 8px; }
    .card-title { font-size: 22px; font-weight: 700; margin-bottom: 6px; }
    .card-text { font-size: 15px; color: #e0e0e0; margin-bottom: 12px; line-height: 1.5; }
    .card-price { font-size: 14px; font-weight: bold; color: #ffdd57; margin-bottom: 10px; }
    .confirmed-msg { color: #00ff99; font-weight: bold; margin-bottom: 10px; }

    .card-btn {
      background: linear-gradient(to right, #00c6ff, #0072ff);
      color: white;
      padding: 12px 24px;
      border-radius: 30px;
      font-weight: 600;
      text-decoration: none;
      text-align: center;
      box-shadow: 0 4px 20px rgba(0, 114, 255, 0.4);
      transition: all 0.3s ease;
    }

    .card-btn:hover {
      transform: translateY(-2px);
      box-shadow: 0 6px 30px rgba(0, 114, 255, 0.6);
    }
  </style>
</head>
<body>

<canvas id="snow-canvas"></canvas>

<!-- 🫧 Bubbles -->
<div class="bubble"></div>
<div class="bubble"></div>
<div class="bubble"></div>
<div class="bubble"></div>
<div class="bubble"></div>
<div class="bubble"></div>

<a href="dashboard.jsp" class="back-btn">← Back to Dashboard</a>
<h1>Book an Event at Planora</h1>

<div class="grid-container">
  <!-- Card 1 -->
  <div class="card">
    <img src="img4.avif" alt="The Beatles LOVE">
    <div class="card-body">
      <div class="card-category">Entertainment</div>
      <div class="card-title">The Beatles LOVE</div>
      <div class="card-text">A vibrant reinterpretation of the legacy by Cirque du Soleil.</div>
      <div class="card-price">₹799 per ticket</div>
      <% if (confirmedEvents != null && confirmedEvents.contains("201")) { %>
        <div class="confirmed-msg">✅ Booking Confirmed</div>
      <% } %>
      <a href="book_ticket.jsp?eventId=201&title=The Beatles LOVE&date=2025-07-01" class="card-btn">Buy Tickets</a>
    </div>
  </div>

  <!-- Card 2 -->
  <div class="card">
    <img src="img5.jpg" alt="Terry Fator">
    <div class="card-body">
      <div class="card-category">Comedy Show</div>
      <div class="card-title">Terry Fator</div>
      <div class="card-text">Experience side-splitting ventriloquism and heartfelt performances.</div>
      <div class="card-price">₹599 per ticket</div>
      <% if (confirmedEvents != null && confirmedEvents.contains("202")) { %>
        <div class="confirmed-msg">✅ Booking Confirmed</div>
      <% } %>
      <a href="book_ticket.jsp?eventId=202&title=Terry Fator&date=2025-07-08" class="card-btn">Buy Tickets</a>
    </div>
  </div>

  <!-- Card 3 -->
  <div class="card">
    <img src="img6.jpg" alt="Las Vegas Shows">
    <div class="card-body">
      <div class="card-category">Festival</div>
      <div class="card-title">Upcoming Las Vegas Shows</div>
      <div class="card-text">From concerts to comedy, explore Palanora's full entertainment lineup.</div>
      <div class="card-price">₹699 per ticket</div>
      <% if (confirmedEvents != null && confirmedEvents.contains("203")) { %>
        <div class="confirmed-msg">✅ Booking Confirmed</div>
      <% } %>
      <a href="book_ticket.jsp?eventId=203&title=Las Vegas Shows&date=2025-07-15" class="card-btn">View Events</a>
    </div>
  </div>

  <!-- Card 4 -->
  <div class="card">
    <img src="img7.jpg" alt="Shin Lim">
    <div class="card-body">
      <div class="card-category">Magic Show</div>
      <div class="card-title">Shin Lim</div>
      <div class="card-text">Mind-blowing illusions and sleight-of-hand by AGT winner Shin Lim.</div>
      <div class="card-price">₹899 per ticket</div>
      <% if (confirmedEvents != null && confirmedEvents.contains("204")) { %>
        <div class="confirmed-msg">✅ Booking Confirmed</div>
      <% } %>
      <a href="book_ticket.jsp?eventId=204&title=Shin Lim&date=2025-07-22" class="card-btn">Buy Tickets</a>
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
    for (let i = 0; i < 100; i++) {
      snowflakes.push({
        x: Math.random() * width,
        y: Math.random() * height,
        radius: Math.random() * 3 + 1,
        speedY: Math.random() * 1 + 0.5,
        speedX: Math.random() * 0.5 - 0.25
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
