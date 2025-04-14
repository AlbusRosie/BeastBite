package beastbite;

import java.sql.SQLException;
import java.util.Scanner;
public class Main {

    private static void firstpage() {
        System.out.println("|----------------- Hi, I am Beast Bite -----------------|");
        System.out.println("|                      1. REGISTER                      |");
        System.out.println("|                      2. LOGIN                         |");
        System.out.println("|                      0. EXIT                          |");
        System.out.println("|-------------------------------------------------------|");
    }

    private static void CustomerPage(int userid, boolean[] isLoggedIn) {
        boolean customerPageActive = true;
        Scanner scanner = new Scanner(System.in);

        while (customerPageActive) {
            // Hiển thị bảng menu
            System.out.println("|-------------- Hi, Welcome to Beast Bite --------------|");
            System.out.println("|                 Welcome, Customer!                    |");
            System.out.println("|                 1. VIEW MENU                          |");
            System.out.println("|                 2. ADD TO CART                        |");
            System.out.println("|                 3. VIEW CART                          |");
            System.out.println("|                 4. REMOVE FROM CART                   |");
            System.out.println("|                 5. GET DETAIL ITEM                    |");
            System.out.println("|                 6. SEARCH ITEM BY NAME                |");
            System.out.println("|                 7. VIEW HISTORY ACTIVITY              |");
            System.out.println("|                 8. PLACE ORDER                        |");
            System.out.println("|                 0. LOGOUT                             |");
            System.out.println("|-------------------------------------------------------|");

            // Nhận lựa chọn từ người dùng
            System.out.print("\nYour choice: ");
            if (scanner.hasNextLine()) {
                String choiceStr = scanner.nextLine();
                try {
                    int choice = Integer.parseInt(choiceStr);
                    switch (choice) {
                        case 1:
                            viewMenu.viewMenuItem();
                            break;
                        case 2:
                            AddtoCart.Add(userid);
                            break;
                        case 3:
                            getCart.DetailCart(userid);
                            break;
                        case 4:
                            RemovefromCart.Remove(userid);
                            break;
                        case 5:
                            DetailItem.getItemByID();
                            break;
                        case 6:
                            Search.searchByName();
                            break;
                        case 7:
                            History.viewTransactionHistory(userid);
                            break;
                        case 8:
                            isLoggedIn[0] = false;
                            System.out.print("Enter payment method (Cash/Credit Card): ");
                            String paymentMethod = scanner.nextLine();
                            String result = VerifyOrder.verifyOrder(userid, paymentMethod);
                            System.out.println(result);
                            break;
                        case 0:
                            System.out.println("Logging out...");
                            customerPageActive = false;
                            isLoggedIn[0] = false;
                            break;
                        default:
                            System.out.println("Invalid choice. Please select a valid option.");
                    }
                } catch (NumberFormatException e) {
                    System.out.println("Invalid input. Please enter a valid number.");
                }
            } else {
                System.out.println("No input available. Exiting...");
                customerPageActive = false;
            }
        }
    }

    public static void main(String[] args) throws SQLException {
        Scanner scanner = new Scanner(System.in);
        boolean cont = true;
        boolean[] isLoggedIn = {false};
        String choiceStr = "";

        while (cont) {
            if (!isLoggedIn[0]) {
                firstpage();
                System.out.println("If you don't have an account, please choose 1 to create a new account!");
                System.out.println("\nYour choice:");
                while (true) {
                    choiceStr = scanner.nextLine();
                    try {
                        int choice = Integer.parseInt(choiceStr);
                        if (choice >= 0 && choice <= 2) {
                            switch (choice) {
                                case 1:
                                    UserRegistration.handleUserRegistration();
                                    break;
                                case 2:
                                    boolean loginSuccess = false;
                                    while (!loginSuccess) {
                                        System.out.print("Email: ");
                                        String useremail = scanner.nextLine();
                                        System.out.print("Password: ");
                                        String userpwd = scanner.nextLine();
                                        LoginResult result = UserLogin.loginUser(useremail, userpwd);
                                        if (result != null && result.getMessage().equals("Login successful")) {
                                            int role = result.getRole();
                                            int userid = result.getUserid();
                                            isLoggedIn[0] = true;
                                            loginSuccess = true;
                                            if (role == 1) {
                                                CustomerPage(userid, isLoggedIn);
                                            } else if (role == 2) {
                                                return;
                                            }
                                        } else {
                                            System.out.println(result != null ? result.getMessage() : "Unknown error");
                                            System.out.println("Do you want to try again? (y/n)");
                                            String retryChoice = scanner.nextLine();
                                            if (retryChoice.equalsIgnoreCase("n")) {
                                                break;  
                                            }
                                        }
                                    }
                                    break;
                                case 0:
                                    cont = false;
                                    isLoggedIn[0] = false;
                                    break;
                            }
                            break;
                        } else {
                            System.out.println("Invalid choice. Please select 0, 1, or 2.");
                        }
                    } catch (NumberFormatException e) {
                        System.out.println("Invalid input. Please enter a valid number (0, 1, or 2).");
                    }
                }
            }

            // Nếu người dùng thoát khỏi chương trình
            if (!cont) {
                System.out.println("Thanks. Have a great day!");
            }
        }
    }
}