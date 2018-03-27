FROM jenkins:alpine

COPY plugins.txt /usr/share/jenkins/
RUN /usr/local/bin/install-plugins.sh $(cat /usr/share/jenkins/plugins.txt)

ENV JENKINS_SWARM_PLUGIN_VERSION=1.10

USER root

RUN curl -s -o /bin/swarm-client.jar \
    -k http://repo.jenkins-ci.org/releases/org/jenkins-ci/plugins/swarm-client/${JENKINS_SWARM_PLUGIN_VERSION}/swarm-client-${JENKINS_SWARM_PLUGIN_VERSION}-jar-with-dependencies.jar

COPY wait-for.sh /usr/share/jenkins/

CMD /usr/share/jenkins/wait-for.sh jenkins:50000 -- java -jar /bin/swarm-client.jar -executors ${SLAVE_EXECUTORS} -description "${SLAVE_DESCRIPTION}" -master ${SWARM_MASTER} -username ${SWARM_USER} -password ${SWARM_PASSWORD} -name "${SLAVE_NAME}" -labels "${SLAVE_LABELS}" -mode ${SLAVE_MODE}

# USER root

# RUN apk add --update tar && curl -sSL https://get.rvm.io | bash && \
#     source /usr/local/rvm/scripts/rvm && \
#     curl -sSL https://get.rvm.io | bash -s stable --ruby && \
#     rvm install ruby-2.3.3


