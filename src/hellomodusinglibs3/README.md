This modularized app uses the EventBus library to connect a Publisher and Subscriber.

The library consists of a single JAR file and is ***not*** modularized.  

The JVM treats eventbus as an "automatic module", 
which grants it some of the benefits, and some of the restrictions of modularization,
without requiring it satisfy all of the requirements for modularization.

eventbus-1.4.jar does not include in its MANIFEST.MF the Automatic-Module-Name entry.  
Therefore Java derives the module name, eventbus, from the JAR name.

The app is deployed in a JAR file.
To run properly, it requires the eventbus JAR file as well.

To build and run this app:

- You must have Java JDK 9 or greater installed
- You must have eventbus-1.4.jar at EBUS_HOME

Download eventbus from: 
https://mvnrepository.com/artifact/org.bushe/eventbus/1.4/

1. Copy the src directory tree to your destination location
2. Copy build.sh to that location
3. Copy run.sh to that location
4. At the command line, cd to your destination location
5. At the command line, execute: build.sh

The app should build.

6. At the command line, execute: run.sh

The console should display:

Hello Modularized App Using a Non-modularized Library!  
Publisher is instantiated  
Subscriber is instantiated  
Subscriber received a rumor: Pizza in the break room

To deploy and run this app:

- You must have installed on the destination computer a Java JRE 
with a version that is at or later than the version of the JDK you used
to build this app

1. Copy to the destination computer and directory:  
appmod.jar  
eventbus-1.4.jar  
run.sh 
2. At the command line, cd to that location
2. At the command line, execute: run.sh

The console should display as above.
