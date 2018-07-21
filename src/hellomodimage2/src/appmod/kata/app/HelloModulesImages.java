package kata.app;

public class HelloModulesImages {

    public static void main(String... args) {
        System.out.println("Hello Custom Runtime Images!");
        System.out.println(
           String.format("I am running on %s %s",
             System.getProperty("os.name"),
                         System.getProperty("os.version")));
    }
}
