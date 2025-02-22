package DAL;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBcontext {
    public static Connection getConnection() {
        Connection conn = null;
        try {
            String url = "jdbc:sqlserver://localhost:1433;databaseName=Organic_Shop2"; 
            String user = "sa"; 
            String password = "sa";
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            conn = DriverManager.getConnection(url, user, password);
            System.out.println("Kết nối thành công!"); 
        } catch (Exception e) {
            e.printStackTrace();
        }
        return conn;
    }
}
