# Use official Maven image with JDK 11
FROM maven:3.9.6-eclipse-temurin-11 as builder

# Set working directory
WORKDIR /build

# Copy all files
COPY . .

# Build the Jenkins plugin, skipping tests for speed (optional)
RUN mvn clean install -DskipTests

# Final image stage (optional if you want to run something)
# FROM eclipse-temurin:11-jre as runtime
# COPY --from=builder /build/target/ant.hpi /ant.hpi

# Default command (optional if just for building)
# CMD ["java", "-jar", "/ant.hpi"]
