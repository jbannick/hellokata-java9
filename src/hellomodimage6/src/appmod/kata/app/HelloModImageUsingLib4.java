package kata.app;

import org.apache.logging.log4j.Level;
import org.apache.logging.log4j.simple.SimpleLogger;
import org.apache.logging.log4j.util.PropertiesUtil;

import java.io.FileDescriptor;
import java.io.FileOutputStream;
import java.io.PrintStream;

public class HelloModImageUsingLib4 {

    public static void main(String... args){
        System.out.println("Hello Custom Runtime Image Using the Log4J2 Library!");
        PrintStream ps = new PrintStream(new FileOutputStream(FileDescriptor.out));

        SimpleLogger logger = new SimpleLogger(
                HelloModImageUsingLib4.class.getName(), Level.DEBUG, true, true, true, true, "HH:mm:ss.SSS", null, PropertiesUtil.getProperties(), ps);

        logger.info("This is an information entry");
        logger.debug("This is a debugging entry");
        logger.warn("This is a warning entry");
        logger.error("This is an error entry");

    }
}
