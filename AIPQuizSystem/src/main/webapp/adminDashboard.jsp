<%
String role = (String) session.getAttribute("role");

if (role == null || !role.equals("admin")) {
    response.sendRedirect("login.jsp");
}
%>

<html>
<head>
<title>Admin Dashboard</title>

<style>
body {
    margin: 0;
    font-family: 'Segoe UI', sans-serif;
    background: linear-gradient(135deg, #667eea, #764ba2);
    height: 100vh;
    display: flex;
    justify-content: center;
    align-items: center;
}

/* Glass Card */
.card {
    background: rgba(255, 255, 255, 0.15);
    backdrop-filter: blur(10px);
    padding: 40px;
    border-radius: 15px;
    width: 350px;
    text-align: center;
    color: white;
    box-shadow: 0 8px 32px rgba(0,0,0,0.2);
}

/* Title */
h2 {
    margin-bottom: 25px;
}

/* Buttons */
.btn {
    display: block;
    width: 100%;
    margin: 12px 0;
    padding: 12px;
    font-size: 16px;
    border-radius: 8px;
    text-decoration: none;
    color: white;
    transition: 0.3s;
}

/* Button colors */
.add {
    background: #28a745;
}

.view {
    background: #17a2b8;
}

.logout {
    background: #dc3545;
}

/* Hover */
.btn:hover {
    transform: scale(1.05);
    opacity: 0.9;
}

/* Small subtitle */
p {
    font-size: 14px;
    margin-bottom: 20px;
    opacity: 0.8;
}
</style>

</head>

<body>

<div class="card">

<h2> Admin Dashboard </h2>
<p>Manage your quiz system efficiently</p>

<a href="addQuestion.jsp" class="btn add"> Add Questions</a>
<a href="viewQuestions.jsp" class="btn view"> View Questions</a>
<a href="logout.jsp" class="btn logout"> Logout</a>

</div>

</body>
</html>