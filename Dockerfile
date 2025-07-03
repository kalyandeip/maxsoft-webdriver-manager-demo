# Use official Maven image with OpenJDK 8
FROM maven:3.8.7-eclipse-temurin-8

# Set working directory inside the container
WORKDIR /app

# Copy all project files (pom.xml + source code)
COPY . .

# Download dependencies to speed up build process (optional)
RUN mvn dependency:resolve

# Compile and run tests
RUN mvn clean test

# Default command (optional)
CMD ["mvn", "test"]
