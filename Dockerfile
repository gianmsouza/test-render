FROM eclipse-temurin:17-jdk-alpine
WORKDIR /app
RUN mvn package
COPY ./app/target/*.jar app.jar
ENTRYPOINT ["java","-jar","/app.jar"]