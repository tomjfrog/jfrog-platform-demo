#Download image from artifactory
ARG REGISTRY=tomjfrog.jfrog.io/petclinic-microservices-virtual
#FROM openjdk:11-jdk
#FROM $REGISTRY/openjdk:8-jdk-alpine
FROM $REGISTRY/petclinic-microservices-virtual/adoptopenjdk:11-jdk


WORKDIR /app

#Define ARG Again -ARG variables declared before the first FROM need to be declered again
ARG REPOSITORY=https://tomjfrog.jfrog.io/artifactory
MAINTAINER Tom Johander
EXPOSE 8081

# Download artifacts from Artifactory
RUN curl $REPOSITORY/customer_service-maven/org/springframework/samples/petclinic/client/spring-petclinic-customers-service/2.3.1/spring-petclinic-customers-service-2.3.1.jar --output customers_server1.jar

# Set JAVA OPTS + Static file location
ENV STATIC_FILE_LOCATION="/app/package/target/dist/"
ENV JAVA_OPTS=""

# Fire up our Spring Boot app
#ENTRYPOINT [ "sh", "-c", "java $JAVA_OPTS -Dspring.profiles.active=remote -Djava.security.egd=file:/dev/./urandom -jar /app/server1.jar" ]
ENTRYPOINT ["java","-jar","/app/customers_server1.jar"]
