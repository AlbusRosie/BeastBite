package beastbite;

import java.sql.*;
import java.util.Scanner;

public class Search {

    public static void searchByName() {
        Scanner scanner = new Scanner(System.in);
        CallableStatement stmt = null;
        Connection conn = null;

        try {
            conn = connect.conn();
            System.out.print("Enter item name to search: ");
            String itemName = scanner.nextLine();
            String sql = "{CALL get_menu_items_by_name(?)}";
            stmt = conn.prepareCall(sql);

            stmt.setString(1, itemName);
            ResultSet rs = stmt.executeQuery();

            boolean found = false;
            while (rs.next()) {
                int itemId = rs.getInt("item_id");
                String itemNameResult = rs.getString("item_name");
                String itemDescription = rs.getString("item_description");
                double itemPrice = rs.getDouble("item_price");
                boolean itemStatus = rs.getBoolean("item_status");

                System.out.println("Item ID: " + itemId);
                System.out.println("Item Name: " + itemNameResult);
                System.out.println("Description: " + itemDescription);
                System.out.println("Price: " + itemPrice);
                System.out.println("Status: " + (itemStatus ? "Available" : "Unavailable"));
                System.out.println("|-------------------------------------------------------|");
                found = true;
            }
            if (!found) {
                System.out.println("No items found matching the name: " + itemName);
            }

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
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}
