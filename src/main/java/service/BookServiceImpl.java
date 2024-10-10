package service;
import dao.Book;
import dao.BookDAO;

import java.util.List;

public class BookServiceImpl implements BookService {

    private BookDAO bookDAO = new BookDAO();

    @Override
    public Book getBook(int id) {
        if (id <= 0) {
            System.out.println("Nieprawidłowe ID książki.");
            return null;
        }
        return bookDAO.get(id);
    }

    @Override
    public List<Book> getAllBooks() {
        return bookDAO.getAll();
    }

    @Override
    public void addBook(Book book) {
        if (book == null) {
            System.out.println("Nie można dodać null jako książki.");
            return;
        }
        bookDAO.save(book);
        System.out.println("Książka została dodana.");
    }
}