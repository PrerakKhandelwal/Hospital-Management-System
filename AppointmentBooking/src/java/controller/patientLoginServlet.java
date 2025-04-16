package controller;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.PatientDao;
import pojoPackage.Patient;

/**
 * Servlet implementation class patientLoginServlet
 */
public class patientLoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String username = request.getParameter("username").trim().toString();
        String password = request.getParameter("password").trim().toString();

        // Validate the patient and fetch additional details
        int patient_id = validatePatient(username, password);

        if (patient_id != -1) {
            HttpSession session = request.getSession();
            session.setAttribute("userId", patient_id);
            response.sendRedirect("patientView.jsp");
        } else {
            response.sendRedirect("patientLogin.jsp?error=Invalid credentials. Please try again.");
        }
    }

    private int validatePatient(String username, String password) {
        PatientDao patientDao = new PatientDao();
        return patientDao.getPatientDetailsByUsernameAndPassword(username, password);
    }
}
