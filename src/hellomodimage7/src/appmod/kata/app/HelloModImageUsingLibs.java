package kata.app;

import org.apache.logging.log4j.Level;
import org.apache.logging.log4j.simple.SimpleLogger;
import org.apache.logging.log4j.util.PropertiesUtil;
import org.bushe.swing.event.EventBus;
import org.bushe.swing.event.EventTopicSubscriber;

import java.io.FileDescriptor;
import java.io.FileOutputStream;
import java.io.PrintStream;

import static kata.app.CSVReader.*;

public class HelloModImageUsingLibs implements EventTopicSubscriber {

    PrintStream ps = new PrintStream(new FileOutputStream(FileDescriptor.out));

    SimpleLogger logger = new SimpleLogger(
            HelloModImageUsingLibs.class.getName(), Level.DEBUG, true, true, true, true, "HH:mm:ss.SSS", null, PropertiesUtil.getProperties(), ps);

    public HelloModImageUsingLibs() {
        System.out.println("Hello Custom Runtime Image Using Multiple Libraries!");

        EventBus.subscribe(TOPIC_CSV2JSON, this);

        new JSONWriter();
        CSVReader  csvReader  = new CSVReader();

        csvReader.readCSV();
    }

    public static void main(String... args) {
        new HelloModImageUsingLibs();
     }

    public void onEvent(final String topic, final Object payload) {
        if (TOPIC_CSV2JSON.equalsIgnoreCase(topic)) {
            String message = payload.toString();
            switch (message) {
                case MSG_STARTING:
                    logger.info(message);
                    break;
                case MSG_STOPPING:
                    logger.info(message);
                    break;
                default:
                    // Nothing we're interested in
                    break;
            }
        }
    }
}
