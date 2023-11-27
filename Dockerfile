# Use an official Maven image as the base image
FROM maven:3.8.4-openjdk-11 AS build

# Set the working directory inside the container
WORKDIR /app

# Copy the Maven project files to the container
COPY pom.xml .
COPY src ./src
COPY mvnw mvnw

# Build the application using Maven
RUN mvn clean package

# Use an OpenJDK image as the base image for running the application
FROM openjdk:11-jre-slim

# Set the working directory inside the container
WORKDIR /app

# Copy the built JAR/WAR file from the Maven build stage to the container
COPY --from=build /app/target/hello-world-maven.jar /app/hello-world-maven.jar

# Command to run the Java application
CMD ["java", "-jar", "hello-world-maven.jar"]

