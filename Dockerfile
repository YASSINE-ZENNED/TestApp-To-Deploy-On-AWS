FROM openjdk:8
EXPOSE 8080
ADD target/TastApp.jar TastApp.jar 
ENTRYPOINT ["java","-jar","/TastApp.jar"]
