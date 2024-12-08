# Use an OpenJDK image
FROM openjdk:17-jdk-slim

# Set the working directory
WORKDIR /app

# Copy the JAR file into the image
COPY target/springboot-backend-0.0.1-SNAPSHOT.jar app.jar

# Expose port 8080 for the backend
EXPOSE 8080

# Run the Spring Boot application
CMD ["java", "-jar", "app.jar"]
