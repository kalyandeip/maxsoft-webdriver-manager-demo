# Use Maven base image with JDK 17
FROM maven:3.9.4-eclipse-temurin-17

# Install software-properties-common to add repositories
# Enable universe and multiverse repos
# Install chromium-browser, firefox, wget, unzip
RUN apt-get update && apt-get install -y software-properties-common \
    && add-apt-repository universe \
    && add-apt-repository multiverse \
    && apt-get update \
    && apt-get install -y \
       chromium-browser \
       firefox \
       wget \
       unzip \
    && rm -rf /var/lib/apt/lists/*

# Set working directory (optional)
WORKDIR /app

# Copy your application files (adjust as needed)
COPY . .

# Run Maven build (adjust as per your build commands)
RUN mvn clean package

# Define your entrypoint or command (adjust accordingly)
CMD ["java", "-jar", "target/your-app.jar"]
