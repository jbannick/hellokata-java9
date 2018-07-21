package kata.app10mod;

import kata.lib.HelloLib;

public class HelloApp10Mod {

    public static void main(String... args) {
        System.out.println("Hello Modularized Java 10 App!");

        System.out.println(String.format(
            "This app is running under Java version %s", System.getProperty("java.version")));

        System.out.println(String.format(
            "on %s %s\n", System.getProperty("os.name"), System.getProperty("os.version")));

        HelloLib lib = new HelloLib();

        lib.doSomething();
        lib.doSomethingElse();
    }
}
