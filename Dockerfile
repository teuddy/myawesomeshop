# Start with a base image containing Java runtime
FROM openjdk:8-jdk-alpine

# Add Maintainer Info
LABEL maintainer="teuddycr@gmail.com"

# Add a volume pointing to /tmp
VOLUME /tmp

# Make port 8080 available to the world outside this containerr
EXPOSE 8282

# The application's jar file
ARG JAR_FILE=target/myawesomeshop-0.0.1-SNAPSHOT.jar

# Add the application's jar to the container
ADD ${JAR_FILE} myawesomeshop.jar

# Run the jar file
ENTRYPOINT ["java","-Djava.security.egd=file:/dev/./urandom","-jar","/myawesomeshop.jar"]