FROM maven:3.8.6-amazoncorretto-17 as build
WORKDIR /app
COPY . .
RUN mvn clean package -X -DskipTests

FROM eclipse-temurin:17-jdk-alpine
WORKDIR /app
RUN mvn package
COPY --from=build ./app/target/*.jar app.jar
ENTRYPOINT ["java","-jar","/app.jar"]