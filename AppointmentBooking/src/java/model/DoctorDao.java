/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;
import pojoPackage.Doctor;
//import modelDatabaseConnection;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author HP
 */
public class DoctorDao {
     public List<Doctor> getDoctorsBySpecialty(String specialty) {
        List<Doctor> doctors = new ArrayList<>();
        String query = "SELECT * FROM Doctor WHERE LOWER(speciality) = ?";
        
        try (Connection connection = DatabaseConnection.getConnection();
             PreparedStatement statement = connection.prepareStatement(query)) {
            statement.setString(1, specialty.toLowerCase());
            ResultSet rs = statement.executeQuery();
            
            while (rs.next()) {
                Doctor doctor = new Doctor();
                doctor.setDoctorId(rs.getInt("doctor_id"));
                doctor.setLnNum(rs.getString("license_number"));
                doctor.setName(rs.getString("name"));
                doctor.setAge(rs.getInt("age"));
                doctor.setSpecialty(rs.getString("speciality"));
                doctor.setYoe(rs.getInt("experience"));
                doctor.setQualification(rs.getString("qualification"));
                doctor.setPhNum(rs.getString("phone_number"));
                doctors.add(doctor);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return doctors;
    }
     
     
     // Method to retrieve a Doctor object based on doctorId
    public static Doctor getDoctorById(int doctorId) {
        Doctor doctor = null;
        String query = "SELECT * FROM Doctor WHERE doctor_id = ?";
        
        try (Connection connection = DatabaseConnection.getConnection();
             PreparedStatement statement = connection.prepareStatement(query)) {
            statement.setInt(1, doctorId);
            ResultSet rs = statement.executeQuery();
            
            if (rs.next()) {
                doctor = new Doctor();
                doctor.setDoctorId(rs.getInt("doctor_id")); // setting doctorId
                doctor.setLnNum(rs.getString("license_number")); // setting license number
                doctor.setName(rs.getString("name"));
                doctor.setAge(rs.getInt("age"));
                doctor.setSpecialty(rs.getString("speciality"));
                doctor.setYoe(rs.getInt("experience"));
                doctor.setPhNum(rs.getString("phone_number"));
                //doctor.setUsrName(rs.getString("username"));
                //doctor.setPwd(rs.getString("password"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        
        return doctor;
    }
        public List<Doctor> fetchDoctors() {
        List<Doctor> doctors = new ArrayList<>();
        String sql = "SELECT * FROM doctor";

        try (Connection connection = DatabaseConnection.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql);
             ResultSet resultSet = statement.executeQuery()) {

            while (resultSet.next()) {
                Doctor doctor = new Doctor();
                doctor.setDoctorId(resultSet.getInt("doctor_id"));
                doctor.setName(resultSet.getString("name"));
                doctor.setAge(resultSet.getInt("age"));
                doctor.setSpecialty(resultSet.getString("specialty"));
                doctor.setPhNum(resultSet.getString("phone_number"));
                doctor.setUsrName(resultSet.getString("email"));
                doctors.add(doctor);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return doctors;
    }
        // Delete a doctor by their ID
    public void deleteDoctor(String doctorId) {
        String sql = "DELETE FROM doctor WHERE doctor_id = ?";

        try (Connection connection = DatabaseConnection.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql)) {

            statement.setString(1, doctorId);
            statement.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    
        public static Doctor getDoctorfromUser(int userId) {
        String sql = "SELECT * FROM Doctor WHERE user_id=?";   
        Doctor doctor = null;
        try (Connection connection = DatabaseConnection.getConnection();
             PreparedStatement stmt = connection.prepareStatement(sql)) {
              stmt.setInt(1, userId);
            try (ResultSet userResultSet = stmt.executeQuery()) {
                System.out.println("Error is here look");
                System.out.println(userResultSet);
                if (userResultSet.next()) {
                    doctor = new Doctor();
                   doctor.setDoctorId(userResultSet.getInt(1));
                }
            }
            
        } catch (SQLException e) {
            e.printStackTrace();
        }    
        return doctor;
    }
     
}
