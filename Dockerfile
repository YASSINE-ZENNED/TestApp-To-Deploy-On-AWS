FROM openjdk:8
EXPOSE 8080
ADD target/TestApp-To-Deploy-On-AWS-0.0.1-SNAPSHOT.jar TestApp-To-Deploy-On-AWS-0.0.1-SNAPSHOT.jar 
ENTRYPOINT ["java","-jar","/TestApp-To-Deploy-On-AWS-0.0.1-SNAPSHOT.jar"]
