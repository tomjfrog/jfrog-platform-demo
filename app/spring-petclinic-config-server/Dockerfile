#Download image from artifactory
# This `REGISTRY` ARG is used to download the base Docker image from Artifactory.  It should point to a registry and repo that can resolve the base image.
ARG REGISTRY=tomjfrog.jfrog.io
# This is the Repository name and image name from which the base image is pulled.
FROM $REGISTRY/petclinic-microservices-virtual/adoptopenjdk:11-jdk

WORKDIR /app

# Define ARG Again -ARG variables declared before the first FROM need to be declered again
# This time, the `REGISTRY` ARG is used to download the application artifacts from Artifactory.  It should point to a repository and repo that can resolve the application artifacts.
ARG REPOSITORY=https://tomjfrog.jfrog.io/artifactory
MAINTAINER Tom Johander

EXPOSE 8888

# Download artifacts from Artifactory
RUN curl $REPOSITORY/config_server-maven/org/springframework/samples/petclinic/config/spring-petclinic-config-server/2.3.1/spring-petclinic-config-server-2.3.1.jar --output server1.jar


#ARG JAR=server1.jar
#COPY target/$JAR /app.jar
#ENTRYPOINT ["java","-jar","/app.jar"]

# Set JAVA OPTS + Static file location
ENV STATIC_FILE_LOCATION="/app/package/target/dist/"
ENV JAVA_OPTS=""

# Fire up our Spring Boot app
#ENTRYPOINT [ "sh", "-c", "java $JAVA_OPTS -Dspring.profiles.active=remote -Djava.security.egd=file:/dev/./urandom -jar /app/server1.jar" ]
ENTRYPOINT ["java","-jar","/app/server1.jar"]


#FROM openjdk:8-jdk-alpine
#VOLUME /tmp
#ADD target/*.jar app.jar
#ENV JAVA_OPTS="
#ENTRYPOINT [ "sh", "-c", "java $JAVA_OPTS -Djava.security.egd=file:/dev/./urandom -jar /app.jar" ]
