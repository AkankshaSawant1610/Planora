<%@ page contentType="text/html;charset=UTF-8" language="java" %> 
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Contact Us - Planora</title>
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600;700&display=swap" rel="stylesheet">
  <style>
    * {
      box-sizing: border-box;
      margin: 0;
      padding: 0;
    }

    body {
      font-family: 'Inter', sans-serif;
      background: linear-gradient(-45deg, #0f2027, #203a43, #2c5364, #1a1a40);
      background-size: 400% 400%;
      animation: gradientFlow 15s ease infinite;
      min-height: 100vh;
      margin: 0;
      padding: 0;
      position: relative;
      overflow: hidden;
      display: flex;
      justify-content: center;
      align-items: center;
    }

    @keyframes gradientFlow {
      0% { background-position: 0% 50%; }
      50% { background-position: 100% 50%; }
      100% { background-position: 0% 50%; }
    }

    .particles {
      position: absolute;
      top: 0; left: 0;
      width: 100%;
      height: 100%;
      pointer-events: none;
      z-index: 0;
    }

    .particles span {
      position: absolute;
      display: block;
      background: rgba(255, 255, 255, 0.12);
      border-radius: 50%;
      animation: fall linear infinite;
    }

    @keyframes fall {
      0% { transform: translateY(-100px); opacity: 1; }
      100% { transform: translateY(100vh); opacity: 0; }
    }

    .dashboard-btn {
      position: absolute;
      top: 25px;
      left: 25px;
      background: rgba(255, 255, 255, 0.08);
      padding: 10px 20px;
      color: #fff;
      border-radius: 40px;
      text-decoration: none;
      font-weight: 600;
      font-size: 18px;
      backdrop-filter: blur(10px);
      border: 1px solid rgba(255,255,255,0.2);
      box-shadow: 0 4px 10px rgba(0,0,0,0.2);
      transition: all 0.3s ease;
      z-index: 10;
    }

    .dashboard-btn:hover {
      background: rgba(255, 255, 255, 0.2);
      transform: scale(1.07);
    }

    main.main-area {
      display: flex;
      justify-content: center;
      align-items: center;
      padding: 80px 20px;
      width: 100%;
      max-width: 1400px;
      z-index: 2;
    }

    .main-wrapper {
      display: flex;
      gap: 30px;
      flex-wrap: wrap;
      justify-content: center;
      align-items: center;
      width: 100%;
    }

    .container, .response-box {
      background: rgba(255, 255, 255, 0.05);
      backdrop-filter: blur(25px);
      border-radius: 25px;
      padding: 40px 30px;
      border: 1px solid rgba(255,255,255,0.2);
      box-shadow: 0 25px 60px rgba(0, 0, 0, 0.35);
      flex: 1;
      min-width: 300px;
    }

    .container {
      max-width: 650px;
    }

    .response-box {
      max-height: 500px;
      overflow-y: auto;
    }

    h1 {
      text-align: center;
      color: #ffffff;
      font-size: 34px;
      font-weight: 700;
      margin-bottom: 25px;
    }

    .message {
      text-align: center;
      font-weight: 600;
      padding: 12px 18px;
      border-radius: 12px;
      margin-bottom: 20px;
      font-size: 16px;
    }

    .success {
      background-color: #d4ffe4;
      color: #155e30;
      border: 1px solid #86efac;
    }

    .error {
      background-color: #ffe2e2;
      color: #990000;
      border: 1px solid #f39c9c;
    }

    form {
      display: flex;
      flex-direction: column;
      gap: 20px;
    }

    input, textarea {
      padding: 16px;
      font-size: 16px;
      border-radius: 12px;
      border: none;
      background: rgba(255,255,255,0.9);
      color: #2a2a2a;
      box-shadow: inset 0 0 5px rgba(0,0,0,0.05);
    }

    input:focus, textarea:focus {
      outline: none;
      background: #fff;
      box-shadow: 0 0 0 3px rgba(128, 90, 213, 0.4);
    }

    textarea {
      resize: vertical;
      min-height: 130px;
    }

    button {
      background: linear-gradient(to right, #b76df2, #886fff);
      color: #fff;
      padding: 14px;
      border: none;
      border-radius: 12px;
      font-size: 17px;
      font-weight: 600;
      cursor: pointer;
      transition: 0.3s ease;
      box-shadow: 0 8px 25px rgba(137, 101, 255, 0.4);
    }

    button:hover {
      transform: scale(1.04);
      box-shadow: 0 12px 28px rgba(128, 90, 213, 0.55);
    }

    .back-link {
      display: block;
      margin-top: 25px;
      text-align: center;
      color: #e0e0e0;
      text-decoration: none;
      font-weight: 500;
      font-size: 20px;
      opacity: 0.85;
    }

    .back-link:hover {
      text-decoration: underline;
      opacity: 1;
    }

    .spinner-overlay {
      position: fixed;
      top: 0;
      left: 0;
      width: 100vw;
      height: 100vh;
      background: rgba(0,0,0,0.7);
      display: none;
      justify-content: center;
      align-items: center;
      flex-direction: column;
      z-index: 9999;
    }

    .spinner {
      width: 50px;
      height: 50px;
      border: 5px solid rgba(255,255,255,0.3);
      border-top: 5px solid #ffffff;
      border-radius: 50%;
      animation: spin 1s linear infinite;
    }

    @keyframes spin {
      to { transform: rotate(360deg); }
    }

    @media (max-width: 800px) {
      .main-wrapper {
        flex-direction: column;
      }
    }
  </style>
</head>
<body>

<!-- Falling Particles -->
<div class="particles">
  <% for (int i = 0; i < 60; i++) {
    int left = (int)(Math.random() * 100);
    int delay = (int)(Math.random() * 10);
    int size = 4 + (int)(Math.random() * 12);
    int top = -10 + (int)(Math.random() * 10);
  %>
    <span style="left: <%=left%>vw; top: <%=top%>vh; width: <%=size%>px; height: <%=size%>px; animation-duration: <%=5 + (int)(Math.random() * 10)%>s; animation-delay: <%=delay%>s;"></span>
  <% } %>
</div>

<a href="dashboard.jsp" class="dashboard-btn">← Dashboard</a>

<main class="main-area">
  <div class="main-wrapper">

    <!-- Contact Form Card -->
    <div class="container">
      <h1>Planora - Contact Us 💌</h1>

      <%
        String success = request.getParameter("success");
        String error = request.getParameter("error");

        if ("true".equals(success)) {
      %>
        <div class="message success">✅ Your message has been sent successfully!</div>
      <% } else if (error != null) { %>
        <div class="message error">❌ Something went wrong. Please try again.</div>
      <% } %>

      <form id="contactForm" action="SubmitContactServlet" method="post">
        <input type="text" name="name" placeholder="Your Full Name" required />
        <input type="email" name="email" placeholder="Your Email Address" required />
        <textarea name="message" placeholder="Write your message here..." required></textarea>
        <button type="submit" id="submitBtn">💌 Send Message</button>
      </form>

      <a class="back-link" href="dashboard.jsp">&larr; Back to Dashboard</a>
    </div>

    <!-- Admin Response Card -->
    <div class="response-box">
      <h1>📬 Admin Responses</h1>
      <div style="color: #e0e0e0; font-size: 16px; margin-top: 10px;">
        <p>Your submitted queries will be reviewed by our admin.</p>
        <p>Once reviewed, responses will be displayed here.</p>
        <p>Thank you for reaching out to Planora!</p>
      </div>
    </div>

  </div>
</main>

<!-- Spinner Overlay -->
<div class="spinner-overlay" id="spinnerOverlay">
  <div class="spinner"></div>
  <p style="color: #fff; margin-top: 15px;">Sending message...</p>
</div>

<!-- JS for Spinner -->
<script>
  const form = document.getElementById('contactForm');
  const spinner = document.getElementById('spinnerOverlay');
  const submitBtn = document.getElementById('submitBtn');

  form.addEventListener('submit', function () {
    spinner.style.display = 'flex';
    submitBtn.disabled = true;
  });
</script>

</body>
</html>
