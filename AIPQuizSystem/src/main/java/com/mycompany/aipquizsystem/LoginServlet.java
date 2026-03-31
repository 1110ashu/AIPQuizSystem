package com.mycompany.aipquizsystem;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // ✅ Get values and clean them
        String user = request.getParameter("username").trim();
        String pass = request.getParameter("password").trim();

        HttpSession session = request.getSession();

        // ✅ Debug (optional)
        System.out.println("User: " + user);
        System.out.println("Pass: " + pass);

        // ✅ Check credentials
        if ("admin".equals(user) && "admin123".equals(pass)) {

            session.setAttribute("role", "admin");
            response.sendRedirect(request.getContextPath() + "/adminDashboard.jsp");

        } else {
            response.setContentType("text/html");
            response.getWriter().println("<h3 style='color:red;'>Invalid Username or Password</h3>");
            response.getWriter().println("<a href='" + request.getContextPath() + "/login.jsp'>Try Again</a>");
        }
    }
}