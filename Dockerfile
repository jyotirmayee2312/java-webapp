# Use an official Maven image as the base image for the build stage
FROM maven:3.8.4-openjdk-11 AS build

# Set the working directory inside the container
WORKDIR /app

# Copy the Maven project files to the container
COPY mvnw .
COPY pom.xml .
COPY src ./src

# Make mvnw executable (for Unix-based systems)
RUN chmod +x mvnw

# Build the application using Maven and generate the java-app.war file
RUN ./mvnw clean package

# Use a lightweight OpenJDK image as the base image for running the application
FROM openjdk:11-jre-slim

# Set the working directory inside the container
WORKDIR /app

# Copy the generated java-app.war file from the Maven build stage to the container
COPY --from=build /app/target/java-app.war /app/java-app.war

# Command to run the Java application (adjust this according to your app's entry point)
CMD ["java", "-jar", "java-app.war"]
