package kata.app;
import kata.lib.HelloModLibSimplest;

public class HelloModLibAppSimplest3 {

    public static void main(String... args) {
        System.out.println("Hello Custom Runtime Image Using a Library!");

        HelloModLibSimplest helloModLibSimplest = new HelloModLibSimplest();
        helloModLibSimplest.doSomething();
    }
}
