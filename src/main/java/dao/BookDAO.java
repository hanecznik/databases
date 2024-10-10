package dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class BookDAO {

    private static final String URL = "jdbc:mysql://localhost:3306/mydb";
    private static final String USERNAME = "root";
    private static final String PASSWORD = "root1234";

    public void save(Book book) {
        String query = "INSERT INTO Book (title, ISBN, category_id, published_year, copies, available_copies) VALUES (?, ?, ?, ?, ?, ?)";

        try (Connection conn = DriverManager.getConnection(URL, USERNAME, PASSWORD);
             PreparedStatement ps = conn.prepareStatement(query)) {

            ps.setString(1, book.getTitle());
            ps.setString(2, book.getISBN());
            ps.setInt(3, book.getCategoryId());
            ps.setString(4, book.getPublishedYear());
            ps.setInt(5, book.getCopies());
            ps.setInt(6, book.getAvailableCopies());

            ps.executeUpdate();
            System.out.println("Książka została dodana do bazy danych.");

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public Book get(int id) {
        String query = "SELECT * FROM Book WHERE book_id = ?";
        try (Connection conn = DriverManager.getConnection(URL, USERNAME, PASSWORD);
             PreparedStatement ps = conn.prepareStatement(query)) {

            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                return new Book(
                        rs.getInt("book_id"),           // ID książki
                        rs.getString("title"),          // Tytuł
                        rs.getString("ISBN"),           // ISBN
                        rs.getInt("category_id"),       // ID kategorii
                        rs.getString("published_year"), // Rok wydania
                        rs.getInt("copies"),            // Liczba kopii
                        rs.getInt("available_copies")   // Liczba dostępnych kopii
                );
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public List<Book> getAll() {
        List<Book> books = new ArrayList<>();
        String query = "SELECT * FROM Book";

        try (Connection conn = DriverManager.getConnection(URL, USERNAME, PASSWORD);
             PreparedStatement ps = conn.prepareStatement(query);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                books.add(new Book(
                        rs.getInt("book_id"),
                        rs.getString("title"),
                        rs.getString("ISBN"),
                        rs.getInt("category_id"),
                        rs.getString("published_year"),
                        rs.getInt("copies"),
                        rs.getInt("available_copies")
                ));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return books;  // Zwracanie listy książek
    }
}