
FROM maven:3.8.4-openjdk-17 AS build

# Set working directory
WORKDIR /app

COPY pom.xml .
RUN mvn dependency:go-offline -B

COPY . .
RUN mvn package -DskipTests

FROM eclipse-temurin:17-jdk

COPY --from=build /app/target/*.jar /usr/app/app.jar

# Expose port 8080
EXPOSE 8080

ENTRYPOINT ["java", "-jar", "/usr/app/app.jar"]
