package kata.app7;

import kata.lib.HelloLib;

public class HelloApp7 {

    public static void main(String... args) {
        System.out.println("Hello Java 7 App Using a Java 7 and 9 Versioned Library!");
        System.out.println(String.format("This app is running under Java version %s", System.getProperty("java.version")));

        HelloLib lib = new HelloLib();
        lib.doSomething();
    }
}
