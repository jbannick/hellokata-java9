package kata.app;

import org.apache.commons.csv.CSVFormat;
import org.apache.commons.csv.CSVParser;
import org.apache.commons.csv.CSVRecord;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.util.Map;
import java.util.Set;

public class HelloModImageUsingLib2 {
    public static void main(String... args) {
        System.out.println("Hello Custom Runtime Image Using the CSVParser Library!");

        try {
            CSVParser parser = new CSVParser(
                    new FileReader("names.csv"),
                    CSVFormat.DEFAULT.withFirstRecordAsHeader());

            Map<String,Integer> headers = parser.getHeaderMap();
            Set<String> keys = headers.keySet();

            parser.getRecords().forEach((CSVRecord r) -> {
                keys.forEach(k -> {
                    System.out.println(String.format("%s \t= %s", k.toString(), r.get(k.toString())));
                });
            });
        } catch (FileNotFoundException fnf) {
            fnf.printStackTrace();
        } catch (IOException ioe) {
            ioe.printStackTrace();
        }
    }
}
