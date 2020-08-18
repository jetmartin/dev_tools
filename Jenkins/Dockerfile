FROM jenkins/jenkins:lts

# Install plugins
RUN /usr/local/bin/install-plugins.sh docker-slaves github-branch-source:1.8 blueocean jobgenerator htmlpublisher

USER root

# Mac OS tweek for docker.sock access
# as there is no docker user group, jenkins must be added to root group.
# Add Jenkins user to Root group (docker group)
RUN usermod -aG root jenkins;

# Install xmlstarlet
RUN apt-get update
RUN apt-get install xmlstarlet -y
# Install xslt
RUN mkdir -p /usr/lib/quality/xslt
RUN wget -O /usr/lib/quality/xslt/checkstyle-noframes-severity-sorted.xsl https://raw.githubusercontent.com/checkstyle/contribution/master/xsl/checkstyle-noframes-severity-sorted.xsl
# XSLT from https://github.com/koalaman/shellcheck/wiki/JUnit
COPY quality/xslt/checkstyle2junit.xslt /usr/lib/quality/xslt/checkstyle2junit.xslt

USER jenkins