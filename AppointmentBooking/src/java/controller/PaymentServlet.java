package controller;

import model.AppointmentDao;
import pojoPackage.Appointment;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class PaymentServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        try {
            // Retrieve parameters from request
            String doctorIdStr = request.getParameter("doctorId");
            String doctorName = request.getParameter("doctorName");
            String dateStr = request.getParameter("date");
            String slotNumberStr = request.getParameter("slotNumber");
            String patientIdStr = request.getParameter("patientId");

            // Validate input
            if (doctorIdStr == null || doctorName == null || dateStr == null || slotNumberStr == null || patientIdStr == null ||
                doctorIdStr.isEmpty() || doctorName.isEmpty() || dateStr.isEmpty() || slotNumberStr.isEmpty() || patientIdStr.isEmpty()) {
                request.setAttribute("error", "Invalid input. Please try again.");
                request.getRequestDispatcher("payment.jsp").forward(request, response);
                return;
            }

            // Parse parameters
            int doctorId;
            int slotNumber;
            int patientId;
            Date date;
            try {
                doctorId = Integer.parseInt(doctorIdStr);
                slotNumber = Integer.parseInt(slotNumberStr);
                patientId = Integer.parseInt(patientIdStr);
                date = new SimpleDateFormat("yyyy-MM-dd").parse(dateStr);
            } catch (NumberFormatException | java.text.ParseException e) {
                request.setAttribute("error", "Invalid input format.");
                request.getRequestDispatcher("payment.jsp").forward(request, response);
                return;
            }

            // Simulate payment processing
            boolean paymentSuccess = processPayment();
            if (!paymentSuccess) {
                request.setAttribute("error", "Payment failed. Please try again.");
                request.getRequestDispatcher("payment.jsp").forward(request, response);
                return;
            }

            // Generate appointment ID
            String appointmentId = dateStr.replace("-", "") + doctorIdStr + slotNumberStr;

            // Save appointment to database
            Appointment appointment = new Appointment();
            appointment.setAppointment_id(appointmentId);
            appointment.setDoctorId(doctorId);
            appointment.setDate(new SimpleDateFormat("yyyy-MM-dd").format(date));
            appointment.setSlot_number(slotNumber);
            appointment.setPatient_id(patientId);

            AppointmentDao appointmentDao = new AppointmentDao();
            boolean saveSuccess = appointmentDao.bookAppointment(appointment);
            if (!saveSuccess) {
                request.setAttribute("error", "Failed to save appointment. Please try again.");
                request.getRequestDispatcher("payment.jsp").forward(request, response);
                return;
            }

            // Set success message and pass the patientId to the next page
            request.setAttribute("successMessage", "Booking successful! Your appointment ID is " + appointmentId);
            request.setAttribute("patientId", patientId); // Pass patientId to the next page

            // Forward to viewPatientBookings.jsp to display the patient's appointments
            request.getRequestDispatcher("viewPatientBookings.jsp").forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "An error occurred while processing your request.");
            request.getRequestDispatcher("payment.jsp").forward(request, response);
        }
    }

    private boolean processPayment() {
        // Simulate payment processing logic here
        // In a real-world application, you would integrate with a payment gateway
        return true; // Assume payment is successful
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
