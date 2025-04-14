package beastbite;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.SQLException;

public class VerifyOrder {
    public static String verifyOrder(int userId, String paymentMethod) {
        Connection connection = null;
        CallableStatement callableStatement = null;
        String message = "";

        try {
            connection = connect.conn();
            String sql = "{CALL verify(?, ?, ?)}";

            callableStatement = connection.prepareCall(sql);
            callableStatement.setInt(1, userId);
            callableStatement.setString(2, paymentMethod);
            callableStatement.registerOutParameter(3, java.sql.Types.VARCHAR);

            callableStatement.execute();

            message = callableStatement.getString(3); // Lấy kết quả từ stored procedure
        } catch (SQLException e) {
            e.printStackTrace();
            message = "Error while verifying order: " + e.getMessage();
        } finally {
            connect.close(connection);
        }
        return message;
    }
}
