void main() {
  Library library = Library();

  print("\nInitial Library State:");
  library.displayInfo();

  // Adding a new book
  print("\nAdding a new book:");
  library.addBook("New Book", 1800);
  library.displayInfo();

  // Trying to add a book with an existing ID
  print("\nAdding a book with an existing ID (should fail):");
  library.addBook("Duplicate Book", 1629);

  // Borrowing a book that exists and is available
  print("\nBorrowing an available book:");
  library.borrowBook(1630, 123);
  library.displayInfo();

  // Trying to borrow a book that is already borrowed
  print("\nTrying to borrow an already borrowed book (should fail):");
  library.borrowBook(1630, 124);

  // Trying to borrow a book that does not exist
  print("\nTrying to borrow a non-existent book (should fail):");
  library.borrowBook(2000, 123);

  // Returning a borrowed book
  print("\nReturning a borrowed book:");
  library.returnBook(1630, 123);
  library.displayInfo();

  // Trying to return a book that is not borrowed
  print("\nTrying to return a book that wasn't borrowed (should fail):");
  library.returnBook(1630, 123);

  // Trying to return a book that does not exist
  print("\nTrying to return a non-existent book (should fail):");
  library.returnBook(2000, 123);
}

class Library {
  List<Book> books = [
    //create list of books
    //code for arabic 16**
    //code for english 17**
    Book("غرفه 207", 1629, true),
    Book("أرض زيكولا 1", 1630),
    Book("أرض زيكولا 2", 1631, true),
    Book("أرض زيكولا 3", 1632),
    Book("Call Of The Wild", 1795),
    Book("Animal farm", 1796, true),
    Book("Oliver Twist", 1797, true),
    Book("Time Twist", 1798),
  ];
  List<Users> users = [
    Users(name: "Loay", id: 123),
    Users(name: "Nour", id: 124),
    Users(id: 125, name: "Ahmed"),
    Users(name: "Youssef", id: 126),
    Users(id: 127, name: "Yehia"),
  ];
  void addBook(String title, int id) {
    // Check if a book with the same ID already exists
    bool exists = books.any((book) => book.id == id);

    if (exists) {
      print("A book with ID $id already exists in the library.");
    } else {
      books.add(Book(title, id));
      print("Book '$title' added to library with ID $id");
    }
  }

  void returnBook(int bookId, int userId) {
    Book? book = books.firstWhere((b) => b.id == bookId,
        orElse: () => Book("Not Found", -1));

    if (book.id == -1) {
      print("Book with ID $bookId not found.");
      return;
    }

    if (!book.borrowed) {
      print("Book '${book.title}' was not borrowed.");
    } else {
      book.borrowed = false;
      print("User with ID $userId returned '${book.title}'.");
    }
  }

  void borrowBook(int bookId, int userId) {
    Book? book = books.firstWhere((b) => b.id == bookId,
        orElse: () => Book("Not Found", -1));

    if (book.id == -1) {
      print("Book with ID $bookId not found.");
      return;
    }

    if (book.borrowed) {
      print("Book '${book.title}' is already borrowed.");
    } else {
      book.borrowed = true;
      print("User with ID $userId borrowed '${book.title}'.");
    }
  }

  void displayInfo() {
    print("\n Library Books:");
    for (var book in books) {
      print(book);
    }

    print("\n Library Users:");
    for (var user in users) {
      print(user);
    }
  }
}

class Book {
  String title;
  int id;
  bool borrowed;
  Book(this.title, this.id, [this.borrowed = false]);
  @override
  String toString() {
    return "$title (ID: $id) - ${borrowed ? 'Borrowed' : 'Available'}";
  }

  void displayInfo(Library library) {
    print("Books in the Library:");
    for (var book in library.books) {
      print(
          "${book.title} (ID: ${book.id}) - ${book.borrowed ? 'Borrowed' : 'Available'}");
    }
  }
}

class Users {
  String name;
  int id;
  Users({
    required this.id,
    required this.name,
  });
  @override
  String toString() {
    return "$name (ID: $id)";
  }

  void displayInfo(Library library) {
    print("Users in the Library:");
    for (var user in library.users) {
      print("${user.name} (ID: ${user.id})");
    }
  }
}
