package kata.app;

import org.bushe.swing.event.EventBus;
import org.bushe.swing.event.EventTopicSubscriber;

public class Subscriber  implements EventTopicSubscriber {

    public Subscriber() {
        System.out.println("Subscriber is instantiated");

        EventBus.subscribe(Publisher.TOPIC_RUMOR, this);
    }

    public void onEvent(final String topic, final Object payload) {
        System.out.println(String.format("Subscriber received a rumor: %s", payload.toString()));
    }
}
