package kata.app;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.bushe.swing.event.EventBus;
import org.bushe.swing.event.EventTopicSubscriber;

import static kata.app.CSVReader.MSG_STARTING;
import static kata.app.CSVReader.MSG_STOPPING;
import static kata.app.CSVReader.TOPIC_CSV2JSON;

public class HelloModUsingLibs4  implements EventTopicSubscriber {

    private static final Logger logger = LogManager.getLogger();

    public HelloModUsingLibs4() {
        System.out.println("Hello Modularized App Using Multiple Non-Modularized Libraries!");

        EventBus.subscribe(TOPIC_CSV2JSON, this);

        new JSONWriter();
        CSVReader  csvReader  = new CSVReader();

        csvReader.readCSV();
    }

    public static void main(String... args) {
        new HelloModUsingLibs4();
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
