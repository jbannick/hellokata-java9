package kata.app;

import org.bushe.swing.event.*;

public class Publisher {

    public static final String TOPIC_RUMOR = "rumor";

    public Publisher() {
        System.out.println("Publisher is instantiated");
    }

    public void publish(final String message) {
        EventBus.publish(TOPIC_RUMOR, message);
    }
}
