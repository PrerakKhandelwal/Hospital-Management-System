<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>View Doctors</title>
</head>
<body>

    <h2>Doctor List</h2>
    <table border="1">
        <thead>
            <tr>
                <th>Name</th>
                <th>Age</th>
                <th>Speciality</th>
                <th>Phone Number</th>
                <th>Email</th>
                <th>Action</th>
            </tr>
        </thead>
        <tbody>
            <%
                java.sql.ResultSet doctors = (java.sql.ResultSet) request.getAttribute("doctors");
                while (doctors.next()) {
            %>
            <tr>
                <td><%= doctors.getString("name") %></td>
                <td><%= doctors.getInt("age") %></td>
                <td><%= doctors.getString("speciality") %></td>
                <td><%= doctors.getString("phone_number") %></td>
                <td><%= doctors.getString("email") %></td>
                <td>
                    <a href="viewDoctorServlet?action=delete&doctorId=<%= doctors.getInt("doctor_id") %>">Delete</a>
                </td>
            </tr>
            <% } %>
        </tbody>
    </table>

</body>
</html>