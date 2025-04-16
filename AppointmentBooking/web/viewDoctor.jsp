<%@page import="pojoPackage.Doctor" %>
<%@page import="java.util.List" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>View Doctors</title>
    <style>
        body { font-family: Arial, sans-serif; background-color: #f9f9f9; }
        table { width: 100%; border-collapse: collapse; margin-top: 20px; }
        th, td { padding: 8px 12px; border: 1px solid #ddd; text-align: center; }
        th { background-color: #4CAF50; color: #fff; }
        .container { width: 80%; margin: auto; }
    </style>
</head>
<body>

<div class="container">
    <h2>Doctor List</h2>
    <table>
        <thead>
            <tr>
                <th>Name</th>
                <th>Age</th>
                <th>Specialty</th>
                <th>Phone Number</th>
                <th>Email</th>
                <th>Action</th>
            </tr>
        </thead>
        <tbody>
            <% 
                // Retrieve the list of doctors from the request attribute
                List<Doctor> doctors = (List<Doctor>) request.getAttribute("doctors");
                
                // Iterate through the list to display each doctor's information
                for (Doctor doctor : doctors) {
            %>
            <tr>
                <td><%= doctor.getName() %></td>
                <td><%= doctor.getAge() %></td>
                <td><%= doctor.getSpecialty() %></td>
                <td><%= doctor.getPhNum() %></td>
                <td><%= doctor.getUsrName() %></td>
                <td>
                    <a href="viewDoctorServlet?action=delete&doctorId=<%= doctor.getDoctorId() %>">Delete</a>
                </td>
            </tr>
            <% } %>
        </tbody>
    </table>
</div>

</body>
</html>
