package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;
import model.DoctorDao;  // Import the DoctorDAO class
import pojoPackage.Doctor;

public class viewDoctorServlet extends HttpServlet {

    private DoctorDao doctorDAO = new DoctorDao(); // Instantiate the DAO

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getParameter("action");

        if ("delete".equals(action)) {
            String doctorId = request.getParameter("doctorId");
            doctorDAO.deleteDoctor(doctorId); // Use DAO to delete doctor
        }

        List<Doctor> doctors = doctorDAO.fetchDoctors(); // Use DAO to fetch doctors
        request.setAttribute("doctors", doctors);
        request.getRequestDispatcher("viewDoctor.jsp").forward(request, response);
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
        return "Servlet for viewing and managing doctors";
    }
}
