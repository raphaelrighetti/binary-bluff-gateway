FROM maven:3.9.5-amazoncorretto-17 AS build
COPY . .
RUN mvn clean package -DskipTests

FROM amazoncorretto:17-al2023
ENV GATEWAY_PORT=8080
RUN mkdir /app
WORKDIR /app
COPY --from=build target/gateway-0.0.1-SNAPSHOT.jar ./app.jar
EXPOSE ${GATEWAY_PORT}
ENTRYPOINT [ "java", "-jar", "app.jar" ]