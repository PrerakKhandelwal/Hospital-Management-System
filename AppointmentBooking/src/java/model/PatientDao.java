package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import pojoPackage.Patient;

public class PatientDao {

    public int getPatientDetailsByUsernameAndPassword(String username, String password) {
        Patient patient = null;
        String userSql = "SELECT * FROM users WHERE username = ? AND password = ? AND role = 'patient' ";

        try (Connection connection = DatabaseConnection.getConnection();
             PreparedStatement userStatement = connection.prepareStatement(userSql)) {
            userStatement.setString(1, username);
            userStatement.setString(2, password);

            try (ResultSet userResultSet = userStatement.executeQuery()) {
                System.out.println("Error is here look");
                System.out.println(userResultSet);
                if (userResultSet.next()) {
                   
                   return userResultSet.getInt(1);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return -1;
    }
    
    public static Patient getPatientfromUser(int userId) {
        String sql = "SELECT * FROM patient WHERE user_id=?";   
        Patient patient = null;
        try (Connection connection = DatabaseConnection.getConnection();
             PreparedStatement stmt = connection.prepareStatement(sql)) {
              stmt.setInt(1, userId);
            try (ResultSet userResultSet = stmt.executeQuery()) {
                System.out.println("Error is here look");
                System.out.println(userResultSet);
                if (userResultSet.next()) {
                    patient = new Patient();
                   patient.setPatient_id(userResultSet.getInt(1));
                   patient.setName(userResultSet.getString(2));
                }
            }
            
        } catch (SQLException e) {
            e.printStackTrace();
        }    
        return patient;
    }
    
}
