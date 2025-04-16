package controller;

import model.DatabaseConnection;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;

@WebServlet("/DoctorLoginServlet")
public class doctorLoginServlet extends HttpServlet {
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        // Retrieve username and password from the form
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        // Correct SQL query to authenticate doctor
        String query = "SELECT user_id FROM users WHERE role='doctor' AND username=? AND password=?";

        boolean isValidUser = false;
        int user_id = -1;

        try (Connection con = DatabaseConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(query)) {

            // Set parameters for PreparedStatement
            ps.setString(1, username);
            ps.setString(2, password);

            // Execute query
            try (ResultSet rs = ps.executeQuery()) {
                if(rs.next()) {
                    isValidUser = true;
                    user_id = rs.getInt("user_id");
                }
            }

// Assuming user_id is set during user validation
            if (isValidUser) {
                HttpSession session = request.getSession();
                session.setAttribute("username", username);
                session.setAttribute("user_id", user_id);

                // Append user_id to the URL for URL rewriting
                String redirectUrl = "doctorView.jsp?user_id=" + user_id;
                response.sendRedirect(redirectUrl);
            } else {
                // Redirect to login page with an error message if validation fails
                response.sendRedirect("doctorLogin.jsp?error=invalid");
            }


        } catch (SQLException e) {
            e.printStackTrace();
            // Optionally, redirect to an error page
            response.sendRedirect("doctorLogin.jsp?error=exception");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }
}