package kata.app;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.apache.logging.log4j.Level;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.apache.logging.log4j.simple.SimpleLogger;
import org.apache.logging.log4j.util.PropertiesUtil;
import org.bushe.swing.event.EventBus;
import org.bushe.swing.event.EventTopicSubscriber;

import java.io.FileDescriptor;
import java.io.FileOutputStream;
import java.io.PrintStream;

import static kata.app.CSVReader.TOPIC_CSV2JSON;

public class JSONWriter implements EventTopicSubscriber {

    PrintStream ps = new PrintStream(new FileOutputStream(FileDescriptor.out));

    SimpleLogger logger = new SimpleLogger(
            JSONWriter.class.getName(), Level.DEBUG, true, true, true, true, "HH:mm:ss.SSS", null, PropertiesUtil.getProperties(), ps);

    private final ObjectMapper mapper = new ObjectMapper();
    private Person person;

    public JSONWriter() {
        EventBus.subscribe(TOPIC_CSV2JSON, this);
    }

    public void onEvent(final String topic, final Object payload) {
        if (TOPIC_CSV2JSON.equalsIgnoreCase(topic)) {
            String message = payload.toString();

            String[] msg = message.split(",");
            try {
                switch (msg[0]) {
                    case "first_name":
                        person = new Person(msg[1]);
                        break;
                    case "last_name":
                        person.setLastName(msg[1]);
                        // Convert to JSON and display
                        logger.info(mapper.writeValueAsString(person));
                        break;
                    default:
                        break;
                }
            } catch (JsonProcessingException jpe) {
                jpe.printStackTrace();
            }
        }
    }
}
