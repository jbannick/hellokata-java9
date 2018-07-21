package kata.app;

import kata.api.Engine;

public class HelloMultiModSvcsApp {
    
    public static void main(String... args) {
        System.out.println("Hello Mult-Module Services App!");

        Iterable<Engine> engines = Engine.getEngines();
        
        for (Engine engine : engines) {
            engine.process("Carrots");
        }
    }
}
