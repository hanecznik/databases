import dao.BookDAO;
import dao.Book;

public class Main {
    public static void main(String[] args) {
        BookDAO bookDAO = new BookDAO();

        Book book = new Book(1, "Moby Dick", "9780142437247", 1, "1851", 10, 5);

        bookDAO.save(book);

        Book retrievedBook = bookDAO.get(1);
        if (retrievedBook != null) {
            System.out.println("Książka znaleziona: " + retrievedBook.getTitle());
        } else {
            System.out.println("Nie znaleziono książki o ID 1.");
        }
    }
}