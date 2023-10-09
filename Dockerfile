FROM amazoncorretto:17-al2023
ENV GATEWAY_PORT=8080
RUN mkdir /app
WORKDIR /app
COPY . .
# ----
# Install Maven
RUN dnf install -y maven
EXPOSE ${GATEWAY_PORT}
ENTRYPOINT [ "bash", "entrypoint.sh" ]