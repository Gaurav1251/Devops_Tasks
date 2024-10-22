FROM ubuntu:latest

RUN apt update -y && \
    apt install openjdk-8-jdk -y && \
    apt install maven -y 
RUN rm -rf /var/lib/apt/lists/*
WORKDIR /app



COPY . /app

# Create the directory for the properties file


RUN mvn clean package -Dmaven.test.skip=true

EXPOSE 8080

CMD ["java", "-jar", "target/spring-backend-v1.jar"]
