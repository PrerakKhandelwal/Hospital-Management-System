<%-- 
    Document   : doctorView
    Created on : 10-Nov-2024, 1:01:33 am
    Author     : mayankmer
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%
    // Dummy doctor data
    String doctorName = (String) session.getAttribute("doctorName"); 
    String specialty = (String) session.getAttribute("specialty"); 
    
    // Dummy patient appointment data
    class Appointment {
        int srNo;
        String patientName;
        String appointmentDate;
        int tokenNumber;
        
        public Appointment(int srNo, String patientName, String appointmentDate, int tokenNumber) {
            this.srNo = srNo;
            this.patientName = patientName;
            this.appointmentDate = appointmentDate;
            this.tokenNumber = tokenNumber;
        }
    }
    
    ArrayList<Appointment> appointments = new ArrayList<>();
    appointments.add(new Appointment(1, "John Doe", "2024-11-10", 101));
    appointments.add(new Appointment(2, "Jane Smith", "2024-11-11", 102));
    appointments.add(new Appointment(3, "Robert Brown", "2024-11-12", 103));
%>

<!DOCTYPE html>
<html>
<head>
    <title>Doctor Profile</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f2f2f2;
            margin: 0;
            padding: 0;
        }
        .container {
            width: 80%;
            margin: auto;
            padding: 20px;
            background-color: #fff;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
        }
        h2, h3 {
            color: #333;
        }
        .profile-info {
            background-color: #4CAF50;
            color: #fff;
            padding: 10px;
            border-radius: 5px;
            margin-bottom: 20px;
        }
        .profile-info h2, .profile-info p {
            margin: 0;
            padding: 5px;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 10px;
        }
        table, th, td {
            border: 1px solid #ddd;
            padding: 8px;
        }
        th {
            background-color: #4CAF50;
            color: white;
            text-align: center;
        }
        td {
            text-align: center;
        }
        button {
            background-color: #f44336;
            color: white;
            border: none;
            padding: 5px 10px;
            border-radius: 3px;
            cursor: pointer;
        }
        button:hover {
            background-color: #d32f2f;
        }
    </style>
</head>
<body>
    <div class="container">
        <!-- Doctor's Profile Information -->
        <div class="profile-info">
            <h2>Welcome, Dr. <%= doctorName %></h2>
            <p>Speciality: <%= specialty %></p>
        </div>

        <!-- Appointments Table -->
        <h3>Your Appointments</h3>
        <table>
            <thead>
                <tr>
                    <th>Sr. No.</th>
                    <th>Patient Name</th>
                    <th>Appointment Date</th>
                    <th>Token Number</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <% for (Appointment appointment : appointments) { %>
                    <tr>
                        <td><%= appointment.srNo %></td>
                        <td><%= appointment.patientName %></td>
                        <td><%= appointment.appointmentDate %></td>
                        <td><%= appointment.tokenNumber %></td>
                        <td>
                            <form action="DeleteAppointmentServlet" method="post" style="display:inline;">
                                <input type="hidden" name="tokenNumber" value="<%= appointment.tokenNumber %>"/>
                                <button type="submit">Delete</button>
                            </form>
                        </td>
                    </tr>
                <% } %>
            </tbody>
        </table>
    </div>
</body>
</html>
