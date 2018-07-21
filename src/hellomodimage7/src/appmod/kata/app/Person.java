package kata.app;

public class Person {
    private String firstName;
    private String lastName;

    public Person(final String firstName) {
        this.firstName = firstName;
    }

    public final void setLastName(final String lastName) {
        this.lastName  = lastName;
    }

    public final String getfirst_name() {
        return firstName;
    }

    public final String getlast_name() {
        return lastName;
    }
}
