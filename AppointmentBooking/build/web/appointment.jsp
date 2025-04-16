<%@page import="java.util.List"%> 
<%@page import="pojoPackage.Doctor"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Book an Appointment</title>
    <link rel="stylesheet" href="assets/css/style.css">
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f8fb;
            color: #333;
            margin: 0;
            padding: 0;
            display: flex;
            flex-direction: column;
            align-items: center;
        }

        header {
            background-color: #2196F3;
            color: white;
            padding: 20px;
            width: 100%;
            text-align: center;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        h1, h2 {
            margin: 10px 0;
        }

        .appointment-form, .appointment-date, .appointment-patient {
            margin: 20px 0;
            text-align: center;
        }

        label {
            font-weight: bold;
            margin-right: 10px;
        }

        select, input[type="date"], input[type="text"] {
            padding: 8px;
            margin: 0 10px;
            border-radius: 5px;
            border: 1px solid #ccc;
            font-size: 1em;
            width: 200px;
        }

        button {
            background-color: #2196F3;
            color: white;
            border: none;
            padding: 10px 20px;
            font-size: 1em;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        button:hover {
            background-color: #1a73e8;
        }

        .error-message {
            color: red;
            margin: 10px 0;
            text-align: center;
        }

        table {
            width: 90%;
            max-width: 800px;
            margin: 20px auto;
            border-collapse: collapse;
            background-color: #fff;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        table, th, td {
            border: 1px solid #ddd;
        }

        th, td {
            padding: 12px;
            text-align: center;
        }

        th {
            background-color: #2196F3;
            color: white;
        }

        tr:nth-child(even) {
            background-color: #f4f8fb;
        }

        .appointment-date, .appointment-patient {
            display: flex;
            justify-content: center;
            align-items: center;
            margin: 15px 0;
        }
    </style>
</head>
<body>
    <header>
        <h1>Book an Appointment</h1>
    </header>

    <!-- Display Error Message if Present -->
    <%
        String errorMessage = request.getParameter("error");
        if (errorMessage != null && !errorMessage.isEmpty()) {
    %>
        <div class="error-message">
            <p><%= errorMessage %></p>
        </div>
    <%
        }
    %>

    <!-- Specialty Dropdown Form -->
    <div class="appointment-form">
        <form action="GetAvailableDoctors" method="POST">
            <label for="specialty">Choose Specialty:</label>
            <select id="specialty" name="specialty">
                <option value="">--Select Specialty--</option>
                <option value="physician">Physician</option>
                <option value="cardiologist">Cardiologist</option>
                <option value="dermatologist">Dermatologist</option>
                <option value="ent">ENT</option>
                <option value="pediatrician">Pediatrician</option>
                <option value="orthopedist">Orthopedist</option>
            </select>
            <button type="submit">Show Available Doctors</button>
        </form>
    </div>

    <!-- Available Doctors Table -->
    <h2>Available Doctors</h2>
    <form action="Appointment" method="POST">
        <table>
            <thead>
                <tr>
                    <th>Select</th>
                    <th>ID</th>
                    <th>Name</th>
                    <th>Specialty</th>
                    <th>Qualification</th>
                    <th>Experience</th>
                </tr>
            </thead>
            <tbody>
                <% 
                    List<Doctor> availableDoctors = (List<Doctor>) request.getAttribute("availableDoctors");
                    if (availableDoctors != null && !availableDoctors.isEmpty()) {
                        for (Doctor doctor : availableDoctors) { 
                %>
                            <tr>
                                <td>
                                    <input type="radio" name="selectedDoctorId" value="<%= doctor.getDoctorId() %>" required>
                                </td>
                                <td><%= doctor.getDoctorId() %></td>
                                <td><%= doctor.getName() %></td>
                                <td><%= doctor.getSpecialty() %></td>
                                <td><%= doctor.getQualification() != null ? doctor.getQualification() : "N/A" %></td>
                                <td><%= doctor.getYoe() %> years</td>
                            </tr>
                <% 
                        } 
                    } else { 
                %>
                        <tr>
                            <td colspan="6">No doctors available for the selected specialty.</td>
                        </tr>
                <% } %>
            </tbody>
        </table>

        <!-- Date Picker and Patient ID Fields -->
        <div class="appointment-date">
            <label for="appointmentDate">Choose Date:</label>
            <input type="date" id="appointmentDate" name="appointmentDate" required>
        </div>

        <div class="appointment-patient">
            <label for="patientId">Patient ID:</label>
            <input type="text" id="patientId" name="patientId" required>
        </div>

        <button type="submit">Confirm Appointment</button>
    </form>
</body>
</html>