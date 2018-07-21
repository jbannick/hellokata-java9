package kata.app;

import org.apache.logging.log4j.simple.SimpleLogger;
import org.apache.logging.log4j.util.PropertiesUtil;
import org.apache.logging.log4j.Level;

import java.io.FileDescriptor;
import java.io.FileOutputStream;
import java.io.PrintStream;

public class HelloModUsingLibs1 {

    private static final PrintStream ps = new PrintStream(new FileOutputStream(FileDescriptor.out));

    private static final SimpleLogger logger = new SimpleLogger(
        HelloModUsingLibs1.class.getName(), Level.DEBUG, true, true, true, true, "HH:mm:ss.SSS", null, PropertiesUtil.getProperties(), ps);

    public static void main(String... args){
        System.out.println("Hello Modularized Using a Fully Modularized Library!");

        logger.info("This is an information entry");
        logger.debug("This is a debugging entry");
        logger.warn("This is a warning entry");
        logger.error("This is an error entry");
    }
}
