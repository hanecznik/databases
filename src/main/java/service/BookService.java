package service;
import dao.Book;
import java.util.List;

public interface BookService {

    Book getBook(int id);

    List<Book> getAllBooks();

    void addBook(Book book);
}
