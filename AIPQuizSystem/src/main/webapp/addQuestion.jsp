<%
String role = (String) session.getAttribute("role");

if (role == null || !role.equals("admin")) {
    response.sendRedirect("login.jsp");
}
%>

<html>
<head>
<title>Add Question</title>

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
    padding: 30px;
    border-radius: 15px;
    width: 400px;
    color: white;
    box-shadow: 0 8px 32px rgba(0,0,0,0.2);
}

h2 {
    text-align: center;
    margin-bottom: 20px;
}

/* Inputs */
input, select {
    width: 100%;
    padding: 10px;
    margin: 8px 0;
    border-radius: 5px;
    border: none;
}

/* Button */
.btn {
    width: 100%;
    padding: 12px;
    background: #28a745;
    color: white;
    border: none;
    border-radius: 6px;
    font-size: 16px;
    cursor: pointer;
}

.btn:hover {
    opacity: 0.9;
}

/* Navigation links */
.links {
    text-align: center;
    margin-top: 15px;
}

.links a {
    color: white;
    text-decoration: none;
    margin: 0 10px;
}
</style>

</head>

<body>

<div class="card">

<h2> Add Question</h2>

<form action="<%= request.getContextPath() %>/AddQuestionServlet" method="post">

<input type="text" name="question" placeholder="Enter Question" required>

<input type="text" name="op1" placeholder="Option 1" required>
<input type="text" name="op2" placeholder="Option 2" required>
<input type="text" name="op3" placeholder="Option 3" required>
<input type="text" name="op4" placeholder="Option 4" required>

<select name="correct">
    <option value="op1">Correct Answer: Option 1</option>
    <option value="op2">Correct Answer: Option 2</option>
    <option value="op3">Correct Answer: Option 3</option>
    <option value="op4">Correct Answer: Option 4</option>
</select>

<br><br>
<button type="submit" class="btn">Add Question</button>

</form>

<div class="links">
    <a href="adminDashboard.jsp"> Dashboard</a> |
    <a href="viewQuestions.jsp"> View Questions</a>
</div>

</div>

<!-- ? SUCCESS POPUP -->
<%
String success = request.getParameter("success");
if ("1".equals(success)) {
%>

<div id="popup" style="
    position: fixed;
    top: 20px;
    right: 20px;
    background: green;
    padding: 15px;
    color: white;
    border-radius: 5px;
">
    Question Added Successfully!
</div>

<script>
setTimeout(() => {
    document.getElementById("popup").style.display = "none";
}, 2000);
</script>

<%
}
%>

</body>
</html>