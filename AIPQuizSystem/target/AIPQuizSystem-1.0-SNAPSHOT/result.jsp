<%@ page import="java.sql.*" %>
<%@ page import="com.mycompany.aipquizsystem.DBConnection" %>

<html>
<head>
<title>Quiz Result</title>

<style>
body {
    margin: 0;
    font-family: 'Segoe UI', sans-serif;
    background: linear-gradient(135deg, #667eea, #764ba2);
    display: flex;
    justify-content: center;
    align-items: center;
    height: 100vh;
}

/* RESULT CARD */
.card {
    background: rgba(255,255,255,0.15);
    backdrop-filter: blur(10px);
    padding: 40px;
    border-radius: 15px;
    text-align: center;
    color: white;
    width: 350px;
    box-shadow: 0 8px 32px rgba(0,0,0,0.2);
}

h2 {
    margin-bottom: 20px;
}

.score {
    font-size: 28px;
    margin: 10px 0;
}

.percentage {
    font-size: 22px;
    margin: 10px 0;
}

.performance {
    font-size: 20px;
    margin: 15px 0;
}

/* BUTTONS */
.btn {
    display: block;
    margin: 10px auto;
    padding: 10px;
    width: 200px;
    border-radius: 6px;
    text-decoration: none;
    color: white;
}

.retry {
    background: #28a745;
}

.home {
    background: #007bff;
}

.btn:hover {
    opacity: 0.9;
}
</style>

</head>

<body>

<div class="card">

<h2> Quiz Result</h2>

<%
int score = (int) request.getAttribute("score");
int total = (int) request.getAttribute("total");

double percentage = ((double) score / total) * 100;

String performance;

if (percentage >= 80) {
    performance = "Excellent ";
} else if (percentage >= 50) {
    performance = "Good ";
} else {
    performance = "Needs Improvement ";
}
%>

<div class="score">Score: <%= score %> / <%= total %></div>

<div class="percentage">Percentage: <%= (int)percentage %>%</div>

<div class="performance"><%= performance %></div>

<a href="quiz.jsp" class="btn retry"> Retry Quiz</a>
<a href="<%= request.getContextPath() %>/" class="btn home"> Home</a>

</div>

</body>
</html>