package com.mycompany.aipquizsystem;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet("/AddQuestionServlet")
public class AddQuestionServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String question = request.getParameter("question");
        String op1 = request.getParameter("op1");
        String op2 = request.getParameter("op2");
        String op3 = request.getParameter("op3");
        String op4 = request.getParameter("op4");
        String correct = request.getParameter("correct");

        try {
            Connection con = DBConnection.getConnection();

            PreparedStatement ps = con.prepareStatement(
                "INSERT INTO questions(question, option1, option2, option3, option4, correct_answer) VALUES (?,?,?,?,?,?)"
            );

            ps.setString(1, question);
            ps.setString(2, op1);
            ps.setString(3, op2);
            ps.setString(4, op3);
            ps.setString(5, op4);
            ps.setString(6, correct);

            ps.executeUpdate();

            // ✅ Redirect back to same page with success flag
            response.sendRedirect("addQuestion.jsp?success=1");

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("addQuestion.jsp?success=0");
        }
    }
}