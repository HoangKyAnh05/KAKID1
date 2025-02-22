/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAL;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;
import model.Units;

/**
 *
 * @author ngoch
 */
public class UnitsDAO extends DBcontext {

    public Units getUnitById(int unitId) {
        Units unit = null;
        String sql = "SELECT * FROM Units WHERE unit_id = ?";

        try (Connection conn = DBcontext.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, unitId);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    unit = new Units();
                    unit.setUnitId(rs.getInt("unit_id"));
                    unit.setName(rs.getString("name"));
                    unit.setDescription(rs.getString("description"));
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return unit;
    }

    public List<Units> getAllUnit() {
        List<Units> units = new ArrayList<>();
        try {
            java.sql.Connection conn = DBcontext.getConnection();
            String sql = "SELECT * FROM Units";
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {

                Units unit = new Units();
                unit.setUnitId(rs.getInt("unit_id"));
                unit.setName(rs.getString("name"));
                unit.setDescription(rs.getString("description"));
                units.add(unit);
            }
            rs.close();
            ps.close();
            conn.close();

        } catch (Exception e) {
            e.printStackTrace();
        }
        return units;
    }

    public List<Units> getUnitsByName(String name) {

        List<Units> units = new LinkedList<>();
        String sql = "SELECT * FROM Units WHERE name like ? ";
        try (Connection conn = DBcontext.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, "%" + name + "%");
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    Units unit = new Units();
                    unit.setUnitId(rs.getInt("unit_id"));
                    unit.setName(rs.getString("name"));
                    unit.setDescription(rs.getString("description"));
                    units.add(unit);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return units;
    }

    public int getTotalUnits() {

        String sql = "SELECT COUNT(*) FROM Units";

        try (Connection conn = DBcontext.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {

            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    return rs.getInt(1);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return 0;
    }

    public boolean addUnit(Units unit) {
        String sql = "insert into units ([name], [description])  values (?, ?)";

        try (Connection conn = DBcontext.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {
            int indexQuery = 1;
            ps.setString(indexQuery++, unit.getName());
            ps.setString(indexQuery++, unit.getDescription());
            ps.executeUpdate();
            return true;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    public boolean updateUnit(Units unit) {
        String sql = "update units set [name] = ?, [description] = ?  where unit_id = ?";

        try (Connection conn = DBcontext.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {
            int indexQuery = 1;
            ps.setString(indexQuery++, unit.getName());
            ps.setString(indexQuery++, unit.getDescription());
            ps.setInt(indexQuery++, unit.getUnitId());
            ps.executeUpdate();
            return true;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    public boolean deleteUnit(int id) {
        String sql = "delete units where unit_id = ?";

        try (Connection conn = DBcontext.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {
            int indexQuery = 1;
            ps.setInt(indexQuery++, id);
            ps.executeUpdate();
            return true;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    public boolean checkUnitHasProduct(int unitId) {
        String sql = "select * from  [Product] where unit_id = ?";
        try (Connection conn = DBcontext.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, unitId);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    return true;
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }
}
