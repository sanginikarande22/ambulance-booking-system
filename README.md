# 🚑 Ambulance Booking & Live Driver Tracking System

## 📑 Table of Contents
- [Overview](#overview)
- [Key Features](#key-features)
- [Technology Stack](#technology-stack)
- [System Architecture](#system-architecture)
- [Project Structure](#project-structure)
- [Database Design](#database-design)
- [Working Flow](#working-flow)
- [Challenges Faced](#challenges-faced)
- [Limitations](#limitations)
- [Future Enhancements](#future-enhancements)
- [Learning Outcomes](#learning-outcomes)
- [Author & Contact](#author--contact)
- [Conclusion](#conclusion)

---

## 📌 Overview
The Ambulance Booking & Live Driver Tracking System is a full-stack web application developed using JSP, Servlets, JDBC, and MySQL. The system allows patients to book ambulances online and track the driver’s live location in real-time.

This project evolved from a basic CRUD application into a real-time tracking system, demonstrating full-stack development and real-world problem-solving.

---

## 🎯 Key Features
- Patient Registration & Login  
- Driver Registration & Login  
- Ambulance Booking System  
- Admin Approval System  
- Status-Based Workflow  
  (Pending → Assigned → On the way → Pickup → Reached)  
- Live GPS Tracking  
- Email-Based Password Recovery  
- PDF Report Generation  

---

## 🛠️ Technology Stack

### Backend
- Java (Servlets – Jakarta)
- JSP
- JDBC

### Frontend
- HTML
- CSS
- Bootstrap
- JavaScript
- jQuery

### Database
- MySQL

### Server
- Apache Tomcat 10

### Libraries
- Leaflet.js (Map Integration)
- iText (PDF Generation)
- Jakarta Mail (Email Service)

---

## 🏗️ System Architecture
The system follows a layered architecture:

- Presentation Layer → JSP, HTML, CSS  
- Controller Layer → Servlets  
- Business Logic Layer → Booking & Tracking Logic  
- Data Access Layer → JDBC  
- Database Layer → MySQL  

---

## 🗂️ Project Structure


## 📁 Project Structure

AmbulanceBookingService/
│
├── src/
│   └── com/
│       ├── controller/    # Servlets (request handling)
│       ├── dao/           # Database operations
│       ├── model/         # Java classes / entities
│       └── util/          # DB connection utility
│
├── WebContent/
│   ├── css/               # Stylesheets
│   ├── js/                # JavaScript files
│   ├── images/            # Static images
│   ├── pages/             # JSP pages
│   └── WEB-INF/
│       └── web.xml        # Configuration file
│
├── build/                 # Compiled class files
├── .classpath
├── .project
└── README.md



---

## 🗄️ Database Design
Main tables used:

- tblpatient  
- tbldriver  
- tblambulance  
- tbldriverlocation (stores real-time location)  
- tbltrackinghistory  
- tblpayment  

Efficient tracking query used:
INSERT ... ON DUPLICATE KEY UPDATE  
to maintain latest driver location.

---

## ⚙️ Working Flow

### Driver Workflow
1. Driver logs in  
2. Accepts booking  
3. Updates status to "On the way"  
4. GPS tracking starts automatically  
5. Location updates are sent to the database  

### Patient Workflow
1. Patient books ambulance  
2. Waits for assignment  
3. When status = "On the way"  
4. Live tracking map appears  
5. Location updates every few seconds  

---

## ⚠️ Challenges Faced
- Static DB connection causing concurrency issues  
- JSP variable scope errors  
- Session handling issues (AVN missing)  
- HTTP 500 errors  
- Real-time synchronization issues  

---

## 🚧 Limitations
- Uses polling instead of WebSockets  
- No strict MVC architecture  
- Limited security implementation  
- No REST API  

---

## 🚀 Future Enhancements
- Implement WebSockets for real-time tracking  
- Introduce MVC architecture  
- Add route visualization and ETA  
- Improve security  
- Build mobile app version  

---

## 🎓 Learning Outcomes
- Servlet lifecycle understanding  
- JSP working and scope handling  
- JDBC and database interaction  
- Real-time tracking implementation  
- Debugging and problem-solving  
- Full-stack development experience  

---

## 👩‍💻 Author & Contact

**Sangini Karande**  
B.E. Computer Engineering  

🔗 GitHub: https://github.com/sanginikarande22  
🔗 LinkedIn: linkedin.com/in/sangini-karande-72aa1b2a1  
🔗 Portfolio: https://sanginikarande22.github.io/
📧 Email: sanginikarande@gmail.com  

---

## ⭐ Conclusion
This project demonstrates the transformation of a simple web application into a real-time tracking system.
It highlights full-stack development, real-time data handling, and practical debugging skills, making it a strong and industry-relevant project.
