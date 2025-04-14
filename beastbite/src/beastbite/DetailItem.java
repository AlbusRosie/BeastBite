package beastbite;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Types;
import java.util.Scanner;

public class DetailItem {

    public static void getItemByID() {
        Scanner scanner = new Scanner(System.in);
        CallableStatement stmt = null;
        Connection conn = null;
        try {
            conn = connect.conn();
            int itemId = -1;
            boolean validInput = false;
            while (!validInput) {
                System.out.print("Enter item ID: ");
                String input = scanner.nextLine();
                try {
                    itemId = Integer.parseInt(input);
                    validInput = true;
                } catch (NumberFormatException e) {
                    System.out.println("Invalid input. Please enter a valid item ID.");
                }
            }

            String sql = "{CALL get_item_byID(?, ?, ?, ?, ?)}";
            stmt = conn.prepareCall(sql);
            stmt.setInt(1, itemId);

            stmt.registerOutParameter(2, Types.VARCHAR);
            stmt.registerOutParameter(3, Types.VARCHAR);
            stmt.registerOutParameter(4, Types.DECIMAL);
            stmt.registerOutParameter(5, Types.TINYINT);
            stmt.execute();
            String itemName = stmt.getString(2);
            String itemDescription = stmt.getString(3);
            double itemPrice = stmt.getDouble(4);
            boolean itemStatus = stmt.getBoolean(5);

            if (itemName == null) {
                itemName = "Item not found";
                itemDescription = "N/A";
                itemPrice = 0.00;
                itemStatus = false;
            }
            System.out.println("Item Name: " + itemName);
            System.out.println("Description: " + itemDescription);
            System.out.println("Price: " + itemPrice);
            System.out.println("Status: " + (itemStatus ? "Available" : "Unavailable"));

        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (stmt != null) {
                    stmt.close();
                }
                if (conn != null) {
                    conn.close();
                }
                // No need to close scanner here
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}
