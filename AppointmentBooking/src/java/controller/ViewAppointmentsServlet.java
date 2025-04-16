package controller;

import jakarta.servlet.ServletException;
//import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import model.AppointmentDao;
import model.DatabaseConnection;

public class ViewAppointmentsServlet extends HttpServlet {

    // Using AppointmentDao to handle database operations
    AppointmentDao ap = new AppointmentDao();
    

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        String sql = "SELECT a.appointment_id, a.date, a.slot_number, p.name AS patient_name, d.name AS doctor_name "
                   + "FROM Appointments a "
                   + "JOIN Patient p ON a.patient_id = p.patient_id "
                   + "JOIN Doctor d ON a.doctor_id = d.doctor_id";

        try (Connection connection = DatabaseConnection.getConnection();  // Using AppointmentDao for connection
             PreparedStatement statement = connection.prepareStatement(sql);
             ResultSet resultSet = statement.executeQuery()) {

            // Setting the ResultSet as an attribute for the JSP to access
            request.setAttribute("appointments", resultSet);
            request.getRequestDispatcher("viewAppointments.jsp").forward(request, response);

        } catch (SQLException e) {
            e.printStackTrace();
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

    @Override
    public String getServletInfo() {
        return "Servlet for viewing appointments";
    }
}
