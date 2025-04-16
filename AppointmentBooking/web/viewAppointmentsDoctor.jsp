<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>View Appointments</title>
</head>
<body>

    <h2>Appointment List</h2>
    <table border="1">
        <thead>
            <tr>
                <th>Appointment ID</th>
                <th>Doctor</th>
                <th>Patient</th>
                <th>Date</th>
                <th>Slot Number</th>
            </tr>
        </thead>
        <tbody>
            <%
                java.sql.ResultSet appointments = (java.sql.ResultSet) request.getAttribute("appointments");
                while (appointments.next()) {
            %>
            <tr>
                <td><%= appointments.getString("appointment_id") %></td>
                <td><%= appointments.getString("doctor_name") %></td>
                <td><%= appointments.getString("patient_name") %></td>
                <td><%= appointments.getDate("date") %></td>
                <td><%= appointments.getInt("slot_number") %></td>
            </tr>
            <% } %>
        </tbody>
    </table>

</body>
</html>