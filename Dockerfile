FROM ubuntu:18.04
RUN apt-get update \
    && apt-get install git tomcat9 default-jdk maven -y
RUN mkdir -p ~/projects \
    && cd ~/projects \
    && git clone https://github.com/boxfuse/boxfuse-sample-java-war-hello.git
WORKDIR ~/projects/boxfuse-sample-java-war-hello
RUN ls -lahF \
    && mvn package
RUN cp target/hello-1.0.war /var/lib/tomcat9/webapps/
EXPOSE 8080
CMD /opt/tomcat/bin/run.sh