package kata.app;
import kata.lib.HelloModLibSimplest;

public class HelloModLibAppSimplest2 {

    public static void main(String... args) {
        System.out.println("Hello Modularized App Using a Modularized Library!");

        HelloModLibSimplest helloModLibSimplest = new HelloModLibSimplest();
        helloModLibSimplest.doSomething();
    }
}
