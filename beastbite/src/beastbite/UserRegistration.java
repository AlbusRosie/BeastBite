package beastbite;

import beastbite.connect;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.Scanner;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class UserRegistration {
    
    public static boolean isValidEmail(String email) {
        String emailRegex = "^[a-zA-Z0-9_+&*-]+(?:\\.[a-zA-Z0-9_+&*-]+)*@(?:[a-zA-Z0-9-]+\\.)+[a-zA-Z]{2,7}$";
        Pattern pattern = Pattern.compile(emailRegex);
        Matcher matcher = pattern.matcher(email);
        return matcher.matches();
    }
    public static boolean isValidDate(String date) {
        try {
            LocalDate.parse(date);
            return true;
        } catch (Exception e) {
            return false;
        }
    }
    public static void registerUser(String username, String useremail, String userpwd, 
                                     String userphone, String userbirthday, String useraddress) {
        String sql = "{CALL register(?, ?, ?, ?, ?, ?, ?)}";
        try (Connection conn = connect.conn(); 
             CallableStatement stmt = conn.prepareCall(sql)) {
            
            stmt.setString(1, username);
            stmt.setString(2, useremail);
            stmt.setString(3, userpwd);
            stmt.setString(4, userphone);
            stmt.setString(5, userbirthday);
            stmt.setString(6, useraddress);
            stmt.registerOutParameter(7, java.sql.Types.VARCHAR);  
            stmt.execute();

            String message = stmt.getString(7);
            System.out.println(message);

        } catch (SQLException e) {
            System.out.println("Error during user registration: " + e.getMessage());
            e.printStackTrace();
        }
    }
    public static void handleUserRegistration() {
        Scanner scanner = new Scanner(System.in);
        System.out.print("Enter username: ");
        String username = scanner.nextLine();
        String useremail = "";
        while (true) {
            System.out.print("Enter email: ");
            useremail = scanner.nextLine();
            if (isValidEmail(useremail)) {
                break;
            } else {
                System.out.println("Invalid email format. Please enter again.");
            }
        }
        System.out.print("Enter password: ");
        String userpwd = scanner.nextLine();

        System.out.print("Enter phone: ");
        String userphone = scanner.nextLine();

        String userbirthday = "";
        while (true) {
            System.out.print("Enter birthday (YYYY-MM-DD): ");
            userbirthday = scanner.nextLine();
            if (isValidDate(userbirthday)) {
                break;
            } else {
                System.out.println("Invalid date format. Please enter again.");
            }
        }
        System.out.print("Enter address: ");
        String useraddress = scanner.nextLine();

        registerUser(username, useremail, userpwd, userphone, userbirthday, useraddress);
    }
}
