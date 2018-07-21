package kata.app;

public class HelloModUsingLibs5 {
   
   public static void main(String... args) {
      System.out.println("Hello Modularized App Using a Library Modularized via a HACK!");

      Publisher pub = new Publisher();
      Subscriber sub = new Subscriber();

      pub.publish("Pizza in the break room");
   }
}
