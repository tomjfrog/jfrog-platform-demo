#Download image from artifactory
ARG REGISTRY=tomjfrog.jfrog.io
#FROM openjdk:11-jdk
#FROM $REGISTRY/openjdk:8-jdk-alpine
FROM $REGISTRY/petclinic-microservices-virtual/adoptopenjdk:11-jdk


WORKDIR /app

#Define ARG Again -ARG variables declared before the first FROM need to be declered again
ARG REPOSITORY=https://tomjfrog.jfrog.io/artifactory
MAINTAINER Tom Johander
EXPOSE 8761

# Download artifacts from Artifactory
RUN curl $REPOSITORY/discovery_server-maven/org/springframework/samples/petclinic/discovery/spring-petclinic-discovery-server/2.3.1/spring-petclinic-discovery-server-2.3.1.jar --output discovery_server1.jar


# Set JAVA OPTS + Static file location
ENV STATIC_FILE_LOCATION="/app/package/target/dist/"
ENV JAVA_OPTS=""

# Fire up our Spring Boot app
#ENTRYPOINT [ "sh", "-c", "java $JAVA_OPTS -Dspring.profiles.active=remote -Djava.security.egd=file:/dev/./urandom -jar /app/server1.jar" ]
ENTRYPOINT ["java","-jar","/app/discovery_server1.jar"]


#FROM openjdk:8-jdk-alpine
#VOLUME /tmp
#ADD target/*.jar app.jar
#ENV JAVA_OPTS="
#ENTRYPOINT [ "sh", "-c", "java $JAVA_OPTS -Djava.security.egd=file:/dev/./urandom -jar /app.jar" ]
