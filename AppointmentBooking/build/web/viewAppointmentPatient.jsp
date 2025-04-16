<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="pojoPackage.Appointment"%>
<%@ page import="model.DoctorDao" %>
<!DOCTYPE html>
<html>
<head>
    <title>Your Appointments</title>
    <link rel="stylesheet" href="assets/css/style.css">
</head>
<body>
    <header>
        <h1>Welcome, <%= request.getAttribute("patientName") %></h1> <!-- Display patient's name -->
    </header>

    <!-- Appointment Table -->
    <h2>Your Appointments:</h2>
    <table border="1">
        <thead>
            <tr>
                <th>Appointment ID</th>
                <th>Doctor ID</th>
                <th>Doctor Name</th>
                <th>Appointment Date</th>
                <th>Presciption</th>
                <th>Slot Number</th>
            </tr>
        </thead>
        <tbody>
            <% 
                List<Appointment> appointments = (List<Appointment>) request.getAttribute("appointments");
                if (appointments != null && !appointments.isEmpty()) {
                    for (Appointment appointment : appointments) {
            %>
                    <tr>
                        <td><%= appointment.getAppointment_id() %></td>
                        <td><%= appointment.getDoctorId() %></td>
                        <td> <%= DoctorDao.getDoctorById(appointment.getDoctorId()).getName() %></td>
                        <td><%= appointment.getDate() %></td>
                        <td><%= appointment.getPrescription() %></td>
                        <td><%= appointment.getSlot_number() %></td>
                    </tr>
            <% 
                    }
                } else {
            %>
                    <tr>
                        <td colspan="4">You have no appointments scheduled.</td>
                    </tr>
            <% 
                }
            %>
        </tbody>
    </table>

</body>
</html>