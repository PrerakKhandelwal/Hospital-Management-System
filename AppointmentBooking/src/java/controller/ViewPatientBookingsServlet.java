package controller;

import model.AppointmentDao;
import pojoPackage.Appointment;

import java.io.IOException;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class ViewPatientBookingsServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        try {
            // Retrieve patient ID from the request
            String patientIdStr = request.getParameter("patientId");

            // Check if patientId is valid
            if (patientIdStr == null || patientIdStr.isEmpty()) {
                response.sendRedirect("error.jsp?message=Patient ID is required.");
                return;
            }

            int patientId = Integer.parseInt(patientIdStr);  // Parse patientId

            // Get bookings for the patient
            AppointmentDao appointmentDao = new AppointmentDao();
            List<Appointment> appointments = appointmentDao.getAppointmentsByPatientId(patientId);

            // Check if there are any appointments for the patient
            if (appointments == null || appointments.isEmpty()) {
                request.setAttribute("message", "You have no appointments scheduled.");
            } else {
                // Set appointments in request attribute and forward to JSP
                request.setAttribute("appointments", appointments);
            }

            // Forward the request to the JSP page to display appointments
            request.getRequestDispatcher("viewPatientBookings.jsp").forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("error.jsp?message=Error retrieving bookings.");
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
