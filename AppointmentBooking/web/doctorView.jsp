<%@page import="model.DatabaseConnection"%>
<%--<%@ page import="appointmentDAO.AppointmentBookingDAO" %>--%>
<%@ page import="pojoPackage.Appointment" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.sql.*" %>
<%@ page import="model.DoctorDao" %>
<%@ page import="pojoPackage.Doctor" %>

<%
    
    Doctor doctor = DoctorDao.getDoctorfromUser((int)session.getAttribute("user_id"));
    int doctor_id = doctor.getDoctorId();
    String query = "SELECT * FROM appointments where doctor_id = ?";
    Connection con = null;
    ArrayList<Appointment> appointments = new ArrayList<>();
    int user_id = -1;
    String username = (String) session.getAttribute("username");
//    String userIdStr = request.getParameter("user_id");
//    if (userIdStr != null) {
//        user_id = Integer.parseInt(userIdStr);
//        // Use user_id in the page as needed, e.g., for database queries
//    } else {
//        // Optionally handle the case when user_id is missing
//        response.sendRedirect("doctorLogin.jsp");
//        return;
//    }

    try {
        con = DatabaseConnection.getConnection();
        if (con != null) {
            try (PreparedStatement ps = con.prepareStatement(query)) {
                ps.setInt(1, doctor_id);

                try (ResultSet rs = ps.executeQuery()) {
                    while (rs.next()) {
                        Appointment e = new Appointment();
                        e.setStatus(rs.getInt("status"));
                        e.setPatientName(rs.getString("patientName"));
                        e.setDate(rs.getString("date"));
                        e.setSlot_number(rs.getInt("slot_number"));
                        appointments.add(e);
                    }
                }
            }
        }
    } catch (SQLException e) {
        e.printStackTrace();
    } finally {
        if (con != null) {
            try {
                con.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
%>


<!DOCTYPE html>
<html>
<head>
    <title>Doctor Profile</title>
    <style>
        body { font-family: Arial, sans-serif; background-color: #f2f2f2; margin: 0; padding: 0; }
        .container { width: 80%; margin: auto; padding: 20px; background-color: #fff; box-shadow: 0 0 10px rgba(0, 0, 0, 0.1); border-radius: 8px; }
        h2, h3 { color: #333; }
        .profile-info { background-color: #4CAF50; color: #fff; padding: 10px; border-radius: 5px; margin-bottom: 20px; }
        table { width: 100%; border-collapse: collapse; margin-top: 10px; }
        table, th, td { border: 1px solid #ddd; padding: 8px; }
        th { background-color: #4CAF50; color: white; text-align: center; }
        td { text-align: center; }
    </style>
</head>
<body>
    <h2>Welcome!</h2>
    <p>Here's an overview of your appointments and tasks for the day.</p>
    <div class="container">
        <h3>Your Appointments</h3>
        <table>
            <thead>
                <tr>
                    <th>Sr. No.</th>
                    <th>Patient Name</th>
                    <th>Appointment Date</th>
                    <th>Token Number</th>
                    <th>Prescription</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <% int srNo = 1;
                   for (Appointment appointment : appointments) {
                %>
                    <tr>
                        <td><%= srNo++ %></td>
                        <td><%= appointment.getPatientName() %></td>
                        <td><%= appointment.getDate() %></td>
                        <td><%= appointment.getSlot_number() %></td>
                        <td>
                            <form action="EndAppointmentServlet" method="post" style="display:inline;">
                                <input type="text" name="prescription" placeholder="Write Prescription" required />
                                <input type="hidden" name="tokenNumber" value="<%= appointment.getSlot_number() %>"/>
                        </td>
                        <td>
                            <% if (appointment.getStatus() == 1) { %>
                                <button type="submit">End Appointment</button>
                            <% } else { %>
                                <button disabled>Appointment Ended</button>
                            <% } %>
                            </form>
                        </td>
                    </tr>
                <% } %>
            </tbody>
        </table>
    </div>
</body>
</html>