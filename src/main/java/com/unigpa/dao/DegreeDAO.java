package com.unigpa.dao;

import com.unigpa.model.Degree;
import com.unigpa.util.DBConnection;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;

public class DegreeDAO {

    public void addDegree(Degree degree) throws SQLException {
        // Generate random unique ID
        long degreeId;
        do {
            degreeId = Math.abs(new Random().nextLong());
        } while (existsById(degreeId));

        degree.setId(degreeId);

        String sql = "INSERT INTO degrees (id, user_id, name) VALUES (?, ?, ?)";
        try (Connection conn = DBConnection.getConnection();
                PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setLong(1, degree.getId());
            stmt.setLong(2, degree.getUserId());
            stmt.setString(3, degree.getName());
            stmt.executeUpdate();
        }
    }

    public List<Degree> getDegreesByUserId(long userId) {
        List<Degree> degrees = new ArrayList<>();
        String sql = "SELECT * FROM degrees WHERE user_id = ? ORDER BY created_at DESC";

        try (Connection conn = DBConnection.getConnection();
                PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setLong(1, userId);
            try (ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    degrees.add(new Degree(
                            rs.getLong("id"),
                            rs.getLong("user_id"),
                            rs.getString("name"),
                            rs.getTimestamp("created_at")));
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return degrees;
    }

    public Degree getDegreeById(long id) {
        String sql = "SELECT * FROM degrees WHERE id = ?";
        try (Connection conn = DBConnection.getConnection();
                PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setLong(1, id);
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    return new Degree(
                            rs.getLong("id"),
                            rs.getLong("user_id"),
                            rs.getString("name"),
                            rs.getTimestamp("created_at"));
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public void deleteDegree(long id) {
        String sql = "DELETE FROM degrees WHERE id = ?";
        try (Connection conn = DBConnection.getConnection();
                PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setLong(1, id);
            stmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    private boolean existsById(long id) {
        String sql = "SELECT count(*) FROM degrees WHERE id = ?";
        try (Connection conn = DBConnection.getConnection();
                PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setLong(1, id);
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    return rs.getInt(1) > 0;
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }
}
