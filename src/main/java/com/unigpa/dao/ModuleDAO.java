package com.unigpa.dao;

import com.unigpa.model.Module;
import com.unigpa.util.DBConnection;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ModuleDAO {

    public List<Module> getModulesByDegreeId(long degreeId) {
        List<Module> modules = new ArrayList<>();
        String sql = "SELECT * FROM modules WHERE degree_id = ? ORDER BY academic_year DESC, semester DESC, module_code ASC";

        try (Connection conn = DBConnection.getConnection();
                PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setLong(1, degreeId);
            try (ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    Module module = new Module(
                            rs.getInt("id"),
                            rs.getString("module_code"),
                            rs.getString("module_name"),
                            rs.getInt("credits"),
                            rs.getString("grade"),
                            rs.getInt("semester"),
                            rs.getInt("academic_year"));
                    module.setDegreeId(degreeId);
                    modules.add(module);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return modules;
    }

    public void addModule(Module module) {
        String sql = "INSERT INTO modules (module_code, module_name, credits, grade, semester, academic_year, degree_id) VALUES (?, ?, ?, ?, ?, ?, ?)";

        try (Connection conn = DBConnection.getConnection();
                PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, module.getModuleCode());
            stmt.setString(2, module.getModuleName());
            stmt.setInt(3, module.getCredits());
            stmt.setString(4, module.getGrade());
            stmt.setInt(5, module.getSemester());
            stmt.setInt(6, module.getAcademicYear());
            stmt.setLong(7, module.getDegreeId());

            stmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void updateModule(Module module) {
        String sql = "UPDATE modules SET module_code=?, module_name=?, credits=?, grade=?, semester=?, academic_year=? WHERE id=? AND degree_id=?";

        try (Connection conn = DBConnection.getConnection();
                PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, module.getModuleCode());
            stmt.setString(2, module.getModuleName());
            stmt.setInt(3, module.getCredits());
            stmt.setString(4, module.getGrade());
            stmt.setInt(5, module.getSemester());
            stmt.setInt(6, module.getAcademicYear());
            stmt.setInt(7, module.getId());
            stmt.setLong(8, module.getDegreeId());

            stmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void deleteModule(int id, long degreeId) {
        String sql = "DELETE FROM modules WHERE id=? AND degree_id=?";

        try (Connection conn = DBConnection.getConnection();
                PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, id);
            stmt.setLong(2, degreeId);
            stmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public Module getModuleById(int id) {
        String sql = "SELECT * FROM modules WHERE id=?";
        try (Connection conn = DBConnection.getConnection();
                PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, id);
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    Module module = new Module(
                            rs.getInt("id"),
                            rs.getString("module_code"),
                            rs.getString("module_name"),
                            rs.getInt("credits"),
                            rs.getString("grade"),
                            rs.getInt("semester"),
                            rs.getInt("academic_year"));

                    // Ideally we should also get degree_id here
                    module.setDegreeId(rs.getLong("degree_id"));
                    return module;
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }
}
