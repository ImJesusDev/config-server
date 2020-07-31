FROM openjdk:alpine
VOLUME /tmp
ARG ENC_PASS
ENV JASYPT_PASS ${ENC_PASS}
WORKDIR '/app'
EXPOSE 8888
COPY . .
RUN ./mvnw clean install -Djasypt.encryptor.password=${JASYPT_PASS}
ENTRYPOINT java -Djasypt.encryptor.password=${JASYPT_PASS} -jar /app/target/config-server-0.0.1-SNAPSHOT.jar