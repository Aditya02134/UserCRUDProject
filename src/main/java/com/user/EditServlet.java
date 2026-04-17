package com.user;

import java.io.*;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.WebServlet;

@WebServlet("/edit")
public class EditServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int id = Integer.parseInt(request.getParameter("id"));

        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");

            Connection con = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/userdb", "root", "");

            PreparedStatement ps = con.prepareStatement(
                "SELECT * FROM users WHERE id=?");
            ps.setInt(1, id);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {

                // 🔥 HTML + CSS START
                out.println("<html><head><title>Edit User</title>");

                out.println("<style>");
                out.println("body { font-family: Arial; background: linear-gradient(to right, #4facfe, #00f2fe); display: flex; justify-content: center; align-items: center; height: 100vh; }");
                out.println(".container { background: white; padding: 30px; border-radius: 10px; width: 320px; box-shadow: 0 0 10px rgba(0,0,0,0.2); }");
                out.println("h2 { text-align: center; margin-bottom: 20px; }");
                out.println("input { width: 100%; padding: 10px; margin: 10px 0; border: 1px solid #ccc; border-radius: 5px; }");
                out.println("button { width: 100%; padding: 10px; background: #28a745; color: white; border: none; border-radius: 5px; cursor: pointer; }");
                out.println("button:hover { background: #218838; }");
                out.println("</style>");

                // 🔥 JavaScript Validation
                out.println("<script>");
                out.println("function validateUpdate() {");
                out.println("let email = document.forms['updateForm']['email'].value;");
                out.println("let password = document.forms['updateForm']['password'].value;");
                out.println("if (!email.includes('@')) { alert('Invalid email'); return false; }");
                out.println("if (password.length < 6) { alert('Password must be at least 6 characters'); return false; }");
                out.println("return true;");
                out.println("}");
                out.println("</script>");

                out.println("</head><body>");
                out.println("<div class='container'>");

                // 🔥 Form
                out.println("<h2>Edit User</h2>");

                out.println("<form name='updateForm' action='update' method='post' onsubmit='return validateUpdate()'>");

                out.println("<input type='hidden' name='id' value='" + id + "'/>");

                out.println("<input type='text' name='name' value='" + rs.getString("name") + "' placeholder='Enter Name' required>");
                out.println("<input type='text' name='email' value='" + rs.getString("email") + "' placeholder='Enter Email' required>");
                out.println("<input type='text' name='password' value='" + rs.getString("password") + "' placeholder='Enter Password' required>");

                out.println("<button type='submit'>Update</button>");
                out.println("</form>");

                out.println("</div></body></html>");
            }

            con.close();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}