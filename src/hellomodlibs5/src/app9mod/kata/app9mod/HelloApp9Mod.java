package kata.app9mod;

import kata.lib.HelloLib;

public class HelloApp9Mod {

    public static void main(String... args) {
        System.out.println("Hello Modularized Java 9 App!");
        System.out.println(String.format(
            "This app is running under Java version %s\n", System.getProperty("java.version")));

        HelloLib lib = new HelloLib();
        lib.doSomething();
        lib.doSomethingElse();
    }
}
