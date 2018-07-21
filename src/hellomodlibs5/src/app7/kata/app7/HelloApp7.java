package kata.app7;

import kata.lib.HelloLib;

public class HelloApp7 {

    public static void main(String... args) {
        System.out.println("Hello Java 7 App!");
        System.out.println(String.format(
            "This app is running under Java version %s\n", System.getProperty("java.version")));

        HelloLib lib = new HelloLib();
        lib.doSomething();
        lib.doSomethingElse();
    }
}
