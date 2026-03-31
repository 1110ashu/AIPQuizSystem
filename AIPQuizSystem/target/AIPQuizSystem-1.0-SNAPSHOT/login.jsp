<html>
<head>
<title>Admin Login</title>

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
    padding: 35px;
    border-radius: 15px;
    width: 350px;
    color: white;
    box-shadow: 0 8px 32px rgba(0,0,0,0.2);
    text-align: center;
}

h2 {
    margin-bottom: 20px;
}

/* Inputs */
input {
    width: 100%;
    padding: 10px;
    margin: 10px 0;
    border-radius: 5px;
    border: none;
}

/* Button */
.btn {
    width: 100%;
    padding: 12px;
    background: #007bff;
    color: white;
    border: none;
    border-radius: 6px;
    font-size: 16px;
    cursor: pointer;
}

.btn:hover {
    opacity: 0.9;
}

/* Back link */
a {
    display: block;
    margin-top: 15px;
    color: white;
    text-decoration: none;
}

/* Error message */
.error {
    background: rgba(255, 0, 0, 0.2);
    padding: 8px;
    border-radius: 5px;
    margin-bottom: 10px;
}
</style>

</head>

<body>

<div class="card">

<h2> Admin Login</h2>

<!-- ERROR MESSAGE -->
<%
String error = request.getParameter("error");
if ("1".equals(error)) {
%>
<div class="error">Invalid Username or Password</div>
<%
}
%>

<form action="<%= request.getContextPath() %>/LoginServlet" method="post" autocomplete="off">

<input type="text" name="username" placeholder="Enter Username" required>

<input type="password" name="password" placeholder="Enter Password" required>

<br>
<button type="submit" class="btn">Login</button>

</form>

<a href="<%= request.getContextPath() %>/">Back to Home</a>

</div>

</body>
</html>