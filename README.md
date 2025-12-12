

# 🎉 PLANORA – Event Management & Booking Web Application

PLANORA is a full-stack **JSP + Servlet + JDBC** powered event management platform that enables users to explore upcoming events, register, log in, book events, and manage their bookings.
A seamless administrative backend allows event organizers to manage events, users, and bookings efficiently.

Crafted to deliver a **smooth, modern event experience**, PLANORA blends dynamic UI, reliable backend logic, and database-driven workflows.

---

## 🚀 Core Features

### 👤 **User Module**

* 🔐 User Registration & Login
* 📅 Browse & View Upcoming Events
* 📝 Book Events with a single click
* 📄 View & manage *My Bookings*
* 🚪 Secure Logout Functionality

---

### 🛠 **Admin Module**

* 🗂 Create & Manage Events
* 👥 Manage User Accounts
* 📊 View & track all Bookings
* ✏ CRUD operations for event details
* 🧾 Backend management via JSP/Servlets

---

### 🎨 **Frontend Experience**

* 🌐 JSP-driven dynamic pages
* 🎴 Event Cards, Banners & Visual Listings
* 📱 Responsive UI
* 🎨 Styled using HTML5, CSS3, JavaScript
* 🔔 User-friendly booking flow

---

### 💾 **Backend & Logic**

* ⚙ Java Servlets
* 🔌 JDBC Connectivity
* 🗄 MySQL Database Integration
* 📚 DAO-style data flow
* 🧱 Deployed on Apache Tomcat

---

## 📁 Project Structure

```
PLANORA/
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
```

---

## ⚙️ Tech Stack

### 🔧 Backend

* Java
* JSP & Servlets
* JDBC
* MySQL

### 🎨 Frontend

* JSP
* HTML5
* CSS3
* JavaScript

### 🌍 Server

* Apache Tomcat (8 / 9 / 10)

### 🗄 Database

* MySQL
* JDBC Driver (included in `WEB-INF/lib`)

---

## 🔧 How to Run the Project

### **1️⃣ Import the Project**

* Open **Eclipse** or **IntelliJ**
* Import as *Existing Dynamic Web Project* or *Maven Project* (if converted)

---

### **2️⃣ Configure the Server**

* Add **Apache Tomcat** (8–10 recommended)

---

### **3️⃣ Configure the Database**

Run in MySQL:

```sql
CREATE DATABASE event_portal;
USE event_portal;
```

Add the required tables:
(If you want, I’ll generate full SQL schema for you.)

---

### **4️⃣ Update DB Credentials**

Inside your DAO/Servlet files:

```java
url = "jdbc:mysql://localhost:3306/event_portal";
username = "root";
password = "your_password";
```

---

### **5️⃣ Run the Application**

* Start Tomcat
* Open your browser:

```
http://localhost:8080/PLANORA/
```

---

## 📸 Screenshots

Use your images in the repo like:

```markdown
![Homepage](src/main/webapp/mainindex.jpg)
![Event Page](src/main/webapp/shaktifest.jpg)
![Team](src/main/webapp/team.jpg)
```

If you want, I can auto-generate a **full screenshot gallery section**.

---

## 🌟 Future Enhancements

* 🔁 Spring Boot MVC migration
* 📈 Admin dashboard with analytics
* 💳 Online payment system
* ✉ Email notifications
* 🔐 Token-based authentication
* 📱 Mobile app version

---

## 👩‍💻 Developed By

### **Akanksha Sawant**

