[ PLANORA ] Event Management & Booking Web Application 

This project is a complete JSP + Servlet + JDBC based Event Management System that allows users to view upcoming events, register, log in, book events, and manage their bookings.
Administrators can manage events, users, and booking data through the backend.

It is designed as a full-stack Java web application using JSP, Servlets, JDBC, MySQL, and Tomcat.

📌 Features
👤 User Module

User Registration & Login

View Upcoming Events

Book Events

Check My Bookings

Logout functionality

🛠 Admin Module

Manage events

Manage users

View all bookings

CRUD operations for event details

🎨 Frontend

JSP Pages

HTML, CSS, JS

Responsive UI

Event cards, banners, and images

💾 Backend

Servlets for handling requests

JDBC connectivity

MySQL database integration

DAO pattern-like structure for data handling

📁 Project Structure
ABC/
│
├── src/main/java/com/portal
│   ├── dao/
│   ├── beans/
│   ├── servlet/
│   └── conf/
│
├── src/main/webapp
│   ├── index.jsp
│   ├── login.jsp
│   ├── register.jsp
│   ├── upcoming_event.jsp
│   ├── admin.jsp
│   ├── my_bookings.jsp
│   ├── event_booking.jsp
│   ├── logout.jsp
│   ├── images/
│   ├── css/
│   ├── js/
│   ├── META-INF/
│   └── WEB-INF/
│       ├── web.xml
│       └── lib/
│           └── mysql-connector-j-9.2.0.jar
│
├── build/
└── .project / .classpath / .settings

🛠 Tech Stack
Backend

Java

JSP & Servlets

JDBC

MySQL

Frontend

JSP

HTML5

CSS3

JavaScript

Server

Apache Tomcat (recommended version 8/9/10)

Database

MySQL

JDBC Driver (included in WEB-INF/lib)

🔧 How to Run the Project
1. Import the Project

Open Eclipse or IntelliJ

Import as Existing Dynamic Web Project or Maven Project (if converted)

2. Configure Server

Add Apache Tomcat (8–10)

3. Configure Database

Create MySQL database:

CREATE DATABASE event_portal;
USE event_portal;


Add required tables (users, events, bookings).
If you want, I can generate full SQL schema for you.

4. Update DB Credentials

Inside your servlet/DAO files, update:

url = "jdbc:mysql://localhost:3306/event_portal";
username = "root";
password = "your_password";

5. Run

Start Tomcat

Open browser:

http://localhost:8080/ABC/

📸 Screenshots

You can include these (from webapp images):

![Homepage](src/main/webapp/mainindex.jpg)
![Event Page](src/main/webapp/shaktifest.jpg)
![Team](src/main/webapp/team.jpg)


If you want, I can generate a full gallery section for all images.

📌 Future Enhancements

Convert to Spring Boot MVC

Admin dashboard with charts

Online payment integration

Email notifications for bookings

Token-based user authentication

👩‍💻 Developed By

Akanksha Sawant
