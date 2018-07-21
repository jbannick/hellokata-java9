package kata.app;

import org.apache.commons.csv.CSVFormat;
import org.apache.commons.csv.CSVParser;
import org.apache.commons.csv.CSVRecord;
import org.bushe.swing.event.EventBus;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.util.Map;
import java.util.Set;

public class CSVReader {

    private static final String CSV_FILE = "names.csv";

    public static final String TOPIC_CSV2JSON  = "csv2json";

    public static final String MSG_STARTING = "Reading CSV";
    public static final String MSG_STOPPING = "Finished reading CSV";

    public CSVReader() {
    }

    public void readCSV() {
        EventBus.publish(TOPIC_CSV2JSON, MSG_STARTING);

        try {
            CSVParser parser = new CSVParser(
                new FileReader(CSV_FILE),
                CSVFormat.DEFAULT.withFirstRecordAsHeader());

            Map<String,Integer> headers = parser.getHeaderMap();
            Set<String> keys = headers.keySet();

            parser.getRecords().forEach((CSVRecord r) -> {
                keys.forEach(k -> {
                    EventBus.publish(TOPIC_CSV2JSON,
                        String.format("%s,%s", k.toString(), r.get(k.toString())));
                });
            });
        } catch (FileNotFoundException fnf) {
            fnf.printStackTrace();
        } catch (IOException ioe) {
            ioe.printStackTrace();
        }

        EventBus.publish(TOPIC_CSV2JSON, MSG_STOPPING);
    }
}
