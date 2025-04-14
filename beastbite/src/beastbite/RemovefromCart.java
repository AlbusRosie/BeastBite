package beastbite;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Types;
import java.util.Scanner;

public class RemovefromCart {
    public static String Remove(int userid) {
        String message = "";
        Scanner scanner = new Scanner(System.in);

        System.out.print("Enter the item ID to remove from cart: ");
        int itemid = scanner.nextInt();
        System.out.print("Enter the quantity: ");
        int quantity = scanner.nextInt();
        CallableStatement callableStatement = null;

        try {
            Connection conn = connect.conn();
            String sql = "{CALL remove_item_fromCart(?, ?, ?, ?)}";
            callableStatement = conn.prepareCall(sql);

            callableStatement.setInt(1, userid);
            callableStatement.setInt(2, itemid);
            callableStatement.setInt(3, quantity);
            callableStatement.registerOutParameter(4, Types.VARCHAR);
            callableStatement.execute();

            message = callableStatement.getString(4);
            System.out.println(message);
        } catch (SQLException e) {
            e.printStackTrace();
            message = "An error occurred while removing the item from the cart.";
        } finally {
            try {
                if (callableStatement != null) {
                    callableStatement.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

        return message;
    }
}
