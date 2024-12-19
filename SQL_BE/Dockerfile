FROM openjdk:17
LABEL "Project"="Java Application"

WORKDIR /app
COPY /var/lib/jenkins/workspace/ReactSpringboot/SQL_BE/target/SQL_BE-0.0.1-SNAPSHOT.jar .
EXPOSE 8081

CMD ["java", "-jar", "SQL_BE-0.0.1-SNAPSHOT.jar"]
