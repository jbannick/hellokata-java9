package kata.app;

public class HelloModImageUsingLib1 {
   
   public static void main(String... args) {
      System.out.println("Hello Custom Runtime Image Using the EventBus Library!");

      Publisher  pub = new Publisher();

      new Subscriber();

      pub.publish("Pizza in the break room");
   }
   
}
