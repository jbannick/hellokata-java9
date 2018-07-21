package kata.app;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

public class HelloModUsingLibs2 {

    private static Logger logger;

    public static void main(String... args){
        System.out.println("Hello Modularized Using a Partially Modularized Library!");

        System.setProperty("log4j.configurationFile", "jar:file:appmod.jar!/log4j2.xml");
        logger = LogManager.getLogger();

        logger.info("This is an information entry");
        logger.debug("This is a debugging entry");
        logger.warn("This is a warning entry");
        logger.error("This is an error entry");
    }
}
