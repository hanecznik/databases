package xmlparser;

import dao.Library;
import dao.Book;

import jakarta.xml.bind.JAXBContext;
import jakarta.xml.bind.JAXBException;
import jakarta.xml.bind.Marshaller;
import jakarta.xml.bind.Unmarshaller;
import java.io.File;
public class JAXBParser {
    public static Library parseXML(String xmlFilePath) {
        try {
            JAXBContext context = JAXBContext.newInstance(Library.class);

            Unmarshaller unmarshaller = context.createUnmarshaller();

            return (Library) unmarshaller.unmarshal(new File(xmlFilePath));

        } catch (JAXBException e) {
            e.printStackTrace();
        }
        return null;
    }

    public static void writeXML(Library library, String outputPath) {
        try {
            JAXBContext context = JAXBContext.newInstance(Library.class);

            Marshaller marshaller = context.createMarshaller();
            marshaller.setProperty(Marshaller.JAXB_FORMATTED_OUTPUT, Boolean.TRUE);

            marshaller.marshal(library, new File(outputPath));
            System.out.println("Data saved to XML file: " + outputPath);

        } catch (JAXBException e) {
            e.printStackTrace();
        }
    }

    public static void main(String[] args) {
        String xmlFile = "src/books.xml";
        Library library = parseXML(xmlFile);

        if (library != null) {
            System.out.println("Books found in XML:");
            for (Book book : library.getBooks()) {
                System.out.println("Title: " + book.getTitle() + ", ISBN: " + book.getISBN());
            }
        }

        String outputFilePath = "src/output_books.xml";
        writeXML(library, outputFilePath);
    }
}
