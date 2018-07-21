package kata.api;

import java.util.List;
import java.util.ServiceLoader;
import java.util.stream.Stream;
import java.util.stream.StreamSupport;

public interface Engine {

   String getName();

   void process(String string);

   static Iterable<Engine> getEngines() {
     return ServiceLoader.load(Engine.class);
   }
}
