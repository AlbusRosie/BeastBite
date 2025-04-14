package beastbite;

import java.sql.*;
import java.util.HashSet;
import java.util.Set;
import java.util.Scanner;

public class History {

    public static void viewTransactionHistory(int userid) {
        Scanner scanner = new Scanner(System.in);
        CallableStatement stmt = null;
        Connection conn = null;

        try {
            conn = connect.conn();
            String sql = "{CALL get_transaction_history(?, ?)}";
            stmt = conn.prepareCall(sql);
            stmt.setInt(1, userid);
            stmt.registerOutParameter(2, Types.VARCHAR);
            stmt.execute();

            String message = stmt.getString(2);
            System.out.println(message);

            if (message.equals("Transaction history retrieved successfully.")) {
                ResultSet rs = stmt.getResultSet();
                boolean found = false;

                Set<Integer> printedOrderIds = new HashSet<>();

                while (rs.next()) {
                    int orderId = rs.getInt("order_id");

                    if (!printedOrderIds.contains(orderId)) {
                        System.out.println("\n============================================================");
                        System.out.println("Order ID: " + orderId);
                        System.out.println("Order Date: " + rs.getDate("order_date"));
                        System.out.println("Total Price: " + String.format("%.2f", rs.getDouble("total_price")) + " $");
                        System.out.println("Payment Method: " + rs.getString("paymentmethod"));
                        System.out.println("Order Status: " + rs.getString("order_status"));
                        System.out.println("------------------------------------------------------------");
                        // In tên cột cho bảng các món ăn
                        System.out.println(String.format("| %-10s | %-20s | %-8s | %-10s |", "Item ID", "Item Name", "Quantity", "Item Price"));
                        System.out.println("------------------------------------------------------------");
                        printedOrderIds.add(orderId);
                    }

                    int itemId = rs.getInt("item_id");
                    String itemName = rs.getString("item_name");
                    int quantity = rs.getInt("quantity");
                    double itemPrice = rs.getDouble("item_price");

                    System.out.println(String.format("| %-10s | %-20s | %-8s | %-10s |", itemId, itemName, quantity, String.format("%.2f", itemPrice) + " $"));
                    System.out.println("------------------------------------------------------------");

                    found = true;
                }

                if (!found) {
                    System.out.println("No items found in the transaction history.");
                }
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
