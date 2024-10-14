package xmlvalidator;

import org.xml.sax.SAXException;

import javax.xml.XMLConstants;
import javax.xml.transform.stream.StreamSource;
import javax.xml.validation.Schema;
import javax.xml.validation.SchemaFactory;
import javax.xml.validation.Validator;
import java.io.File;
import java.io.IOException;

public class XMLValidator {
    public static boolean validateXMLSchema(String xmlFile, String xsdFile) {
        try {
            SchemaFactory factory = SchemaFactory.newInstance(XMLConstants.W3C_XML_SCHEMA_NS_URI);
            Schema schema = factory.newSchema(new File(xsdFile));
            Validator validator = schema.newValidator();
            validator.validate(new StreamSource(new File(xmlFile)));
        } catch (IOException | SAXException e) {
            System.out.println("Validation failed: " + e.getMessage());
            return false;
        }
        System.out.println("Validation completed successfully.");
        return true;
    }

    public static void main(String[] args) {
        String xmlFile = "src/books.xml";
        String xsdFile = "src/books.xsd";

        validateXMLSchema(xmlFile, xsdFile);
    }
}