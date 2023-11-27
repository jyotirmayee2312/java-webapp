# Use a base image with Java installed
FROM openjdk:11

# Set the working directory inside the container
WORKDIR /app

# Copy the entire project directory into the container at /app
COPY . /app

RUN mvn clean package

# Command to run your application
CMD ["java", "-jar", "target/java-app.jar"]
