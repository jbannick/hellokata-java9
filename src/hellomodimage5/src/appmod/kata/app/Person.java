package kata.app;

public class Person {
    private String firstName;
    private String lastName;

    public Person(final String firstName, final String lastName) {
        this.firstName = firstName;
        this.lastName  = lastName;
    }

    public final String getfirstName() {
        return firstName;
    }

    public final String getLastName()  {
        return lastName;
    }
}
