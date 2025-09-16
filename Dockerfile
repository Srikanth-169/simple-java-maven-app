# Use a base image with Java installed
FROM openjdk:17-jdk-slim

# Set working directory inside the container
WORKDIR /app

# Copy the built WAR file into the container
COPY target/myapp-1.0.0.war app.war

# Expose port 8080
EXPOSE 8081

# Run the application
ENTRYPOINT ["java", "-jar", "app.war"]
