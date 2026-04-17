package com.user;

import java.io.*;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.WebServlet;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String password = request.getParameter("password"); // ✅ NEW

        if(name == null || name.isEmpty() || email == null || !email.contains("@") || password.length() < 6) {
            response.getWriter().println("Invalid input!");
            return;
        }
        
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");

            Connection con = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/userdb", "root", "");

            // ✅ UPDATED QUERY
            PreparedStatement ps = con.prepareStatement(
                "INSERT INTO users(name, email, password) VALUES(?,?,?)");

            ps.setString(1, name);
            ps.setString(2, email);
            ps.setString(3, password); // ✅ NEW

            ps.executeUpdate();

            response.sendRedirect("view");

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}