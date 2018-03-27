FROM jenkins:alpine

ENV JENKINS_SLAVE_AGENT_PORT 50000

COPY resources/plugins/plugins.txt /usr/share/jenkins/ref/
RUN /usr/local/bin/install-plugins.sh $(cat /usr/share/jenkins/ref/plugins.txt)

COPY resources/users/*.groovy /usr/share/jenkins/ref/init.groovy.d/

