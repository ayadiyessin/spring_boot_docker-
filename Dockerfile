FROM maven:3.8.5-openjdk-8 AS build

WORKDIR /app

COPY pom.xml /app
RUN mvn dependency:go-offline -B

COPY src /app/src
RUN mvn clean package -DskipTests

FROM openjdk:8-jre-slim

WORKDIR /app

COPY --from=build /app/target/spring-course-1.0.jar /app/spring-course-1.0.jar

EXPOSE 8080

ENTRYPOINT ["java", "-jar", "/app/spring-course-1.0.jar"]
