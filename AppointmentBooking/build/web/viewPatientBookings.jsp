<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>View Patient Bookings</title>
    <style>
        table {
            width: 100%;
            border-collapse: collapse;
        }
        table, th, td {
            border: 1px solid black;
            padding: 10px;
            text-align: center;
        }
        th {
            background-color: #f2f2f2;
        }
        .message {
            color: red;
            font-weight: bold;
        }
    </style>
</head>
<body>

<h2>Patient Appointments</h2>

<!-- Check if appointments list is empty or null -->
<c:if test="${empty appointments}">
    <p class="message">No bookings found for this patient.</p>
</c:if>

<!-- If there are appointments, display them in a table -->
<c:if test="${not empty appointments}">
    <table>
        <thead>
            <tr>
                <th>Appointment ID</th>
                <th>Doctor ID</th>
                <th>Date</th>
                <th>Slot Number</th>
                <th>Status</th>
            </tr>
        </thead>
        <tbody>
            <!-- Loop through appointments list and display each one -->
            <c:forEach var="appointment" items="${appointments}">
                <tr>
                    <td>${appointment.appointment_id}</td>
                    <td>${appointment.doctorId}</td>
                    <td>${appointment.date}</td>
                    <td>${appointment.slot_number}</td>
                    <td>
                        <!-- Convert status number to readable format -->
                        <c:choose>
                            <c:when test="${appointment.status == 1}">Confirmed</c:when>
                            <c:otherwise>Pending</c:otherwise>
                        </c:choose>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</c:if>

</body>
</html>
