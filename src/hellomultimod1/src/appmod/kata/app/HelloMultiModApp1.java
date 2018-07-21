package kata.app;
import kata.eng.Engine;
public class HelloMultiModApp1 {
    public static void main(String... args) {
        System.out.println("Hello Mult-Module App!");

        Engine engine = new Engine();
        engine.process("Carrots");
    }
}
