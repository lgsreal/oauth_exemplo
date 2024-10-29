FROM ubuntu:latest AS build

RUN apt update
RUN apt install openjdk-21-jdk -y
COPY . .

RUN apt install snapd -y
RUN systemctl start snapd
RUN snap install gradle --classic

RUN ./gradlew clean build

FROM openjdk:21-jdk-slim

EXPOSE 8080

COPY --from=build build/libs/oauth_exemplo-0.0.1-SNAPSHOT.jar app.jar

ENTRYPOINT ["java", "-jar", "app.jar"]