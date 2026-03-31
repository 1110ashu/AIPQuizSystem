<%@ page import="java.sql.*" %>
<%@ page import="com.mycompany.aipquizsystem.DBConnection" %>

<%
String role = (String) session.getAttribute("role");

if (role == null || !role.equals("admin")) {
    response.sendRedirect("login.jsp");
}
%>

<html>
<head>
<title>Manage Questions</title>

<style>
body {
    margin: 0;
    font-family: 'Segoe UI', sans-serif;
    background: linear-gradient(135deg, #667eea, #764ba2);
    color: white;
}

/* NAVBAR */
.navbar {
    display: flex;
    justify-content: space-between;
    align-items: center;
    padding: 15px 30px;
    background: rgba(0,0,0,0.2);
}

.navbar h2 {
    margin: 0;
}

.navbar a {
    color: white;
    margin-left: 15px;
    text-decoration: none;
    padding: 8px 12px;
    border-radius: 5px;
    background: rgba(255,255,255,0.2);
    transition: 0.3s;
}

.navbar a:hover {
    background: rgba(255,255,255,0.4);
}

/* MAIN CONTAINER */
.container {
    width: 95%;
    margin: 20px auto;
    background: rgba(255, 255, 255, 0.15);
    backdrop-filter: blur(10px);
    padding: 20px;
    border-radius: 15px;
}

/* TABLE */
table {
    width: 100%;
    border-collapse: collapse;
    margin-top: 20px;
}

/* HEADER */
th {
    background: rgba(0,0,0,0.3);
    position: sticky;
    top: 0;
}

/* CELLS */
th, td {
    padding: 10px;
    border-bottom: 1px solid rgba(255,255,255,0.3);
}

/* ROW HOVER */
tr:hover {
    background: rgba(255,255,255,0.1);
}

/* DELETE BUTTON */
.delete-btn {
    background: #dc3545;
    border: none;
    padding: 6px 10px;
    border-radius: 5px;
    color: white;
    cursor: pointer;
}

.delete-btn:hover {
    opacity: 0.8;
}

/* ACTION BUTTONS */
.action-bar {
    margin-top: 10px;
}

.action-bar a {
    margin-right: 10px;
    padding: 8px 12px;
    background: #17a2b8;
    color: white;
    text-decoration: none;
    border-radius: 5px;
}

.action-bar a:hover {
    opacity: 0.8;
}
</style>

</head>

<body>


<div class="navbar">
    <h2> Manage Questions</h2>

    <div>
        <a href="adminDashboard.jsp"> Dashboard</a>
        <a href="addQuestion.jsp"> Add</a>
        <a href="viewQuestions.jsp"> Refresh</a>
        <a href="logout.jsp"> Logout</a>
    </div>
</div>

<!-- ? CONTAINER -->
<div class="container">

<div class="action-bar">
    <a href="addQuestion.jsp"> Add New Question</a>
    <a href="viewQuestions.jsp"> Reload Table</a>
</div>

<table>
<tr>
    <th>ID</th>
    <th>Question</th>
    <th>Option1</th>
    <th>Option2</th>
    <th>Option3</th>
    <th>Option4</th>
    <th>Correct</th>
    <th>Action</th>
</tr>

<%
Connection con = DBConnection.getConnection();
Statement st = con.createStatement();
ResultSet rs = st.executeQuery("SELECT * FROM questions");

while(rs.next()) {
%>

<tr>
    <td><%= rs.getInt("id") %></td>
    <td><%= rs.getString("question") %></td>
    <td><%= rs.getString("option1") %></td>
    <td><%= rs.getString("option2") %></td>
    <td><%= rs.getString("option3") %></td>
    <td><%= rs.getString("option4") %></td>
    <td><%= rs.getString("correct_answer") %></td>

    <td>
        <form action="DeleteQuestionServlet" method="post">
            <input type="hidden" name="id" value="<%= rs.getInt("id") %>">
            <button class="delete-btn">Delete</button>
        </form>
    </td>
</tr>

<%
}
%>

</table>

</div>

</body>
</html>