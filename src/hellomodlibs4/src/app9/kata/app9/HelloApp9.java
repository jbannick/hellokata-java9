package kata.app9;

import kata.lib.HelloLib;

public class HelloApp9 {

    public static void main(String... args) {
        System.out.println("Hello Non-Modularized Java 9 App Using a Java 7 and 9 Versioned Library!");
        System.out.println(String.format("This app is running under Java version %s", System.getProperty("java.version")));

        HelloLib lib = new HelloLib();
        lib.doSomething();
    }
}
