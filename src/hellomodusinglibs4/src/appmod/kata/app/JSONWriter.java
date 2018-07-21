package kata.app;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.bushe.swing.event.EventBus;
import org.bushe.swing.event.EventTopicSubscriber;

import static kata.app.CSVReader.*;

public class JSONWriter implements EventTopicSubscriber {

    private static final Logger logger = LogManager.getLogger();
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
