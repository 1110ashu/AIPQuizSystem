package com.mycompany.aipquizsystem;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet("/SubmitQuizServlet")
public class SubmitQuizServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int score = 0;
        int total = 0;

        try {
            Connection con = DBConnection.getConnection();

            // ✅ Get only displayed question IDs
            String[] qids = request.getParameterValues("qid");

            if (qids != null) {

                for (String qidStr : qids) {

                    int qid = Integer.parseInt(qidStr);

                    PreparedStatement ps = con.prepareStatement(
                        "SELECT correct_answer FROM questions WHERE id=?"
                    );

                    ps.setInt(1, qid);

                    ResultSet rs = ps.executeQuery();

                    if (rs.next()) {

                        String correct = rs.getString("correct_answer");
                        String userAns = request.getParameter("q" + qid);

                        if (userAns != null && userAns.equals(correct)) {
                            score++;
                        }
                    }

                    total++;
                }
            }

            double percentage = (score * 100.0) / total;

            String performance;

            if (percentage >= 70) {
                performance = "Good";
            } else if (percentage >= 40) {
                performance = "Average";
            } else {
                performance = "Poor";
            }

            response.setContentType("text/html");

            request.setAttribute("score", score);
            request.setAttribute("total", total);
            request.setAttribute("percentage", percentage);
            request.setAttribute("performance", performance);

// Forward to result.jsp
            request.getRequestDispatcher("result.jsp").forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("ERROR: " + e.getMessage());
        }
    }
}