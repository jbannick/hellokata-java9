package kata.lib;

import java.util.*;

public class HelloLib implements HelloLibIF {
    public void doSomething() {
        System.out.println("Hello Library - Java 9 code!");
        System.out.println(String.format(
            "The library is running under Java version %s\n", System.getProperty("java.version")));

        System.out.println("The stack is:");
        StackWalker.getInstance().forEach(System.out::println);
    }

    public void doSomethingElse() {

        List<String> list1 = new ArrayList<>();
        list1.add("Moe");
        list1.add("Larry");
        list1.add("Curly");

        List<String> list2 = new ArrayList<>();
        list2.add("Laurel");
        list2.add("Hardy");

        HashMap<Integer,List> map = new HashMap<>();
        map.put(1, list1);
        map.put(2, list2);

        System.out.println("\nComics are:");

        map.values().forEach(System.out::println);
    }
}
