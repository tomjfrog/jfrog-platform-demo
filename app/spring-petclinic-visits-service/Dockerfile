#Download image from artifactory
ARG REGISTRY=docker.artifactory
#FROM openjdk:11-jdk
#FROM $REGISTRY/openjdk:8-jdk-alpine
FROM $REGISTRY/openjdk:11-jdk


WORKDIR /app

#Define ARG Again -ARG variables declared before the first FROM need to be declered again
ARG REGISTRY=http://artifactory-unified.soleng-us.jfrog.team/artifactory
MAINTAINER Shani Levy
EXPOSE 8082

# Download artifacts from Artifactory
RUN curl $REGISTRY/visits_service-maven/org/springframework/samples/petclinic/visits/spring-petclinic-visits-service/2.3.1/spring-petclinic-visits-service-2.3.1.jar --output visits_server1.jar

# Set JAVA OPTS + Static file location
ENV STATIC_FILE_LOCATION="/app/package/target/dist/"
ENV JAVA_OPTS=""

# Fire up our Spring Boot app
#ENTRYPOINT [ "sh", "-c", "java $JAVA_OPTS -Dspring.profiles.active=remote -Djava.security.egd=file:/dev/./urandom -jar /app/server1.jar" ]
ENTRYPOINT ["java","-jar","/app/visits_server1.jar"]
