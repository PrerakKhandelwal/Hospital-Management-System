package controller;

import model.*;
import pojoPackage.*;
import java.util.*;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class AppointmentServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        try {
            // Retrieve parameters from request
            String selectedDoctorId = request.getParameter("selectedDoctorId");
            String date = request.getParameter("appointmentDate");
            String patientId = request.getParameter("patientId");

            // Validate selectedDoctorId, date, and patientId
            if (selectedDoctorId == null || date == null || patientId == null ||
                selectedDoctorId.isEmpty() || date.isEmpty() || patientId.isEmpty()) {
                response.sendRedirect("appointment.jsp?error=Invalid input. Please select a doctor, date, and provide patient ID.");
                return;
            }

            // Parse selectedDoctorId and patientId to integer
            int doctorId;
            int pid;
            try {
                doctorId = Integer.parseInt(selectedDoctorId);
                pid = Integer.parseInt(patientId);
            } catch (NumberFormatException e) {
                response.sendRedirect("appointment.jsp?error=Invalid doctor or patient ID.");
                return;
            }

            // Fetch existing appointments for the doctor on the selected date
            AppointmentDao appointmentDao = new AppointmentDao();
            List<Appointment> appointments = appointmentDao.getAppointmentsByDoctorAndDate(doctorId, date);

            // Fetch doctor details
            DoctorDao doctorDao = new DoctorDao();
            Doctor doctor = doctorDao.getDoctorById(doctorId);
            if (doctor == null) {
                response.sendRedirect("appointment.jsp?error=Invalid doctor ID.");
                return;
            }

            String doctorName = doctor.getName();

            // Calculate next available slot number
            int slotNumber = appointments.size() + 1;
            if (slotNumber <= 6) {
                // Set booking details in request attributes
                request.setAttribute("doctorId", doctorId);
                request.setAttribute("doctorName", doctorName);
                request.setAttribute("date", date);
                request.setAttribute("slotNumber", slotNumber);
                request.setAttribute("patientId", pid);

                // Forward to payment.jsp
                request.getRequestDispatcher("payment.jsp").forward(request, response);
            } else {
                // Redirect back if no slots are available
                response.sendRedirect("appointment.jsp?error=No slots available for this doctor on the selected date.");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("appointment.jsp?error=An error occurred while processing your request.");
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
        return "Short description";
    }
}
