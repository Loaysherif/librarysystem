# Library Management System in Dart

This Dart program simulates a simple Library Management System that allows users to:
- Add books to the library.
- Borrow and return books.
- Display library books and users.

## How to Run
1. Ensure Dart is installed on your system.
2. Navigate to the project directory.
3. Run the following command:
    ```powershell
    dart run library.dart
    ```

## Code Explanation
The program consists of the following components:

### 1. `Library` Class
- Manages a list of books and users.
- Allows adding new books.
- Provides functions to borrow and return books.
- Displays current books and users.

### 2. `Book` Class
- Represents a book with a title, unique ID, and borrow status.

### 3. `Users` Class
- Represents a user with a name and unique ID.

## Features
- **Add Book**: Adds a new book to the library.
- **Borrow Book**: Allows a user to borrow a book if available.
- **Return Book**: Allows a user to return a borrowed book.
- **Display Library Information**: Shows books and users in the library.

## Example Usage
![image](https://github.com/user-attachments/assets/da387825-82d2-4e68-819e-4ef46d045ee2)
![image](https://github.com/user-attachments/assets/d46fa37e-4de0-4a25-9da3-679e51f7fe4f)
![image](https://github.com/user-attachments/assets/ba326578-4e99-44e6-aa46-405b097d0089)


Borrowing an available book:
User with ID 123 borrowed 'أرض زيكولا 1'.

Returning a borrowed book:
User with ID 123 returned 'أرض زيكولا 1'.
