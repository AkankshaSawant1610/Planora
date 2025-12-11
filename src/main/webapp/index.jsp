<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <title>Planora</title>
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />

  <!-- Google Fonts -->
  <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600;700;900&display=swap" rel="stylesheet" />
  <!-- Bootstrap -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" />

  <style>
    * {
      box-sizing: border-box;
      margin: 0;
      padding: 0;
    }

    html, body {
      height: 100%;
      overflow: hidden;
      font-family: 'Inter', sans-serif;
      color: #fff;
    }

    body::before {
      content: '';
      position: fixed;
      top: 0; left: 0; right: 0; bottom: 0;
      background: url('mainindex.jpg') no-repeat center center fixed;
      background-size: cover;
      filter: blur(6px);
      z-index: -2;
    }

    body::after {
      content: '';
      background-color: rgba(0, 0, 0, 0.65);
      position: fixed;
      top: 0; left: 0; right: 0; bottom: 0;
      z-index: -1;
    }

    nav {
      display: flex;
      justify-content: space-between;
      align-items: center;
      padding: 25px 60px;
      z-index: 2;
      position: relative;
    }

    .nav-logo {
      font-size: 32px;
      font-weight: 900;
      color: #ffd000;
    }

    .nav-links {
      display: flex;
      align-items: center;
      gap: 30px;
    }

    .nav-links a {
      color: #ffffff;
      text-decoration: none;
      font-weight: 500;
      position: relative;
      transition: 0.3s;
    }

    .nav-links a::after {
      content: '';
      display: block;
      width: 0;
      height: 2px;
      background: #ffd000;
      transition: width 0.3s;
      margin-top: 4px;
    }

    .nav-links a:hover {
      color: #ffd000;
    }

    .nav-links a:hover::after {
      width: 100%;
    }

    .hero {
      height: calc(100vh - 80px);
      display: flex;
      justify-content: center;
      align-items: center;
      padding: 0 20px;
    }

    .glass-card {
      background: rgba(255, 255, 255, 0.08);
      backdrop-filter: blur(12px);
      border-radius: 25px;
      box-shadow: 0 0 60px rgba(0, 0, 0, 0.45);
      padding: 50px 40px;
      max-width: 520px;
      width: 100%;
      border: 1px solid rgba(255, 255, 255, 0.2);
      animation: fadeIn 1s ease-in-out;
      text-align: center;
    }

    .glass-card h1 {
      font-size: 48px;
      font-weight: 900;
      color: #ffd000;
      margin-bottom: 10px;
    }

    .glass-card h2 {
      font-size: 28px;
      font-weight: 700;
      margin-bottom: 20px;
    }

    .glass-card p {
      color: #e0e0e0;
      font-size: 16px;
      margin-bottom: 35px;
      line-height: 1.6;
    }

    .subscribe-btn {
      display: inline-block;
      background: linear-gradient(135deg, #ffd000, #f8b400);
      color: #1f2b3a;
      font-weight: 700;
      font-size: 16px;
      padding: 14px 30px;
      margin: 10px 0;
      width: 100%;
      border: none;
      border-radius: 50px;
      text-decoration: none;
      transition: all 0.4s ease;
      box-shadow: 0 6px 20px rgba(255, 208, 0, 0.4);
    }

    .subscribe-btn:hover {
      transform: translateY(-3px);
      background: linear-gradient(135deg, #f8b400, #ffd000);
      box-shadow: 0 0 25px rgba(255, 208, 0, 0.8);
      color: #000;
    }

    @keyframes fadeIn {
      from {
        opacity: 0;
        transform: translateY(40px);
      }
      to {
        opacity: 1;
        transform: translateY(0);
      }
    }

    @media (max-width: 768px) {
      nav {
        flex-direction: column;
        padding: 20px 30px;
      }

      .nav-links {
        flex-wrap: wrap;
        justify-content: center;
      }

      .glass-card {
        padding: 40px 25px;
      }

      .glass-card h1 {
        font-size: 38px;
      }

      .glass-card h2 {
        font-size: 22px;
      }
    }
  </style>
</head>
<body>

<!-- Navbar -->
<nav>
  <div class="nav-logo">Pla<span style="color: #fff;">nora</span></div>
  <div class="nav-links">
    <a href="index.jsp">Home</a>
   
    <a href="#">FAQ</a>
  </div>
</nav>

<!-- Hero Section -->
<div class="hero">
  <div class="glass-card">
    <h1>Welcome to Planora</h1>
    <h2>The Committee Welcomes You</h2>
    <p>Stay updated with the latest events and conferences happening around you with Planora’s centralized portal.</p>

    <a href="login.jsp" class="subscribe-btn">Explore Entertainment ➤</a>
    <a href="conflogin.jsp" class="subscribe-btn">Explore Conferences ➤</a>
  </div>
</div>

</body>
</html>
