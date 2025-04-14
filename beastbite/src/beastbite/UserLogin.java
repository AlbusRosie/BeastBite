package beastbite;

import beastbite.LoginResult;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.SQLException;

public class UserLogin {
    public static LoginResult loginUser(String username, String password) {
        try {
            Connection conn = (Connection) connect.conn();
            String sql = "{CALL login(?, ?, ?, ?, ?)}";
            CallableStatement stmt = conn.prepareCall(sql);
            stmt.setString(1, username);
            stmt.setString(2, password);
            
            stmt.registerOutParameter(3, java.sql.Types.INTEGER);
            stmt.registerOutParameter(4, java.sql.Types.INTEGER);
            stmt.registerOutParameter(5, java.sql.Types.VARCHAR);
            stmt.execute();

            int userId = stmt.getInt(3);
            int userRole = stmt.getInt(4);
            String message = stmt.getString(5);
            System.out.println(message);

            return new LoginResult(userId, userRole, message);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }
}
