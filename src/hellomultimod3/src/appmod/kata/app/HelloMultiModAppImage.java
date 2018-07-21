package kata.app;
import kata.eng.Engine;
public class HelloMultiModAppImage {
    public static void main(String... args) {
        System.out.println("Hello Mult-Module App Custom Runtime Image!");

        Engine engine = new Engine();
        engine.process("Carrots");
    }
}
