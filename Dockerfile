FROM eclipse-temurin:17-jdk-alpine
VOLUME /tmp
docker build --build-arg JAR_FILE=target/*.jar -t myorg/myapp .
COPY ${JAR_FILE} app.jar
ENTRYPOINT ["java","-jar","/app.jar"]