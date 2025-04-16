package controller;

// Patient Appointment

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import model.AppointmentDao;
import pojoPackage.Appointment;

public class ViewAppointmentServlet extends HttpServlet {

    private AppointmentDao appointmentDao = new AppointmentDao();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        Integer patientIdObj = (Integer) request.getSession().getAttribute("patient_id");
        int patientId = (patientIdObj != null) ? patientIdObj : 0;

        if (patientId == 0) {
            response.sendRedirect("patientLogin.jsp"); // Redirect to login if not logged in
            return;
        }

        try {
            // Fetch the patient's name
            String patientName = appointmentDao.getPatientName(patientId);
            request.setAttribute("patientName", patientName);

            // Fetch the list of appointments
            List<Appointment> appointments = appointmentDao.getAppointmentsByPatientId(patientId);
            request.setAttribute("appointments", appointments);

        } catch (SQLException e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Database error.");
        }

        RequestDispatcher dispatcher = request.getRequestDispatcher("viewAppointmentPatient.jsp");
        dispatcher.forward(request, response);
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
        return "Servlet to display patient appointments";
    }
}
