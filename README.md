# 🐾 BeastBite - Food Ordering System

## 📋 Overview

**BeastBite** is a Java-based food ordering system designed to provide a seamless experience for users to login, register, browse menus, add items to their cart, place orders, and manage their accounts. Whether you're a food enthusiast or a restaurant owner, BeastBite simplifies the ordering process with an intuitive and efficient backend.

---

## ✨ Features

- **User Authentication**\
  Secure login and registration system for users (`UserLogin.java`, `UserRegistration.java`).

- **Menu Browsing**\
  View available food items with ease (`viewMenu.java`).

- **Cart Management**\
  Add items to your cart (`AddtoCart.java`), remove items (`RemoveFromCart.java`), and view your cart (`getCart.java`).

- **Order Verification**\
  Ensure your orders are correct before confirmation (`VerifyOrder.java`).

- **Search Functionality**\
  Quickly find food items with the search feature (`Search.java`).

- **Order History**\
  Keep track of your past orders (`History.java`).

- **Database Integration**\
  Persistent storage for user data, orders, and menu items (`connect.java`).

---

## 🛠️ Technologies Used

- **Java**: Core programming language for backend logic.
- **JDBC**: For database connectivity (`connect.java`).
- **Maven**: Dependency management (assumed, can be updated if different).

---

## 🚀 Getting Started

### Prerequisites

- Java Development Kit (JDK) 8 or higher
- Maven (for dependency management)
- A relational database (e.g., MySQL, PostgreSQL) for storing data
- An IDE like IntelliJ IDEA or Eclipse

### Installation

1. **Clone the Repository**

   ```bash
   git clone https://github.com/AlbusRosie/BeastBite.git
   cd BeastBite
   ```

2. **Set Up the Database**

   - Create a database in your preferred DBMS.
   - Update the database connection details in `connect.java` (e.g., URL, username, password).

3. **Install Dependencies**\
   If using Maven, run:

   ```bash
   mvn clean install
   ```

4. **Run the Application**

   - Open the project in your IDE.
   - Run `Main.java` to start the application.

---

## 📖 Usage

1. **Register or Log In**\
   Use the `UserRegistration.java` and `UserLogin.java` functionalities to create an account or log in.

2. **Browse the Menu**\
   Access `viewMenu.java` to see available food items.

3. **Add to Cart**\
   Select items and add them to your cart using `AddtoCart.java`.

4. **Manage Your Cart**\
   View your cart (`getCart.java`) and remove items if needed (`RemoveFromCart.java`).

5. **Place an Order**\
   Verify your order (`VerifyOrder.java`) and confirm to complete the purchase.

6. **Check Order History**\
   Review your past orders with `History.java`.

---

## 🤝 Contributing

We welcome contributions to make BeastBite even better! To contribute:

1. Fork the repository.
2. Create a new branch (`git checkout -b feature/your-feature`).
3. Make your changes and commit (`git commit -m "Add your feature"`).
4. Push to your branch (`git push origin feature/your-feature`).
5. Open a Pull Request.

Please ensure your code follows the project's coding standards and includes appropriate comments.

---


## 📬 Contact

If you have any questions or feedback, feel free to reach out via [GitHub](https://github.com/AlbusRosie).

> ✨ *This project is for educational purposes only.*
