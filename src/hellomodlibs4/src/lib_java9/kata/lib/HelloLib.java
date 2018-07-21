package kata.lib;

public class HelloLib implements HelloLibIF{
    public void doSomething() {
        System.out.println("Hello Library - Java 9!");
        System.out.println(String.format("The library is running under Java version %s", System.getProperty("java.version")));

        System.out.println("The stack is:");
        StackWalker.getInstance().forEach(System.out::println);
    }
}
