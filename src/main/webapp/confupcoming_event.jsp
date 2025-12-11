<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Conference Events - Planora</title>
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link href="https://fonts.googleapis.com/css2?family=Playfair+Display:wght@600&family=Inter:wght@400;600&display=swap" rel="stylesheet">
  <style>
    html, body {
      margin: 0;
      padding: 0;
      font-family: 'Inter', sans-serif;
      height: 100%;
      overflow-x: hidden;
      color: #fff;
      position: relative;
    }

    body::before {
      content: "";
      position: fixed;
      top: 0; left: 0;
      width: 100%; height: 100%;
      background: radial-gradient(ellipse at bottom, #1b2735 0%, #090a0f 100%);
      z-index: -3;
    }

    canvas#stars {
      position: fixed;
      top: 0; left: 0;
      width: 100%;
      height: 100%;
      z-index: -2;
    }

    .back-btn {
      position: fixed;
      top: 20px;
      left: 20px;
      background: rgba(255, 255, 255, 0.15);
      backdrop-filter: blur(8px);
      color: #fff;
      padding: 10px 18px;
      border-radius: 10px;
      text-decoration: none;
      font-weight: 600;
      border: 1px solid rgba(255,255,255,0.2);
      transition: 0.3s;
      z-index: 1000;
    }

    .back-btn:hover {
      background: rgba(255, 255, 255, 0.3);
      transform: scale(1.05);
    }

    h1 {
      text-align: center;
      font-size: 48px;
      font-family: 'Playfair Display', serif;
      color: #ffffff;
      margin-top: 100px;
      margin-bottom: 60px;
      animation: fadeInDown 1s ease-in-out;
      letter-spacing: 1px;
    }

    .event-container {
      display: grid;
      max-width: 1200px;
      margin: auto;
      grid-template-columns: repeat(auto-fit, minmax(280px, 1fr));
      gap: 40px;
      padding: 0 20px 60px;
    }

    .event-card {
      background: rgba(255, 255, 255, 0.1);
      backdrop-filter: blur(12px);
      border-radius: 16px;
      overflow: hidden;
      box-shadow: 0 12px 30px rgba(0,0,0,0.4);
      border: 1px solid rgba(255, 255, 255, 0.15);
      transition: transform 0.4s ease, box-shadow 0.4s ease;
      animation: fadeInUp 1.2s ease both;
    }

    .event-card:hover {
      transform: translateY(-10px) scale(1.01);
      box-shadow: 0 20px 50px rgba(0, 0, 0, 0.6);
    }

    .event-img {
      width: 100%;
      height: 200px;
      object-fit: cover;
      border-top-left-radius: 16px;
      border-top-right-radius: 16px;
      transition: filter 0.3s ease;
    }

    .event-card:hover .event-img {
      filter: brightness(0.8);
    }

    .event-content {
      padding: 20px;
      text-align: center;
    }

    .event-title {
      font-size: 22px;
      font-weight: 700;
      color: #fff;
      margin-bottom: 10px;
    }

    .event-date, .event-type, .event-capacity {
      font-size: 14px;
      color: #ccc;
      margin-bottom: 6px;
    }

    .event-location a {
      color: #80e8ff;
      font-size: 14px;
      text-decoration: none;
      transition: color 0.3s;
    }

    .event-location a:hover {
      color: #b4f8ff;
    }

    @keyframes fadeInUp {
      from {opacity: 0; transform: translateY(30px);}
      to {opacity: 1; transform: translateY(0);}
    }

    @keyframes fadeInDown {
      from {opacity: 0; transform: translateY(-40px);}
      to {opacity: 1; transform: translateY(0);}
    }

    @media (max-width: 600px) {
      h1 {
        font-size: 32px;
        margin-top: 80px;
      }
      .event-img { height: 160px; }
      .back-btn { font-size: 14px; padding: 8px 14px; }
    }
  </style>
</head>
<body>
<canvas id="stars"></canvas>
<a href="confdashboard.jsp" class="back-btn">&larr; Back to Dashboard</a>
<h1>Upcoming Conference Events</h1>
<div class="event-container">
  <div class="event-card">
    <img src="conf13.jpg" alt="Event Poster" class="event-img">
    <div class="event-content">
      <div class="event-title">AI Global Summit 2025</div>
      <div class="event-date">March 10 - March 12</div>
      <div class="event-type">Category: Technology Conference</div>
      <div class="event-capacity">Capacity: 500 attendees</div>
      <div class="event-location"><a href="#">International Convention Centre, Delhi</a></div>
    </div>
  </div>
  <div class="event-card">
    <img src="conf14.webp" alt="Event Poster" class="event-img">
    <div class="event-content">
      <div class="event-title">Green Energy World Congress</div>
      <div class="event-date">April 5 - April 6</div>
      <div class="event-type">Category: Environmental Summit</div>
      <div class="event-capacity">Capacity: 300 attendees</div>
      <div class="event-location"><a href="#">Eco Auditorium, Bengaluru</a></div>
    </div>
  </div>
  <div class="event-card">
    <img src="conf15.png" alt="Event Poster" class="event-img">
    <div class="event-content">
      <div class="event-title">Future of Education Forum</div>
      <div class="event-date">May 2 - May 4</div>
      <div class="event-type">Category:Technology Conference</div>
      <div class="event-capacity">Capacity: 400 attendees</div>
      <div class="event-location"><a href="#">Tech Park, Hyderabad</a></div>
    </div>
  </div>
  <div class="event-card">
    <img src="conf16.jpeg" alt="Event Poster" class="event-img">
    <div class="event-content">
      <div class="event-title">HealthTech Innovations Expo</div>
      <div class="event-date">June 18 - June 20</div>
      <div class="event-type">Category: Health Conference</div>
      <div class="event-capacity">Capacity: 250 attendees</div>
      <div class="event-location"><a href="#">Wellness Centre, Mumbai</a></div>
    </div>
  </div>
</div>
<script>
  const canvas = document.getElementById("stars");
  const ctx = canvas.getContext("2d");
  let stars = [];

  function resizeCanvas() {
    canvas.width = window.innerWidth;
    canvas.height = window.innerHeight;
  }

  window.addEventListener('resize', resizeCanvas);
  resizeCanvas();

  for (let i = 0; i < 150; i++) {
    stars.push({
      x: Math.random() * canvas.width,
      y: Math.random() * canvas.height,
      r: Math.random() * 1.5 + 0.5,
      d: Math.random() * 0.5 + 0.05
    });
  }

  function drawStars() {
    ctx.clearRect(0, 0, canvas.width, canvas.height);
    ctx.fillStyle = "#ffffff";
    ctx.shadowBlur = 8;
    ctx.shadowColor = "#ffffff";
    stars.forEach(star => {
      ctx.beginPath();
      ctx.arc(star.x, star.y, star.r, 0, Math.PI * 2, true);
      ctx.fill();
    });
    moveStars();
  }

  function moveStars() {
    stars.forEach(star => {
      star.y += star.d;
      if (star.y > canvas.height) {
        star.y = 0;
        star.x = Math.random() * canvas.width;
      }
    });
  }

  function animateStars() {
    drawStars();
    requestAnimationFrame(animateStars);
  }

  animateStars();
</script>
</body>
</html>
