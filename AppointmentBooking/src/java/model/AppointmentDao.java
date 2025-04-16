package model;

import pojoPackage.Appointment;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class AppointmentDao {

    // Existing method to fetch appointments by doctor and date
    public List<Appointment> getAppointmentsByDoctorAndDate(int doctorId, String date) {
        List<Appointment> appointments = new ArrayList<>();
        String query = "SELECT * FROM Appointments WHERE doctor_id = ? AND date = ?";

        try (Connection connection = DatabaseConnection.getConnection();
             PreparedStatement statement = connection.prepareStatement(query)) {
            statement.setInt(1, doctorId);
            statement.setDate(2, Date.valueOf(date));

            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                Appointment appointment = new Appointment();
                appointment.setAppointment_id(rs.getString("appointment_id"));
                appointment.setDoctorId(rs.getInt("doctor_id"));
                appointment.setPatient_id(rs.getInt("patient_id"));
                appointment.setDate(rs.getString("date"));
                appointment.setStatus(rs.getInt("status"));
                appointment.setSlot_number(rs.getInt("slot_number"));
                appointments.add(appointment);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return appointments;
    }

    // Existing method to book an appointment
    public boolean bookAppointment(Appointment appointment) {
        String query = "INSERT INTO Appointments (appointment_id, doctor_id, patient_id, date, status, slot_number) VALUES (?, ?, ?, ?, ?, ?)";

        try (Connection connection = DatabaseConnection.getConnection();
             PreparedStatement statement = connection.prepareStatement(query)) {
            statement.setString(1, appointment.getAppointment_id());
            statement.setInt(2, appointment.getDoctorId());
            statement.setInt(3, appointment.getPatient_id());
            statement.setDate(4, Date.valueOf(appointment.getDate()));
            statement.setInt(5, appointment.getStatus());
            statement.setInt(6, appointment.getSlot_number());

            return statement.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    // New method to fetch appointments by patient ID
    public List<Appointment> getAppointmentsByPatientId(int patientId) {
        List<Appointment> appointments = new ArrayList<>();
        String query = "SELECT * FROM Appointments WHERE patient_id = ?";

        try (Connection connection = DatabaseConnection.getConnection();
             PreparedStatement statement = connection.prepareStatement(query)) {
            statement.setInt(1, patientId);

            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                Appointment appointment = new Appointment();
                appointment.setAppointment_id(rs.getString("appointment_id"));
                appointment.setDoctorId(rs.getInt("doctor_id"));
                appointment.setPatient_id(rs.getInt("patient_id"));
                appointment.setDate(rs.getString("date"));
                appointment.setStatus(rs.getInt("status"));
                appointment.setSlot_number(rs.getInt("slot_number"));
                appointments.add(appointment);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return appointments;
    }
}
