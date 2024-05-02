# I Built and Deployed My SpringBoot App to AWS!

This document walks you through how I built and deployed my SpringBoot application as a Docker image to Amazon ECR (Elastic Container Registry) using AWS CodeBuild. I then deployed it to AWS Fargate within an ECS (Elastic Container Service) cluster. Here's how I did it:

### Setting Up the Build Process:



**CodeBuild Project** : First, I created an AWS CodeBuild project. I gave it a cool name (you can too!) and chose "Build from source." Then, I linked it to my GitHub repository where my  SpringBoot code lives. Don't forget the **Dockerfile** and **buildspec.yml** files - they're essential for building the image!  Finally, I picked a build environment that works best for my  project (like "Ubuntu base" with Maven or Gradle).
 
 Building the Image: My trusty buildspec.yml file defines the steps CodeBuild needs to follow. Here's what's in there:

 Optional Pre-build: If the build environment doesn't already have Maven or Gradle, this step installs them.
 
 Building the App: This step executes the appropriate command to build my SpringBoot application (e.g., mvn install or gradle build).
 
 Docker Build Time! This step runs the docker build command using arguments that reference my Dockerfile and the directory containing my code. This creates the Docker image.
 
 Tagging the Image (Optional): I can optionally tag the image with a descriptive name for easier identification (e.g., <your-account-id>.dkr.ecr.<region>.amazonaws.com/<image-name>: 
 <version>).
 
 Pushing to ECR : If I want to automate pushing the image to ECR, I can add a post-build step that uses the AWS CLI or SDK with proper credentials.

 
### Building and Pushing:

I can initiate a build manually in the AWS Management Console, or configure CodeBuild to build automatically whenever I push changes to my code.
CodeBuild retrieves my code, executes the build steps in my buildspec.yml file, and builds the Docker image.
If I configured it, the post-build step pushes the image to my designated ECR repository.
Deployment to ECS:

ECS Task Definition: Now that I have the image in ECR, I need to define an ECS task that knows how to run it.  I navigated to the ECS service in the AWS Management Console and either created a new task definition or updated an existing one. Here's what I configured:

Image URI: I specified the image URI referencing the ECR image I pushed earlier.
Resource Requirements: I allocated CPU, memory, and other resources my container needs to run smoothly.
Port Mappings: I defined which ports on the container should be exposed externally (e.g., port 8080 for the application).
ECS Service: Finally, I created a new ECS service (or updated an existing one) to actually run my containerized application. Here's what I did:

Task Definition: I associated the task definition I created in step 1 with the service.
Desired Tasks: I defined the desired number of tasks to run concurrently in my Fargate cluster.
Scaling and Other Settings: I configured any scaling policies or other service settings as needed.
And There You Have It!

By following these steps, I successfully built and deployed my SpringBoot application as a Docker container on 
