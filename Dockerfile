# Use Maven with OpenJDK base image
FROM maven:3.8.6-openjdk-17

# Install wget, unzip, and browsers (chromium and firefox)
RUN apt-get update && apt-get install -y \
    chromium \
    firefox-esr \
    wget \
    unzip \
    && rm -rf /var/lib/apt/lists/*

# Set environment variables for browsers (optional)
ENV CHROME_BIN=/usr/bin/chromium
ENV FIREFOX_BIN=/usr/bin/firefox-esr

# Install ChromeDriver
RUN CHROME_DRIVER_VERSION=$(curl -sS https://chromedriver.storage.googleapis.com/LATEST_RELEASE) && \
    wget -q https://chromedriver.storage.googleapis.com/${CHROME_DRIVER_VERSION}/chromedriver_linux64.zip && \
    unzip chromedriver_linux64.zip && \
    mv chromedriver /usr/local/bin/chromedriver && \
    chmod +x /usr/local/bin/chromedriver && \
    rm chromedriver_linux64.zip

# Install GeckoDriver (Firefox)
RUN GECKO_DRIVER_VERSION=v0.33.0 && \
    wget -q https://github.com/mozilla/geckodriver/releases/download/${GECKO_DRIVER_VERSION}/geckodriver-${GECKO_DRIVER_VERSION}-linux64.tar.gz && \
    tar -xzf geckodriver-${GECKO_DRIVER_VERSION}-linux64.tar.gz && \
    mv geckodriver /usr/local/bin/geckodriver && \
    chmod +x /usr/local/bin/geckodriver && \
    rm geckodriver-${GECKO_DRIVER_VERSION}-linux64.tar.gz

# Set working directory inside container
WORKDIR /app

# Copy your project files to the container
COPY . .

# Run Maven tests (make sure your tests use headless mode!)
RUN mvn clean test

# Optional: default command
CMD ["mvn", "clean", "test"]
