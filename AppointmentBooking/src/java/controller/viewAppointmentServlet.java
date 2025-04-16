/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.io.*;
import java.sql.*;
import java.util.*;
import pojoPackage.Appointment;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 *
 * @author HP
 */
public class viewAppointmentServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
       
        int patientId = (Integer) request.getSession().getAttribute("patient_id"); // Assuming patient_id is saved in session

        if (patientId == 0) {
            response.sendRedirect("patientLogin.jsp"); // Redirect to login if not logged in
            return;
        }

        // Fetch patient's name using the patient_id
        try (Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD)) {
            // Query to fetch patient details
            String patientQuery = "SELECT name FROM patient WHERE patient_id = ?";
            try (PreparedStatement pstmt = conn.prepareStatement(patientQuery)) {
                pstmt.setInt(1, patientId);
                ResultSet rs = pstmt.executeQuery();
                if (rs.next()) {
                    request.setAttribute("patientName", rs.getString("name"));
                }
            }

            // Fetch the patient's appointments from the appointment table
            String appointmentQuery = "SELECT * FROM appointment WHERE patient_id = ?";
            try (PreparedStatement pstmt = conn.prepareStatement(appointmentQuery)) {
                pstmt.setInt(1, patientId);
                ResultSet rs = pstmt.executeQuery();
                List<Appointment> appointments = new ArrayList<>();
                while (rs.next()) {
                    Appointment appointment = new Appointment();
                    appointment.setAppointmentId(rs.getInt("appointment_id"));
                    appointment.setDoctorId(rs.getInt("doctor_id"));
                    appointment.setDate(rs.getString("appointment_date"));
                    appointment.setSlotNumber(rs.getInt("slot_number"));
                    appointments.add(appointment);
                }
                request.setAttribute("appointments", appointments);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        // Forward the request to the viewAppointment.jsp page
        RequestDispatcher dispatcher = request.getRequestDispatcher("viewAppointment.jsp");
        dispatcher.forward(request, response);
    }
        
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
