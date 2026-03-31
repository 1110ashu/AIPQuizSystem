# 🎯 AIP Quiz System

## 📌 Project Overview
AIP Quiz System is a dynamic web-based quiz application developed using JSP, Servlets, and MySQL.  
It provides an interactive platform for students to attempt quizzes and for admins to manage questions efficiently.

---

## 🚀 Features

### 👨‍🏫 Admin Module
- 🔐 Secure Admin Login
- ➕ Add New Questions
- 📋 View All Questions
- ❌ Delete Questions
- 🧭 Dashboard Navigation

### 🎓 Student Module
- 📝 Attempt Quiz (10 Random Questions)
- 🔀 Questions Shuffled Every Time
- ⏱ Timer-Based Quiz
- 📊 Progress Bar & Question Counter
- 🎯 One Question at a Time
- 📈 Result with Score & Performance Analysis

---

## 🛠 Technologies Used

| Layer       | Technology |
|------------|-----------|
| Frontend   | HTML, CSS, JavaScript, JSP |
| Backend    | Java Servlets |
| Database   | MySQL |
| Server     | Apache Tomcat (v11) |

---

## 🗄 Database Structure

### Database: `aip_quiz`

### Table: `questions`

| Column Name     | Type        |
|----------------|------------|
| id             | INT (PK)   |
| question       | VARCHAR    |
| option1        | VARCHAR    |
| option2        | VARCHAR    |
| option3        | VARCHAR    |
| option4        | VARCHAR    |
| correct_answer | VARCHAR    |

---

## ⚙️ How to Run the Project

1. Install Apache Tomcat (v11)
2. Install MySQL and create database:
   ```sql
   CREATE DATABASE aip_quiz;
