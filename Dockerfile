FROM openjdk:17
EXPOSE 8080
ADD target/TestApp.jar TestApp.jar 
ENTRYPOINT ["java","-jar","TestApp.jar"]
