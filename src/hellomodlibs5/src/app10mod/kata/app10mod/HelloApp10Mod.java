package kata.app10mod;

        import kata.lib.HelloLib;

public class HelloApp10Mod {

    public static void main(String... args) {
        System.out.println("Hello Modularized Java 10 App!");
        System.out.println(String.format(
                "This app is running under Java version %s\n", System.getProperty("java.version")));

        HelloLib lib = new HelloLib();
        lib.doSomething();
        lib.doSomethingElse();
    }
}
