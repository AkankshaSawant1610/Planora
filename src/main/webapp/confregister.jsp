<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Conference Create Account - Planora</title>
  <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600&display=swap" rel="stylesheet">
  <style>
    * {
      box-sizing: border-box;
      font-family: 'Inter', sans-serif;
    }

    body, html {
      margin: 0;
      padding: 0;
      height: 100vh;
      width: 100%;
    }

    body {
      background: url('conf2.jpg') no-repeat center center fixed;
      background-size: cover;
      position: relative;
    }

    body::before {
      content: "";
      position: absolute;
      top: 0; left: 0;
      width: 100%;
      height: 100%;
      backdrop-filter: blur(6px) brightness(0.8);
      z-index: 0;
    }

    .form-container {
      position: relative;
      z-index: 2;
      width: 100%;
      height: 100%;
      display: flex;
      align-items: center;
      justify-content: center;
      padding: 20px;
    }

    .register-box {
      width: 400px;
      background: #fff;
      border-radius: 16px;
      padding: 40px 30px;
      box-shadow: 0 8px 24px rgba(0, 0, 0, 0.2);
      position: relative;
    }

    .register-box::before {
      content: '';
      position: absolute;
      top: 0;
      left: 0;
      width: 100%;
      height: 20px;
      border-bottom: 5px dashed #ff5a3c;
      background: #fff;
      border-radius: 16px 16px 0 0;
    }

    h1 {
      margin-bottom: 20px;
      font-size: 22px;
      font-weight: 600;
      text-align: center;
    }

    .logo {
      font-size: 28px;
      font-weight: bold;
      margin-bottom: 30px;
      color: #000;
      text-align: center;
    }

    .logo span {
      background: #ff5a3c;
      color: #fff;
      padding: 2px 6px;
      border-radius: 4px;
      margin-right: 5px;
    }

    label {
      font-size: 14px;
      margin-top: 10px;
      display: block;
    }

    input[type="text"],
    input[type="email"],
    input[type="password"] {
      width: 100%;
      padding: 10px;
      margin-top: 5px;
      border-radius: 6px;
      border: 1px solid #ccc;
    }

    .name-group {
      display: flex;
      gap: 10px;
    }

    .checkbox {
      margin: 15px 0;
      font-size: 13px;
    }

    .btn {
      background: #ff5a3c;
      color: white;
      border: none;
      padding: 12px;
      width: 100%;
      font-size: 16px;
      border-radius: 6px;
      cursor: pointer;
    }

    .footer-link {
      margin-top: 10px;
      font-size: 13px;
      text-align: center;
    }

    .footer-link a {
      color: #ff5a3c;
      text-decoration: none;
      font-weight: 600;
    }

    @media screen and (max-width: 480px) {
      .register-box {
        width: 100%;
        border-radius: 0;
        padding: 30px 20px;
      }
    }
     .home-btn {
  position: fixed;
  top: 20px;
  left: 20px;
  background: rgba(255, 90, 60, 0.9);
  color: #fff;
  padding: 10px 16px;
  text-decoration: none;
  font-weight: 600;
  border-radius: 8px;
  z-index: 1000;
  transition: 0.3s ease;
  font-size: 14px;
}

.home-btn:hover {
  background: rgba(255, 90, 60, 1);
  transform: scale(1.05);
}

  </style>
</head>
<body>
<a href="index.jsp" class="home-btn">← Home</a>

  <div class="form-container">
    <div class="register-box">
      <div class="logo"><span>P</span>lanora</div>
      <h1>Create Account</h1>
      <form action="${pageContext.request.contextPath}/ConfRegisterServlet" method="post">

        <label>Email</label>
        <input type="email" name="email" required>

        <div class="name-group">
          <div style="flex:1">
            <label>First Name</label>
            <input type="text" name="firstName" required>
          </div>
          <div style="flex:1">
            <label>Last Name</label>
            <input type="text" name="lastName" required>
          </div>
        </div>

        <label>Password</label>
        <input type="password" name="password" required>

        <label>Confirm Password</label>
        <input type="password" name="confirmPassword" required>

        <div class="checkbox">
          <input type="checkbox" required> By signing up, I agree to Planora's terms of service, privacy policy, and community guidelines.
        </div>

        <button class="btn" type="submit">Sign in</button>

        <div class="footer-link">
          Already have an account? <a href="conflogin.jsp">Log in</a>
        </div>
      </form>
    </div>
  </div>
</body>
</html>


