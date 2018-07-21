package kata.app;

public class HelloModUsingLibs3 {
   
   public static void main(String... args) {
      System.out.println("Hello Modularized App Using a Non-modularized Library!");

      Publisher pub = new Publisher();
      Subscriber sub = new Subscriber();

      pub.publish("Pizza in the break room");
   }
}
