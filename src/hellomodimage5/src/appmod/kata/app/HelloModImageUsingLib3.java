package kata.app;

import com.fasterxml.jackson.databind.ObjectMapper;

public class HelloModImageUsingLib3 {

    public static void main(String... args) {
        System.out.println("Hello Custom Runtime Image Using the Jackson JSON Library!");

        Person person = new Person("John", "Bannick");
        ObjectMapper mapper = new ObjectMapper();
        try {
            System.out.println(mapper.writerWithDefaultPrettyPrinter().writeValueAsString(
                person));
        } catch (Exception jpe) {
            jpe.printStackTrace();
        }
    }
}
