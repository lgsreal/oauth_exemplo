FROM gradle:latest AS BUILD
WORKDIR /usr/app/
COPY . .
RUN gradle build

FROM openjdk:21-jdk-slim
COPY --from=BUILD /usr/app .
EXPOSE 8080
ENTRYPOINT exec java -jar app.jar