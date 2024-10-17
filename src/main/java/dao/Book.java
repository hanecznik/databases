package dao;

import jakarta.xml.bind.annotation.XmlElement;
import jakarta.xml.bind.annotation.XmlRootElement;

@XmlRootElement(name = "book")

public class Book {

    private int id;
    private String title;
    private String ISBN;
    private int categoryId;
    private String publishedYear;
    private int copies;
    private int availableCopies;

    public Book() {}

    public Book(int id, String title, String ISBN, int categoryId, String publishedYear, int copies, int availableCopies) {
        this.id = id;
        this.title = title;
        this.ISBN = ISBN;
        this.categoryId = categoryId;
        this.publishedYear = publishedYear;
        this.copies = copies;
        this.availableCopies = availableCopies;
    }
    @XmlElement
    public int getId() {
        return id;
    }
    @XmlElement
    public String getTitle() {
        return title;
    }
    @XmlElement
    public String getISBN() {
        return ISBN;
    }
    @XmlElement(name = "category_id")
    public int getCategoryId() {
        return categoryId;
    }
    @XmlElement(name = "published_year")
    public String getPublishedYear() {
        return publishedYear;
    }
    @XmlElement
    public int getCopies() {
        return copies;
    }
    @XmlElement(name = "available_copies")
    public int getAvailableCopies() {
        return availableCopies;
    }

    public void setId(int id) {
        this.id = id;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public void setISBN(String ISBN) {
        this.ISBN = ISBN;
    }

    public void setCategoryId(int categoryId) {
        this.categoryId = categoryId;
    }

    public void setPublishedYear(String publishedYear) {
        this.publishedYear = publishedYear;
    }

    public void setCopies(int copies) {
        this.copies = copies;
    }

    public void setAvailableCopies(int availableCopies) {
        this.availableCopies = availableCopies;
    }
}