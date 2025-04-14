package beastbite;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Types;
import java.util.Scanner;

public class viewMenu {

    private static Scanner scanner = new Scanner(System.in);

    public static void viewMenuItem() {
        try{
            Connection conn = (Connection) connect.conn();
            CallableStatement stmt = conn.prepareCall("{CALL get_menu()}");
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                int itemId = rs.getInt("item_id");
                String itemName = rs.getString("item_name");
                String itemDescription = rs.getString("item_description");
                double itemPrice = rs.getDouble("item_price");
                int itemStatus = rs.getInt("item_status");

                System.out.println("Item ID: " + itemId);
                System.out.println("Item Name: " + itemName);
                System.out.println("Description: " + itemDescription);
                System.out.println("Price: " + itemPrice);
                System.out.println("Status: " + itemStatus);
                System.out.println("---------------------------------");
            }

            rs.close();
            stmt.close();
            conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}