package xmlparser;
import org.w3c.dom.*;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import java.io.File;

public class XMLParserDOM {
    public static void parseXML(String xmlFile) {
        try {
            DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
            DocumentBuilder builder = factory.newDocumentBuilder();

            Document document = builder.parse(new File(xmlFile));
            document.getDocumentElement().normalize();

            Element root = document.getDocumentElement();
            System.out.println("Root element: " + root.getNodeName());

            NodeList bookList = document.getElementsByTagName("book");

            for (int i = 0; i < bookList.getLength(); i++) {
                Node bookNode = bookList.item(i);

                if (bookNode.getNodeType() == Node.ELEMENT_NODE) {
                    Element bookElement = (Element) bookNode;

                    String id = bookElement.getElementsByTagName("id").item(0).getTextContent();
                    String title = bookElement.getElementsByTagName("title").item(0).getTextContent();
                    String isbn = bookElement.getElementsByTagName("isbn").item(0).getTextContent();
                    String categoryId = bookElement.getElementsByTagName("category_id").item(0).getTextContent();
                    String publishedYear = bookElement.getElementsByTagName("published_year").item(0).getTextContent();
                    String copies = bookElement.getElementsByTagName("copies").item(0).getTextContent();
                    String availableCopies = bookElement.getElementsByTagName("available_copies").item(0).getTextContent();

                    System.out.println("Book ID: " + id);
                    System.out.println("Title: " + title);
                    System.out.println("ISBN: " + isbn);
                    System.out.println("Category ID: " + categoryId);
                    System.out.println("Published year: " + publishedYear);
                    System.out.println("Copies: " + copies);
                    System.out.println("Available Copies: " + availableCopies);
                    System.out.println("---------------------------");
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static void main(String[] args) {
        String xmlFile = "src/books.xml";

        parseXML(xmlFile);
    }
}
