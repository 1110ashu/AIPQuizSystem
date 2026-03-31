<%@ page import="java.sql.*" %>
<%@ page import="com.mycompany.aipquizsystem.DBConnection" %>

<html>
<head>
<title>AIP Quiz</title>

<style>
body {
    margin: 0;
    font-family: 'Segoe UI', sans-serif;
    background: linear-gradient(135deg, #667eea, #764ba2);
    color: white;
}

/* TOP BAR */
.top-bar {
    display: flex;
    justify-content: space-between;
    padding: 15px 30px;
    background: rgba(0,0,0,0.2);
}

#timer {
    font-weight: bold;
    color: #ffcc00;
}

/* CONTAINER */
.container {
    width: 60%;
    margin: 30px auto;
    background: rgba(255,255,255,0.15);
    backdrop-filter: blur(10px);
    padding: 25px;
    border-radius: 15px;
}

/* PROGRESS BAR */
.progress {
    height: 10px;
    background: rgba(255,255,255,0.2);
    border-radius: 5px;
    margin-bottom: 20px;
}

.progress-bar {
    height: 100%;
    width: 0%;
    background: #28a745;
    border-radius: 5px;
}

/* QUESTION */
.question {
    display: none;
}

.options label {
    display: block;
    background: rgba(255,255,255,0.2);
    padding: 10px;
    margin: 8px 0;
    border-radius: 8px;
    cursor: pointer;
}

.options input {
    margin-right: 10px;
}

/* BUTTONS */
.nav-btn {
    padding: 10px 20px;
    margin: 10px;
    border: none;
    border-radius: 6px;
    background: #007bff;
    color: white;
    cursor: pointer;
}

.submit-btn {
    background: #28a745;
}

.nav-btn:hover {
    opacity: 0.9;
}

/* QUESTION COUNT */
.counter {
    margin-bottom: 10px;
}
</style>

<script>
let current = 0;
let timeLeft = 60;

function showQuestion(index) {
    let q = document.getElementsByClassName("question");

    for (let i = 0; i < q.length; i++) {
        q[i].style.display = "none";
    }

    q[index].style.display = "block";

    document.getElementById("counter").innerHTML =
        "Question " + (index + 1) + " / " + q.length;

    updateProgress(index, q.length);
}

function nextQuestion() {
    let q = document.getElementsByClassName("question");

    if (current < q.length - 1) {
        current++;
        showQuestion(current);
    }
}

function prevQuestion() {
    if (current > 0) {
        current--;
        showQuestion(current);
    }
}

function updateProgress(current, total) {
    let percent = ((current + 1) / total) * 100;
    document.getElementById("progressBar").style.width = percent + "%";
}

/* TIMER */
function startTimer() {
    let timerDisplay = document.getElementById("timer");

    let countdown = setInterval(function () {
        timerDisplay.innerHTML = "Time Left: " + timeLeft + " sec";
        timeLeft--;

        if (timeLeft < 0) {
            clearInterval(countdown);
            alert("Time up! Submitting...");
            document.forms[0].submit();
        }
    }, 1000);
}

window.onload = function () {
    showQuestion(0);
    startTimer();
};
</script>

</head>

<body>

<!-- TOP BAR -->
<div class="top-bar">
    <h3> AIP Quiz</h3>
    <div id="timer">Time Left: 60 sec</div>
</div>

<div class="container">

<div class="counter" id="counter"></div>

<div class="progress">
    <div class="progress-bar" id="progressBar"></div>
</div>

<form action="SubmitQuizServlet" method="post">

<%
Connection con = DBConnection.getConnection();
Statement st = con.createStatement();
ResultSet rs = st.executeQuery("SELECT * FROM questions ORDER BY RAND() LIMIT 10");

int i = 1;

while(rs.next()) {
    int qid = rs.getInt("id");
%>

<div class="question">

<p><b>Q<%= i %>. <%= rs.getString("question") %></b></p>

<div class="options">
<label><input type="radio" name="q<%= qid %>" value="op1"> <%= rs.getString("option1") %></label>
<label><input type="radio" name="q<%= qid %>" value="op2"> <%= rs.getString("option2") %></label>
<label><input type="radio" name="q<%= qid %>" value="op3"> <%= rs.getString("option3") %></label>
<label><input type="radio" name="q<%= qid %>" value="op4"> <%= rs.getString("option4") %></label>
</div>

</div>

<%
i++;
}
%>

<br>

<button type="button" class="nav-btn" onclick="prevQuestion()"> Previous</button>
<button type="button" class="nav-btn" onclick="nextQuestion()">Next </button>

<br><br>

<button type="submit" class="nav-btn submit-btn">Submit Quiz</button>

</form>

</div>

</body>
</html>