package beastbite;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;

public class getCart {
    public static void DetailCart(int userid){
        try{
            Connection conn = connect.conn();
            String sql = "{CALL getcart(?)}";
            CallableStatement stmt = conn.prepareCall(sql);
            stmt.setInt(1, userid);
            ResultSet rs = stmt.executeQuery();

            double totalOrderPrice = 0;
            int currentOrderId = -1;

            System.out.println("|---------------------- MY CART ------------------------|");
            System.out.println("User ID: " + userid);

            while (rs.next()) {
                int orderId = rs.getInt("order_id");
                String itemName = rs.getString("item_name");
                int quantity = rs.getInt("quantity");
                double price = rs.getDouble("price");
                totalOrderPrice = rs.getDouble("total_order_price");
                String status = rs.getString("status");

                // Chỉ in thông tin Order ID một lần khi ID thay đổi
                if (orderId != currentOrderId) {
                    currentOrderId = orderId;
                    System.out.println("\nOrder ID: " + orderId);
                    System.out.println("Status: " + status);
                    System.out.println("--------------------------------------------------------");
                }

                System.out.println("Item Name: " + itemName);
                System.out.println("Quantity: " + quantity);
                System.out.printf("Price: %.2f\n", price);
                System.out.println("--------------------------------------------------------");
            }

            System.out.printf("Total: %.2f\n", totalOrderPrice);
            System.out.println("|-------------------------------------------------------|");
        }
        catch (SQLException e) {
            System.out.println("Error while retrieving cart details: " + e.getMessage());
            e.printStackTrace();
        }
    }
}
