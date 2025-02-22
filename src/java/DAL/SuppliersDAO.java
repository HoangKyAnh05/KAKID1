package DAL;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;
import model.Suppliers;

public class SuppliersDAO extends DBcontext {

    private Suppliers toSuppliers(ResultSet rs) throws SQLException {
        Suppliers supplier = new Suppliers();
        supplier.setSupplierId(rs.getInt("supplier_id"));
        supplier.setName(rs.getString("name"));
        supplier.setEmail(rs.getString("email"));
        supplier.setPhone(rs.getString("phone"));
        supplier.setSupplyManager(rs.getString("supply_manager"));
        supplier.setAddress(rs.getString("address"));
        supplier.setCreatedAt(rs.getTimestamp("created_at"));
        return supplier;
    }

    public Suppliers getSupplierById(int supplierId) {
        String sql = "SELECT * FROM Suppliers WHERE supplier_id = ?";

        try (Connection conn = DBcontext.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, supplierId);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    return toSuppliers(rs);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public Suppliers getSupplierByName(String name) {
        String sql = "SELECT * FROM Suppliers WHERE [name] = ?";

        try (Connection conn = DBcontext.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, name);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    return toSuppliers(rs);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public List<Suppliers> getAllSupplier() {
        List<Suppliers> supplier = new ArrayList<>();
        try {
            java.sql.Connection conn = DBcontext.getConnection();
            String sql = "SELECT * FROM Suppliers";
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                supplier.add(toSuppliers(rs));
            }
            rs.close();
            ps.close();
            conn.close();

        } catch (Exception e) {
            e.printStackTrace();
        }
        return supplier;
    }

    public List<Suppliers> getSuppliersWithSearch(String name, String email, String phone, String supplyManager, String address) {

        List<Suppliers> suppliers = new LinkedList<>();
        String sql = "SELECT * FROM Suppliers WHERE name like ? and email like ? and phone like ? and supply_manager like ? and address like ?";

        try (Connection conn = DBcontext.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, "%" + name + "%");
            ps.setString(2, "%" + email + "%");
            ps.setString(3, "%" + phone + "%");
            ps.setString(4, "%" + supplyManager + "%");
            ps.setString(5, "%" + address + "%");
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    suppliers.add(toSuppliers(rs));
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return suppliers;
    }

    public int getTotalSuppliers() {

        String sql = "SELECT COUNT(*) FROM Suppliers";

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

    public boolean addSupplier(Suppliers supplier) {
        String sql = "insert into suppliers ([name], [email], [phone], [supply_manager], [address], [created_at]  )  values (?, ?, ?, ?, ?, ?)";

        try (Connection conn = DBcontext.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {
            int indexQuery = 1;
            ps.setString(indexQuery++, supplier.getName());
            ps.setString(indexQuery++, supplier.getEmail());
            ps.setString(indexQuery++, supplier.getPhone());
            ps.setString(indexQuery++, supplier.getSupplyManager());
            ps.setString(indexQuery++, supplier.getAddress());
            ps.setTimestamp(indexQuery++, new Timestamp(supplier.getCreatedAt().getTime()));
            ps.executeUpdate();
            return true;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    public boolean updateSupplier(Suppliers supplier) {
        String sql = "update suppliers set [name] = ?, [email] = ?, [phone] = ?, [supply_manager] = ? ,[address] = ? where supplier_id = ?";

        try (Connection conn = DBcontext.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {
            int indexQuery = 1;
            ps.setString(indexQuery++, supplier.getName());
            ps.setString(indexQuery++, supplier.getEmail());
            ps.setString(indexQuery++, supplier.getPhone());
            ps.setString(indexQuery++, supplier.getSupplyManager());
            ps.setString(indexQuery++, supplier.getAddress());
            ps.setInt(indexQuery++, supplier.getSupplierId());
            ps.executeUpdate();
            return true;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    public boolean deleteSupplier(int id) {
        String sql = "delete suppliers where supplier_id = ?";

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

    public boolean checkSupplierHasProduct(int supplierId) {
        String sql = "select * from [Product] where supplier_id = ?";

        try (Connection conn = DBcontext.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, supplierId);
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
