FROM ubuntu:latest

LABEL dev="Gaurav"

RUN apt-get update && apt-get install -y \
    wget \
    unzip \
    mysql-client
# Set the JDK version
ENV JAVA_VERSION=18.0.2
ENV JAVA_HOME=/usr/local/java/jdk-18.0.2
ENV PATH="$JAVA_HOME/bin:$PATH"

# Download and install JDK 18
RUN wget --no-verbose https://download.oracle.com/java/18/archive/jdk-18.0.2_linux-x64_bin.tar.gz && \
    mkdir -p /usr/local/java && \
    tar -xzf jdk-18.0.2_linux-x64_bin.tar.gz -C /usr/local/java && \
    rm jdk-18.0.2_linux-x64_bin.tar.gz

# Verify installation
RUN java -version
ADD https://downloads.apache.org/tomcat/tomcat-9/v9.0.96/bin/apache-tomcat-9.0.96.zip ./

RUN unzip apache-tomcat-9.0.96.zip

COPY ticketbooking2.war ./apache-tomcat-9.0.96/webapps/
COPY context.xml ./apache-tomcat-9.0.96/conf/
ADD https://s3-us-west-2.amazonaws.com/studentapi-cit/mysql-connector.jar ./apache-tomcat-9.0.96/lib/mysql-connector.jar 
RUN chmod +rwx ./apache-tomcat-9.0.96/bin/*.sh
ENV CATALINA_HOME /apache-tomcat-9.0.96
ENV PATH $CATALINA_HOME/bin:$PATH
EXPOSE 8080

CMD ["catalina.sh", "run"]
