package com.mycompany.aipquizsystem;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet("/DeleteQuestionServlet")
public class DeleteQuestionServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int id = Integer.parseInt(request.getParameter("id"));

        try {
            Connection con = DBConnection.getConnection();

            PreparedStatement ps = con.prepareStatement("DELETE FROM questions WHERE id=?");
            ps.setInt(1, id);
            ps.executeUpdate();

            response.sendRedirect("viewQuestions.jsp");

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}